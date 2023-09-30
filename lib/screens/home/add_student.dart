import 'package:attendenceapp/models/student_model.dart';
import 'package:attendenceapp/models/teacher_model.dart';
import 'package:attendenceapp/services/auth_services.dart';
import 'package:attendenceapp/services/user_services.dart';
import 'package:attendenceapp/utils/alerts.dart';
import 'package:attendenceapp/utils/colors.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({super.key, required this.isEdit});
  final bool isEdit;

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  Teacher teacher = Teacher();
  List<DateTime?> _dateRange = [];
  // Initial Selected Value
  String dropdownvalue = '1st';

  // List of items in our dropdown menu
  var items = [
    '1st',
    '2nd',
    '3rd',
    '4rth',
    '5th',
    '6th',
    '7th',
    '8th',
    '9th',
    '10th',
  ];

  TextEditingController nameController = TextEditingController();

  TextEditingController feesController = TextEditingController();

  TextEditingController numberController = TextEditingController();
  bool isButtonLoading = false;

  getData() async {
    String id = await UserServices.getCurrentTeacherId();
    teacher = await UserServices.fetchTeacherById(id);
    setState(() {});
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
        title: Text(
          widget.isEdit ? "Edit Student" : 'Add Student',
          style: const TextStyle(
            fontSize: 18,
            fontFamily: "Work Sans",
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Image.asset('assets/images/profile.png'),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Change Photo',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Work Sans",
                      color: BrandColors.darkBlueColor,
                      decoration: TextDecoration.underline,
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
                    'Name:',
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
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: 'Enter name',
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
                  horizontal: size.width / 10, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Class:',
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
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width / 40,
                    ),
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        width: 1,
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
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: size.width / 10, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Fees:',
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
                      controller: feesController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: 'Enter fees',
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
                  horizontal: size.width / 10, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Date:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Work Sans",
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  InkWell(
                    onTap: () async {
                      final value = await showCalendarDatePicker2Dialog(
                        context: context,
                        config: CalendarDatePicker2WithActionButtonsConfig(
                          firstDayOfWeek: 1,
                          calendarType: CalendarDatePicker2Type.single,
                          selectedDayTextStyle: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w700),
                          selectedDayHighlightColor:
                              Theme.of(context).primaryColor,
                        ),
                        dialogSize: const Size(325, 400),
                        borderRadius: BorderRadius.circular(15),
                        value: _dateRange,
                        dialogBackgroundColor: Colors.white,
                      );
                      if (value != null) {
                        setState(() {
                          _dateRange = value;
                        });
                        if (kDebugMode) {
                          print(value);
                        }
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 16),
                      decoration: BoxDecoration(
                        color: BrandColors.whiteColor,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: BrandColors.greyColor,
                        ),
                      ),
                      width: size.width,
                      child: Text(
                        _dateRange.isEmpty
                            ? 'Select date'
                            : DateFormat("dd MMMM yyyy").format(_dateRange[0]!),
                        style: TextStyle(
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
                  horizontal: size.width / 10, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Contact Number:',
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
                      controller: numberController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: 'Enter number',
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
            const SizedBox(
              height: 12,
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
                    ),
                    child: ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          isButtonLoading = true;
                        });
                        if (widget.isEdit) {
                          // edit
                        } else {
                          // add
                          var student = await UserServices.fetchStudentByname(
                              nameController.text);
                          if (student.uid == null) {
                            if (nameController.text.isNotEmpty &&
                                feesController.text.isNotEmpty &&
                                _dateRange.isNotEmpty &&
                                numberController.text.length == 10) {
                              String uid = const Uuid().v4();
                              Map<String, dynamic> data = {
                                'uid': uid,
                                'name': nameController.text,
                                'class': dropdownvalue,
                                'fees': feesController.text,
                                'joiningDate': DateFormat("dd MMMM yyyy")
                                    .format(_dateRange[0]!),
                                'contactNumber': numberController.text,
                                'teacherId': teacher.id,
                                'imageId': 'null',
                              };
                              // List<String> s = teacher.students!;
                              // s.insert(teacher.students!.length, uid);
                              // Map<String, dynamic> data1 = {
                              //   'students': s,
                              // };
                              // ignore: use_build_context_synchronously
                              // await AuthServices.createStudent(data, context);
                              // await UserServices.updateTeacherData(
                              //   data1,
                              //   teacher.uid!,
                              // );
                            } else {
                              // ignore: use_build_context_synchronously
                              showErrorNoti(
                                  context, 'Error', 'please fill all fields');
                            }
                          } else {
                            // ignore: use_build_context_synchronously
                            showErrorNoti(context, 'Error',
                                'this name student already exists');
                          }
                        }
                        await getData();
                        setState(() {
                          isButtonLoading = false;
                        });
                        // ignore: use_build_context_synchronously
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const LandingScreen(),
                        //   ),
                        // );
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
                      child: Text(
                        widget.isEdit ? "Edit" : 'ADD',
                        style: const TextStyle(
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
