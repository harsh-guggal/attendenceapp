import 'package:attendenceapp/models/attendence_model.dart';
import 'package:attendenceapp/models/student_model.dart';
import 'package:attendenceapp/models/teacher_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserServices {
  static dynamic getCurrentTeacherId() async {
    User? user = await FirebaseAuth.instance.currentUser;
    return user!.uid;
  }

  static Future<Teacher> fetchTeacherById(String id) async {
    Teacher teacher = Teacher();
    await FirebaseFirestore.instance
        .collection('teachers')
        .doc(id)
        .get()
        .then((value) {
      print(value.data());
      teacher = Teacher.fromJson(value.data()!);
      // print(teacher.password);
    }).onError((error, stackTrace) {
      print('error ${error.toString()}');
    });
    return teacher;
  }

  static Future<Student> fetchStudentById(String id) async {
    Student student = Student();
    await FirebaseFirestore.instance
        .collection('students')
        .doc(id)
        .get()
        .then((value) {
      print(value.data());
      student = Student.fromJson(value.data()!);
      // print(teacher.password);
    }).onError((error, stackTrace) {
      print('error ${error.toString()}');
    });
    return student;
  }

  static dynamic updateTeacherData(Map<String, dynamic> data, String id) async {
    bool status = false;

    await FirebaseFirestore.instance
        .collection('teachers')
        .doc(id)
        .update(data)
        .then((value) {
      status = true;
    }).onError((error, stackTrace) {
      status = false;
      print('error ${error.toString()}');
    });
    return status;
  }

  static Future<dynamic> fetchOneTeacherAllStudents(String id) async {
    List<Student> listOfStudents = [];
    var teacher = await fetchTeacherById(id);
    for (int i = 0; i < teacher.students!.length; i++) {
      var student = await fetchStudentById(teacher.students![i]);
      listOfStudents.insert(i, student);
    }
    return listOfStudents;
  }

  static Future<dynamic> fetchStudentByname(String name) async {
    Student student = Student();
    await FirebaseFirestore.instance
        .collection('students')
        .where('name', isEqualTo: name)
        .get()
        .then((value) {
      print(value.docs[0].data());
      student = Student.fromJson(value.docs[0].data());
    }).onError((error, stackTrace) {
      print('error ${error.toString()}');
    });
    return student;
  }

  static Future<AttendanceModel> fetchNDayAttendance(String date) async {
    print('fecthN day atendance called ----------->');
    AttendanceModel listOfAttendance = AttendanceModel();
    bool isfetched = false;
    await FirebaseFirestore.instance
        .collection('dates')
        .doc(date)
        .get()
        .then((value) async {
      print(value.data());
      listOfAttendance = AttendanceModel.fromJson(value.data()!);
      print(listOfAttendance.date);
      isfetched = true;
    }).onError((error, stackTrace) {
      print('error ${error.toString()}');
    });
    print(listOfAttendance.date);
    return isfetched ? listOfAttendance : AttendanceModel(date: 'he');
  }

  static Future<dynamic> createAttendance(Map<String, dynamic> data) async {
    await FirebaseFirestore.instance
        .collection('dates')
        .doc(data['date'])
        .set(data)
        .then((value) {
      print('<---------------attenece added successfully--------------->');
    }).onError((error, stackTrace) {
      print('error is ${error.toString()}');
    });
  }

  static Future<dynamic> updateAttendance(Map<String, dynamic> data) async {
    await FirebaseFirestore.instance
        .collection('dates')
        .doc(data['date'])
        .update(data)
        .then((value) {
      print('<---------------attenece updated successfully--------------->');
    }).onError((error, stackTrace) {
      print('error is ${error.toString()}');
    });
  }

  static Future<dynamic> isDateDocCreated(String date) async {
    print('isDocCreated ---------->');
    bool isCre = false;
    await FirebaseFirestore.instance
        .collection('dates')
        .doc(date)
        .get()
        .then((value) {
      print('inside then in docCreated func');
      value.data() == null ? isCre = false : isCre = true;
    });
    print(isCre);
    return isCre;
  }

  static Future<dynamic> getNumberOfPresents(
      AttendanceModel attendanceModel) async {
    int present = 0;
    for (int i = 0; i < attendanceModel.attendance!.length; i++) {
      if (attendanceModel.attendance![i].status == 'Present') {
        present = present + 1;
      }
    }
    return present;
  }

  static Future<dynamic> getNumberOfAbsents(
      AttendanceModel attendanceModel) async {
    int absent = 0;
    for (int i = 0; i < attendanceModel.attendance!.length; i++) {
      if (attendanceModel.attendance![i].status == 'Absent') {
        absent = absent + 1;
      }
    }
    return absent;
  }

  static Future<dynamic> getNumberOfLeave(
      AttendanceModel attendanceModel) async {
    int leave = 0;
    for (int i = 0; i < attendanceModel.attendance!.length; i++) {
      if (attendanceModel.attendance![i].status == 'Leave') {
        leave = leave + 1;
      }
    }
    return leave;
  }
}
