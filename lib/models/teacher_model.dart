// To parse this JSON data, do
//
//     final teacher = teacherFromJson(jsonString);

import 'dart:convert';

Teacher teacherFromJson(String str) => Teacher.fromJson(json.decode(str));

String teacherToJson(Teacher data) => json.encode(data.toJson());

class Teacher {
  String? uid;
  String? password;
  String? email;
  String? username;
  String? imageId;

  Teacher({
    this.uid,
    this.password,
    this.email,
    this.username,
    this.imageId,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
        uid: json["uid"],
        password: json["password"],
        email: json["email"],
        username: json["username"],
        imageId: json["imageId"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "password": password,
        "email": email,
        "username": username,
        "imageId": imageId,
      };
}
