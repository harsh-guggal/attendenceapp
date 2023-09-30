import 'dart:convert';

import 'package:attendenceapp/models/teacher_model.dart';
import 'package:attendenceapp/screens/auth_flow/login_screen.dart';
import 'package:attendenceapp/screens/auth_flow/welcome_screen.dart';
import 'package:attendenceapp/screens/home/landing_screen.dart';
import 'package:attendenceapp/services/base_services.dart';
import 'package:attendenceapp/services/user_services.dart';
import 'package:attendenceapp/utils/alerts.dart';
import 'package:attendenceapp/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  // static Future createStudent(
  //     Map<String, dynamic> data, BuildContext context) async {
  //   await FirebaseFirestore.instance
  //       .collection('students')
  //       .doc(data['uid'])
  //       .set(data)
  //       .then((value) {
  //     if (kDebugMode) {
  //       showSuccessNoti(context, 'Student', 'student added successfully');
  //       print('<------------------student in created in firestore----------->');
  //     }
  //   }).onError((error, stackTrace) {
  //     if (kDebugMode) {
  //       print(
  //           '<------------------error in creating student in firestore-----------> ${error.toString()}');
  //     }
  //   });
  // }

  static Future<void> serverSignIn(email, password, context) async {
    try {
      var resp = await BaseService.makeUnauthenticatedRequest(
        "${BaseService.BASE_URL}/auth/login",
        method: 'POST',
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );
      if (resp.statusCode == 200) {
        var data = jsonDecode(resp.body);
        if (kDebugMode) {
          print("data: $data");
        }
        Teacher? user = await UserServices.fetchUserByEmail(email);
        BaseService.saveToken(
          data['data']['access_token'],
          data['data']['refresh_token'],
          user!.toJson(),
        );
        showAlert(BrandColors.darkBlueColor, context, 'Login Successfull');
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const LandingScreen(),
          ),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
        // Fluttertoast.showToast(
        //     msg: "Sign In Failed, User Doesn't Exists, Please Sign Up!");
      }
    } catch (e) {
      if (kDebugMode) {
        print("error: $e");
      }
      return;
    }
  }

  static Future<void> serverSignUp(payload, context) async {
    try {
      var resp = await BaseService.makeUnauthenticatedRequest(
        "${BaseService.BASE_URL}/users",
        method: 'POST',
        body: jsonEncode(payload),
      );
      if (resp.statusCode == 200) {
        var data = jsonDecode(resp.body);
        if (kDebugMode) {
          print("data: $data");
        }
        await serverSignIn(payload['email'], payload['password'], context);
      } else {
        print(resp.reasonPhrase);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
        // Fluttertoast.showToast(msg: "Sign Up Failed, Please Try Again!");
      }
    } catch (e) {
      if (kDebugMode) {
        print("error: $e");
      }
      return;
    }
  }

  static Future<void>? logOut(context) {
    SharedPreferences.getInstance().then((value) {
      value.setBool("isLogin", false);

      showSuccessNoti(context, 'Authentication', 'Logout successfully');
      // Provider.of<BottomNavProvider>(context, listen: false).selectedScreen = 0;
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const WelcomeScreen(),
          ),
          (route) => false);
    });
    FirebaseAuth.instance.signOut();
    return null;
  }
}
