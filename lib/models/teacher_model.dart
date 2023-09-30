// To parse this JSON data, do
//
//     final teacher = teacherFromJson(jsonString);

import 'dart:convert';

Teacher teacherFromJson(String str) => Teacher.fromJson(json.decode(str));

String teacherToJson(Teacher data) => json.encode(data.toJson());

class Teacher {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  dynamic avatar;
  dynamic location;
  dynamic title;
  dynamic description;
  dynamic tags;
  dynamic language;
  String? theme;
  dynamic tfaSecret;
  bool? emailNotifications;
  String? status;
  String? role;
  dynamic token;
  dynamic lastPage;
  DateTime? lastAccess;

  Teacher({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.avatar,
    this.location,
    this.title,
    this.description,
    this.tags,
    this.language,
    this.theme,
    this.tfaSecret,
    this.emailNotifications,
    this.status,
    this.role,
    this.token,
    this.id,
    this.lastPage,
    this.lastAccess,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        password: json["password"],
        avatar: json["avatar"],
        location: json["location"],
        title: json["title"],
        description: json["description"],
        tags: json["tags"],
        language: json["language"],
        theme: json["theme"],
        tfaSecret: json["tfa_secret"],
        emailNotifications: json["email_notifications"],
        status: json["status"],
        role: json["role"],
        token: json["token"],
        id: json["id"],
        lastPage: json["last_page"],
        lastAccess: json["last_access"] == null
            ? null
            : DateTime.parse(json["last_access"]),
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "password": password,
        "avatar": avatar,
        "location": location,
        "title": title,
        "description": description,
        "tags": tags,
        "language": language,
        "theme": theme,
        "tfa_secret": tfaSecret,
        "email_notifications": emailNotifications,
        "status": status,
        "role": role,
        "token": token,
        "id": id,
        "last_page": lastPage,
        "last_access": lastAccess?.toIso8601String(),
      };
}
