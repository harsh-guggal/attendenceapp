import 'dart:io';

import 'package:attendenceapp/models/teacher_model.dart';
import 'package:attendenceapp/screens/home/landing_screen.dart';
import 'package:attendenceapp/services/user_services.dart';
import 'package:attendenceapp/utils/alerts.dart';
import 'package:attendenceapp/utils/colors.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool isLoading = false;
  bool isButtonLoading = false;
  bool isImageLoading = false;
  bool isImageSelected = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  Teacher teacher = Teacher();
  File? image;
  String downloadUrl = "";

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    setState(() {
      isLoading = true;
    });
    String id = await UserServices.getCurrentTeacherId();
    teacher = await UserServices.fetchTeacherById(id);
    usernameController.text = teacher.firstName!;
    emailController.text = teacher.email!;
    setState(() {
      isLoading = false;
    });
  }

  imageSelect() async {
    setState(() {
      isImageLoading = true;
      isImageSelected = false;
    });
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 40,
    );
    if (pickedFile != null) {
      isImageSelected = true;
      image = File(pickedFile.path);
      setState(() {});
      uploadImage();
    } else {
      // ignore: use_build_context_synchronously
      showErrorNoti(context, 'Profile', 'Image is not selected');
    }
  }

  uploadImage() async {
    setState(() {
      isImageLoading = true;
    });
    Reference ref =
        FirebaseStorage.instance.ref().child("/teacher").child(teacher.id!);

    await ref.putFile(image!);

    downloadUrl = await ref.getDownloadURL();
    if (kDebugMode) {
      print(downloadUrl);
    }
    Map<String, dynamic> data = {
      'imageId': downloadUrl,
    };
    bool status = await UserServices.updateTeacherData(data, teacher.id!);
    teacher = await UserServices.fetchTeacherById(teacher.id!);
    if (status) {
      // ignore: use_build_context_synchronously
      showSuccessNoti(context, 'Image', 'image is uploaded successfully');
    } else {
      // ignore: use_build_context_synchronously
      showErrorNoti(context, 'Image', 'image uploadation error');
    }
    setState(() {
      isImageLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: BrandColors.appBackColor,
      appBar: AppBar(
        backgroundColor: BrandColors.whiteColor,
        titleSpacing: 0,
        title: const Text(
          "Edit Profile",
          style: TextStyle(
            fontSize: 18,
            fontFamily: "Work Sans",
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: isLoading
            ? SizedBox(
                width: size.width,
                height: size.height / 1.2,
                child: Center(
                  child: CircularProgressIndicator(
                    color: BrandColors.darkBlueColor,
                  ),
                ),
              )
            : Column(
                children: [
                  SizedBox(
                    width: size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        isImageLoading
                            ? SizedBox(
                                width: size.width,
                                height: 50,
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: BrandColors.darkBlueColor,
                                  ),
                                ),
                              )
                            : teacher.avatar == "null"
                                ? Image.asset('assets/images/profile.png')
                                : CircleAvatar(
                                    radius: 70,
                                    backgroundImage: NetworkImage(
                                      teacher.avatar!,
                                      scale: 1,
                                    ),
                                  ),
                        const SizedBox(
                          height: 8,
                        ),
                        InkWell(
                          onTap: () {
                            imageSelect();
                          },
                          child: Text(
                            'Change Photo',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Work Sans",
                              color: BrandColors.darkBlueColor,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: size.width / 10, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Username:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Work Sans",
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: BrandColors.whiteColor,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: BrandColors.greyColor,
                            ),
                          ),
                          width: size.width,
                          child: TextFormField(
                            controller: usernameController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: 'Enter username',
                              hintStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Work Sans",
                                color: BrandColors.greyColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: size.width / 10, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Email:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Work Sans",
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: BrandColors.whiteColor,
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: BrandColors.greyColor,
                            ),
                          ),
                          width: size.width,
                          child: TextFormField(
                            controller: emailController,
                            readOnly: true,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: 'Enter email',
                              hintStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Work Sans",
                                color: BrandColors.greyColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  isButtonLoading
                      ? SizedBox(
                          width: size.width,
                          height: 50,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: BrandColors.darkBlueColor,
                            ),
                          ),
                        )
                      : Container(
                          width: size.width,
                          height: size.height / 15,
                          margin: EdgeInsets.symmetric(
                            horizontal: size.width / 10,
                            vertical: 16,
                          ),
                          child: ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                isButtonLoading = true;
                              });
                              if (usernameController.text.length >= 6) {
                                Map<String, dynamic> data = {
                                  'username': usernameController.text,
                                };
                                await UserServices.updateTeacherData(
                                    data, teacher.id!);
                                // ignore: use_build_context_synchronously
                                showSuccessNoti(context, 'Profile',
                                    'Profile Data updated successfully');
                                // ignore: use_build_context_synchronously
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LandingScreen(),
                                  ),
                                );
                              } else {
                                showErrorNoti(context, 'Profile',
                                    'Username length should be greater than 6');
                              }
                              setState(() {
                                isButtonLoading = false;
                              });
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                BrandColors.darkBlueColor,
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            child: const Text(
                              "Edit",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontFamily: "Work Sans",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                  const SizedBox(
                    height: 24,
                  ),
                ],
              ),
      ),
    );
  }
}
