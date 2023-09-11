// To parse this JSON data, do
//
//     final teacher = teacherFromJson(jsonString);

import 'dart:convert';

Teacher teacherFromJson(String str) => Teacher.fromJson(json.decode(str));

String teacherToJson(Teacher data) => json.encode(data.toJson());

class Teacher {
  String? uid;
  String? password;
  String? imageId;
  List<String>? students;
  String? email;
  String? username;

  Teacher({
    this.uid,
    this.password,
    this.imageId,
    this.students,
    this.email,
    this.username,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
        uid: json["uid"],
        password: json["password"],
        imageId: json["imageId"],
        students: json["students"] == null
            ? []
            : List<String>.from(json["students"]!.map((x) => x)),
        email: json["email"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "password": password,
        "imageId": imageId,
        "students":
            students == null ? [] : List<dynamic>.from(students!.map((x) => x)),
        "email": email,
        "username": username,
      };
}
