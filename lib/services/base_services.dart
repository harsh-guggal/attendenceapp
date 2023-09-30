// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:attendenceapp/models/teacher_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class BaseService {
  // ignore: constant_identifier_names
  static const BASE_URL = "http://10.0.2.2:8055";
  static final Map<String, String> headers = {
    "Content-Type": "application/json"
  };

  static Map<String, dynamic> authDetails = {};

  static Future<http.Response> makeUnauthenticatedRequest(String url,
      {String method = 'GET',
      body,
      mergeDefaultHeader = true,
      Map<String, String>? extraHeaders}) async {
    try {
      if (kDebugMode) {
        print("$method URL: $url");
      }
      extraHeaders ??= {};
      var sentHeaders =
          mergeDefaultHeader ? {...headers, ...extraHeaders} : extraHeaders;

      switch (method) {
        case 'POST':
          body ??= {};
          return http.post(Uri.parse(url), headers: headers, body: body);

        case 'GET':
          return http.get(Uri.parse(url), headers: headers);

        case 'PUT':
          return http.put(Uri.parse(url), headers: sentHeaders, body: body);

        case 'PATCH':
          return http.patch(Uri.parse(url), headers: sentHeaders, body: body);

        case 'DELETE':
          return http.delete(Uri.parse(url), headers: sentHeaders, body: body);

        default:
          return http.post(Uri.parse(url), headers: sentHeaders, body: body);
      }
    } catch (err) {
      rethrow;
    }
  }

  static Future<http.Response> makeAuthenticatedRequest(String url,
      {String method = 'GET',
      body,
      mergeDefaultHeader = true,
      Map<String, String>? extraHeaders}) async {
    try {
      if (kDebugMode) {
        print("Authenticated: $method URL: $url");
      }
      Map<String, dynamic> auth = await getSavedAuth();
      await refreshAuth();
      var sentHeaders = mergeDefaultHeader
          ? {
              ...BaseService.headers,
              "Authorization": "Bearer ${auth['access_token']}"
            }
          : extraHeaders;
      switch (method) {
        case 'POST':
          body ??= {};
          return http.post(Uri.parse(url), headers: sentHeaders, body: body);

        case 'GET':
          return http.get(Uri.parse(url), headers: sentHeaders);

        case 'PUT':
          return http.put(Uri.parse(url), headers: sentHeaders, body: body);

        case 'PATCH':
          return http.patch(Uri.parse(url), headers: sentHeaders, body: body);

        case 'DELETE':
          return http.delete(Uri.parse(url), headers: sentHeaders);

        default:
          return http.post(Uri.parse(url), headers: sentHeaders, body: body);
      }
    } catch (err) {
      rethrow;
    }
  }

  static Future<Map<String, dynamic>> getSavedAuth() async {
    if (authDetails.isNotEmpty) {
      if (kDebugMode) {
        print('access_token: ' + authDetails['access_token']);
        print('refresh_token: ' + authDetails['refresh_token']);
      }
      return authDetails;
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, dynamic> auth = prefs.getString("auth") != null
        ? json.decode(prefs.getString("auth")!)
        : {};

    authDetails = auth;
    return auth;
  }

  static updateUser(Teacher user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    authDetails['user'] = user.toJson();
    await prefs.setString(
      "auth",
      json.encode(authDetails),
    );
  }

  static Future<Teacher?> getCurrentUser() async {
    // if (kDebugMode) {
    //   print(
    //       "------------------------------getCurrentUser called----------------------");
    // }
    Map<String, dynamic> auth = await getSavedAuth();
    // if (kDebugMode) {
    //   print("auth['user'] -> ${auth['user']}");
    // }
    return auth.isEmpty ? null : Teacher.fromJson(auth['user']);
  }

  static saveToken(
      String accessToken, String refreshToken, dynamic user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    authDetails = {
      "access_token": accessToken,
      "refresh_token": refreshToken,
      "expires_in": DateTime.now()
          .add(
            const Duration(minutes: 5),
          )
          .millisecondsSinceEpoch
          .toString(),
      "user": user,
    };
    if (kDebugMode) {
      print('saving authDetails: $authDetails');
    }
    await prefs.setBool(
      "isLogin",
      true,
    );
    await prefs.setString(
      "auth",
      json.encode(authDetails),
    );
  }

  static Future refreshAuth({bool force = false}) async {
    DateTime expiresAt = DateTime.fromMillisecondsSinceEpoch(int.parse(
        authDetails['expires_in'] ??
            DateTime.now()
                .subtract(const Duration(minutes: 55))
                .millisecondsSinceEpoch
                .toString()));
    print("expiresAt: $expiresAt force: $force");
    if (expiresAt.isAfter(DateTime.now()) && !force) {
      if (kDebugMode) {
        print("---- token has not expired yet ----");
      }
      return;
    } else {
      if (kDebugMode) {
        print("---- token is expired ----");
      }
      var payload = json.encode({
        'refresh_token': authDetails['refresh_token'],
      });
      if (kDebugMode) {
        print(payload);
      }
      http.Response response = await BaseService.makeUnauthenticatedRequest(
        '${BaseService.BASE_URL}/auth/refresh',
        body: payload,
        method: 'POST',
        extraHeaders: {},
      );
      Map<String, dynamic> responseMap = json.decode(response.body);
      if (kDebugMode) {
        print(responseMap);
      }
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print("---- token refreshed ----");
        }
        await getCurrentUser().then((Teacher? value) async {
          await saveToken(
            responseMap['data']['access_token'],
            responseMap['data']['refresh_token'],
            value!.toJson(),
          );
        });
      } else {
        if (kDebugMode) {
          print(responseMap['errors']);
        }
        await FirebaseAuth.instance.signOut();
        var prefs = await SharedPreferences.getInstance();
        await prefs.clear();
      }
    }
  }
}
