// To parse this JSON data, do
//
//     final student = studentFromJson(jsonString);

import 'dart:convert';

Student studentFromJson(String str) => Student.fromJson(json.decode(str));

String studentToJson(Student data) => json.encode(data.toJson());

class Student {
  String? uid;
  String? fees;
  String? teacherId;
  String? imageId;
  String? contactNumber;
  String? name;
  String? joiningDate;
  String? studentClass;

  Student({
    this.uid,
    this.fees,
    this.teacherId,
    this.imageId,
    this.contactNumber,
    this.name,
    this.joiningDate,
    this.studentClass,
  });

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        uid: json["uid"],
        fees: json["fees"],
        teacherId: json["teacherId"],
        imageId: json["imageId"],
        contactNumber: json["contactNumber"],
        name: json["name"],
        joiningDate: json["joiningDate"],
        studentClass: json["class"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "fees": fees,
        "teacherId": teacherId,
        "imageId": imageId,
        "contactNumber": contactNumber,
        "name": name,
        "joiningDate": joiningDate,
        "class": studentClass,
      };
}
