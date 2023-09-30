import 'package:attendenceapp/models/attendence_model.dart';
import 'package:attendenceapp/models/student_model.dart';
import 'package:attendenceapp/models/teacher_model.dart';
import 'package:attendenceapp/services/user_services.dart';
import 'package:attendenceapp/utils/colors.dart';
import 'package:flutter/material.dart';

class MarkAttendenceScreen extends StatefulWidget {
  const MarkAttendenceScreen({super.key, required this.date});
  final String date;

  @override
  State<MarkAttendenceScreen> createState() => _MarkAttendenceScreenState();
}

class _MarkAttendenceScreenState extends State<MarkAttendenceScreen> {
  // Initial Selected Value
  String dropdownvalue = 'Select Student';

  // List of items in our dropdown menu
  var items = [
    'Select Student',
  ];
  String reason = "Present";

  Teacher teacher = Teacher();
  AttendanceModel previousAttendance = AttendanceModel();
  bool isCreated = false;
  List<Student> list = [];
  bool isLoading = false;
  getData() async {
    setState(() {
      isLoading = true;
    });
    String id = await UserServices.getCurrentTeacherId();
    teacher = await UserServices.fetchTeacherById(id);
    list = await UserServices.fetchOneTeacherAllStudents(teacher.id!);
    isCreated = await UserServices.isDateDocCreated(widget.date);
    print(isCreated);
    print(widget.date);
    if (isCreated) {
      print('date is already created in getData --------------------');
      previousAttendance = await UserServices.fetchNDayAttendance(widget.date);
      print(previousAttendance.date);
    }
    for (int i = 0; i < list.length; i++) {
      items.add(list[i].name!);
    }
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
        titleSpacing: 0,
        title: const Text(
          'Mark Attendence',
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
            : Container(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // GridView.builder(
                    //   shrinkWrap: true,
                    //   itemCount:
                    //       isCreated ? previousAttendance.attendance!.length : 0,
                    //   gridDelegate:
                    //       const SliverGridDelegateWithFixedCrossAxisCount(
                    //     crossAxisCount: 2,
                    //     mainAxisSpacing: 10,
                    //     crossAxisSpacing: 10,
                    //     childAspectRatio: 5,
                    //   ),
                    //   itemBuilder: (context, index) {
                    //     return Container(
                    //       padding: const EdgeInsets.symmetric(
                    //           horizontal: 6, vertical: 4),
                    //       decoration: BoxDecoration(
                    //         color: BrandColors.greenColor,
                    //         borderRadius: BorderRadius.circular(8),
                    //       ),
                    //       child: Row(
                    //         mainAxisSize: MainAxisSize.min,
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         children: [
                    //           Text(
                    //             previousAttendance.attendance![index].status!,
                    //             style: TextStyle(
                    //               fontSize: 14,
                    //               fontWeight: FontWeight.w500,
                    //               color: BrandColors.whiteColor,
                    //             ),
                    //           ),
                    //           const SizedBox(
                    //             width: 12,
                    //           ),
                    //           Icon(
                    //             Icons.check_circle,
                    //             color: BrandColors.whiteColor,
                    //           ),
                    //         ],
                    //       ),
                    //     );
                    //   },
                    // ),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      'Student',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Work Sans",
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width / 40,
                      ),
                      width: size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          width: 0.5,
                          color: BrandColors.greyColor,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: DropdownButton(
                          isExpanded: true,
                          underline: Container(),
                          // Initial Value
                          value: dropdownvalue,
                          // Down Arrow Icon
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: Color.fromRGBO(0, 0, 0, 0.6),
                          ),
                          // Array list of items
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Container(
                                width: size.width / 2,
                                padding: EdgeInsets.symmetric(
                                  horizontal: size.width / 50,
                                  vertical: size.height / 100,
                                ),
                                child: Text(
                                  items,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Poppins",
                                    color: Color.fromRGBO(134, 136, 137, 1),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: BrandColors.whiteColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            contentPadding: const EdgeInsets.all(0),
                            horizontalTitleGap: 0,
                            title: Text(
                              'Present',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                color: BrandColors.greyColor,
                              ),
                            ),
                            leading: Radio(
                              fillColor: MaterialStatePropertyAll(
                                  BrandColors.greenColor),
                              value: "Present",
                              groupValue: reason,
                              onChanged: (value) {
                                setState(() {
                                  reason = value!;
                                });
                              },
                            ),
                          ),
                          ListTile(
                            contentPadding: const EdgeInsets.all(0),
                            horizontalTitleGap: 0,
                            title: Text(
                              'Absent',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                color: BrandColors.greyColor,
                              ),
                            ),
                            leading: Radio(
                              fillColor: MaterialStatePropertyAll(
                                  BrandColors.redColor),
                              value: "Absent",
                              groupValue: reason,
                              onChanged: (value) {
                                setState(() {
                                  reason = value!;
                                });
                              },
                            ),
                          ),
                          ListTile(
                            contentPadding: const EdgeInsets.all(0),
                            horizontalTitleGap: 0,
                            title: Text(
                              'Leave',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                color: BrandColors.greyColor,
                              ),
                            ),
                            leading: Radio(
                              fillColor: MaterialStatePropertyAll(
                                  BrandColors.greyColor),
                              value: "Leave",
                              groupValue: reason,
                              onChanged: (value) {
                                setState(() {
                                  reason = value!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    SizedBox(
                      width: size.width,
                      height: size.height / 15,
                      child: ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });
                          Student student =
                              await UserServices.fetchStudentByname(
                                  dropdownvalue);

                          if (isCreated == false) {
                            print('--------not created--------------');
                            Map<String, dynamic> data = {
                              'date': widget.date,
                              'teacherId': teacher.id,
                              'attendance': [
                                {
                                  'status': reason,
                                  'studentId': student.uid,
                                }
                              ],
                            };
                            await UserServices.createAttendance(data);
                          } else {
                            print('--------already created--------------');
                            List<Map<String, dynamic>> l = [];
                            for (int i = 0;
                                i < previousAttendance.attendance!.length;
                                i++) {
                              l.insert(i, {
                                'status':
                                    previousAttendance.attendance![i].status,
                                'studentId':
                                    previousAttendance.attendance![i].studentId,
                              });
                            }
                            l.insert(previousAttendance.attendance!.length, {
                              'status': reason,
                              'studentId': student.uid,
                            });
                            Map<String, dynamic> data = {
                              'date': widget.date,
                              'teacherId': teacher.id,
                              'attendance': l,
                            };
                            await UserServices.updateAttendance(data);
                          }
                          setState(() {
                            dropdownvalue = 'Select Student';
                            items = [
                              'Select Student',
                            ];

                            reason = "Present";
                            isLoading = false;
                          });
                          getData();
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            BrandColors.darkBlueColor,
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        child: const Text(
                          'Submit',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontFamily: "Work Sans",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
