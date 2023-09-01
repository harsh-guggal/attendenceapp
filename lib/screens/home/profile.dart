import 'package:attendenceapp/models/teacher_model.dart';
import 'package:attendenceapp/screens/home/add_student.dart';
import 'package:attendenceapp/screens/home/edit_profile.dart';
import 'package:attendenceapp/services/user_services.dart';
import 'package:attendenceapp/utils/colors.dart';
import 'package:attendenceapp/utils/pop_ups.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Teacher teacher = Teacher();
  bool isLoading = false;

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
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: BrandColors.appBackColor,
      appBar: AppBar(
        backgroundColor: BrandColors.whiteColor,
        title: const Text(
          'My Profile',
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
                  Container(
                    width: size.width,
                    decoration: BoxDecoration(
                      color: BrandColors.whiteColor,
                    ),
                    child: Column(
                      children: [
                        teacher.imageId == "null"
                            ? Image.asset('assets/images/profile.png')
                            : CircleAvatar(
                                radius: 60,
                                backgroundImage: NetworkImage(
                                  teacher.imageId!,
                                  scale: 2,
                                ),
                              ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          teacher.username!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Work Sans",
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Email : ${teacher.email}',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Work Sans",
                            color: BrandColors.greyColor,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const EditProfile(),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            width: size.width,
                            decoration: BoxDecoration(
                              color: BrandColors.whiteColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: BrandColors.lighBlueColor,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Icon(
                                    Icons.person,
                                    color: BrandColors.darkBlueColor,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                const Expanded(
                                  child: Text(
                                    'Edit Profile',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Work Sans",
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 20,
                                  color: BrandColors.greyColor,
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        InkWell(
                          onTap: () {
                            print(teacher.imageId);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            width: size.width,
                            decoration: BoxDecoration(
                              color: BrandColors.whiteColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: BrandColors.lighBlueColor,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Icon(
                                    Icons.groups_2_rounded,
                                    color: BrandColors.darkBlueColor,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                const Expanded(
                                  child: Text(
                                    'All Students',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Work Sans",
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 20,
                                  color: BrandColors.greyColor,
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AddStudent(
                                  isEdit: false,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            width: size.width,
                            decoration: BoxDecoration(
                              color: BrandColors.whiteColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: BrandColors.lighBlueColor,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Icon(
                                    Icons.person_add_alt_1_rounded,
                                    color: BrandColors.darkBlueColor,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                const Expanded(
                                  child: Text(
                                    'Add Student',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Work Sans",
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 20,
                                  color: BrandColors.greyColor,
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          width: size.width,
                          decoration: BoxDecoration(
                            color: BrandColors.whiteColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: BrandColors.lighBlueColor,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Icon(
                                  Icons.contact_support,
                                  color: BrandColors.darkBlueColor,
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              const Expanded(
                                child: Text(
                                  'Customer Support',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Work Sans",
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 20,
                                color: BrandColors.greyColor,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        InkWell(
                          onTap: () {
                            showSignOutPopUp(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            width: size.width,
                            decoration: BoxDecoration(
                              color: BrandColors.whiteColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color:
                                        BrandColors.redColor.withOpacity(0.08),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Icon(
                                    Icons.logout_rounded,
                                    color: BrandColors.redColor,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                const Text(
                                  'Sign Out',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Work Sans",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
