// To parse this JSON data, do
//
//     final attendanceModel = attendanceModelFromJson(jsonString);

import 'dart:convert';

AttendanceModel attendanceModelFromJson(String str) =>
    AttendanceModel.fromJson(json.decode(str));

String attendanceModelToJson(AttendanceModel data) =>
    json.encode(data.toJson());

class AttendanceModel {
  String? date;
  String? teacherId;
  List<Attendance>? attendance;

  AttendanceModel({
    this.date,
    this.teacherId,
    this.attendance,
  });

  factory AttendanceModel.fromJson(Map<String, dynamic> json) =>
      AttendanceModel(
        date: json["date"],
        teacherId: json["teacherId"],
        attendance: json["attendance"] == null
            ? []
            : List<Attendance>.from(
                json["attendance"]!.map((x) => Attendance.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "teacherId": teacherId,
        "attendance": attendance == null
            ? []
            : List<dynamic>.from(attendance!.map((x) => x.toJson())),
      };
}

class Attendance {
  String? status;
  String? studentId;

  Attendance({
    this.status,
    this.studentId,
  });

  factory Attendance.fromJson(Map<String, dynamic> json) => Attendance(
        status: json["status"],
        studentId: json["studentId"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "studentId": studentId,
      };
}
