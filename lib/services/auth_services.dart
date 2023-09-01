import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthServices {
  static Future<bool> createUser(
      String username, String email, String password) async {
    bool status = false;

    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      if (kDebugMode) {
        print('<------------------user in created-----------> $value');
      }
      await createFirestoreUser(username, value, email, password);
      await loginUser(email, password);
      status = true;
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(
            '<------------------error in creating user -----------> ${error.toString()}');
      }
      status = false;
    });

    return status;
  }

  static Future createFirestoreUser(String username, UserCredential user,
      String email, String password) async {
    Map<String, dynamic> data = {
      "uid": user.user!.uid,
      "username": username,
      "email": email,
      "password": password,
    };
    await FirebaseFirestore.instance
        .collection('teachers')
        .doc(user.user!.uid)
        .set(data)
        .then((value) {
      if (kDebugMode) {
        print('<------------------user in created in firestore----------->');
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(
            '<------------------error in creating user in firestore-----------> ${error.toString()}');
      }
    });
  }

  static Future<bool> loginUser(String email, String password) async {
    bool status = false;

    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      if (kDebugMode) {
        print('<----------------logged in-----------> $value');
      }
      status = true;
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(
            '<----------------error in login-----------> ${error.toString()}');
      }
      status = false;
    });

    return status;
  }

  static Future logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
