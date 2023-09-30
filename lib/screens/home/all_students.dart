import 'package:attendenceapp/models/student_model.dart';
import 'package:attendenceapp/models/teacher_model.dart';
import 'package:attendenceapp/screens/home/add_student.dart';
import 'package:attendenceapp/screens/home/student_detail_screen.dart';
import 'package:attendenceapp/screens/home/student_search.dart';
import 'package:attendenceapp/services/user_services.dart';
import 'package:attendenceapp/utils/colors.dart';
import 'package:attendenceapp/utils/pop_ups.dart';
import 'package:flutter/material.dart';

class AllStudents extends StatefulWidget {
  const AllStudents({super.key});

  @override
  State<AllStudents> createState() => _AllStudentsState();
}

class _AllStudentsState extends State<AllStudents> {
  Teacher teacher = Teacher();
  List<Student> list = [];
  bool isLoading = false;
  getData() async {
    setState(() {
      isLoading = true;
    });
    String id = await UserServices.getCurrentTeacherId();
    teacher = await UserServices.fetchTeacherById(id);
    list = await UserServices.fetchOneTeacherAllStudents(teacher.id!);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: BrandColors.appBackColor,
      appBar: AppBar(
        backgroundColor: BrandColors.whiteColor,
        title: const Text(
          'All Students',
          style: TextStyle(
            fontSize: 18,
            fontFamily: "Work Sans",
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const StudentSearchScreen(),
                ),
              );
            },
            child: Icon(
              Icons.search,
              color: BrandColors.greyColor,
            ),
          ),
          const SizedBox(
            width: 16,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: isLoading
            ? SizedBox(
                width: size.width,
                height: size.height / 1.3,
                child: Center(
                  child: CircularProgressIndicator(
                    color: BrandColors.darkBlueColor,
                  ),
                ),
              )
            : Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                width: size.width,
                child: Column(
                  children: [
                    InkWell(
                      onTap: () async {
                        await UserServices.fetchStudentByname('hars');
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: size.height / 50),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: BrandColors.darkBlueColor,
                        ),
                        child: Center(
                          child: Text(
                            'Total Students: ${list.length}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Work Sans",
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
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
                        width: size.width,
                        height: size.height / 15,
                        decoration: BoxDecoration(
                          color: BrandColors.lighBlueColor,
                          border: Border.all(
                            color: BrandColors.darkBlueColor,
                          ),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                color: BrandColors.darkBlueColor,
                              ),
                              Text(
                                'Add New Student',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: BrandColors.darkBlueColor,
                                  fontFamily: "Work Sans",
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: list.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StudentDetailScreen(
                                  student: list[index],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: size.width,
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: BrandColors.whiteColor,
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: BrandColors.greyColor,
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: 90,
                                  width: 90,
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    // color: BrandColors.lighBlueColor,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child:
                                      Image.asset('assets/images/person1.png'),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 4),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                list[index].name!,
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: "Work Sans",
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 16,
                                            ),
                                            PopupMenuButton(
                                              padding: const EdgeInsets.only(
                                                  left: 0),
                                              position: PopupMenuPosition.under,
                                              surfaceTintColor: Colors.white,
                                              icon: const Icon(Icons.more_vert),
                                              onSelected: (int value) {
                                                if (value == 0) {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          const AddStudent(
                                                        isEdit: true,
                                                      ),
                                                    ),
                                                  );
                                                } else {
                                                  showRemoveStudentPopUp(
                                                      context);
                                                }
                                              },
                                              itemBuilder: (context) => [
                                                PopupMenuItem(
                                                  value: 0,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Image.asset(
                                                        "assets/images/edit.png",
                                                        width: 20,
                                                        height: 20,
                                                      ),
                                                      const SizedBox(
                                                        width: 8,
                                                      ),
                                                      const Text("Edit"),
                                                    ],
                                                  ),
                                                ),
                                                PopupMenuItem(
                                                  value: 1,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Image.asset(
                                                        "assets/images/delete.png",
                                                        width: 20,
                                                        height: 20,
                                                      ),
                                                      const SizedBox(
                                                        width: 8,
                                                      ),
                                                      const Text("Remove"),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Class ${list[index].studentClass}',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: "Work Sans",
                                                color: BrandColors.greyColor,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              'Fees : ₹ ${list[index].fees}',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: "Work Sans",
                                                color:
                                                    BrandColors.darkBlueColor,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
