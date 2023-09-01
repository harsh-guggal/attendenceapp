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
}
