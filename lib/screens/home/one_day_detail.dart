import 'package:attendenceapp/models/attendence_model.dart';
import 'package:attendenceapp/models/student_model.dart';
import 'package:attendenceapp/screens/home/mark_attendence_screen.dart';
import 'package:attendenceapp/services/user_services.dart';
import 'package:attendenceapp/utils/colors.dart';
import 'package:attendenceapp/utils/pop_ups.dart';
import 'package:flutter/material.dart';

class OneDayDetail extends StatefulWidget {
  const OneDayDetail({super.key, required this.date});
  final String date;

  @override
  State<OneDayDetail> createState() => _OneDayDetailState();
}

class _OneDayDetailState extends State<OneDayDetail> {
  AttendanceModel attendanceModel = AttendanceModel();
  List<Student> listOfStudents = [];
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

    attendanceModel = await UserServices.fetchNDayAttendance(widget.date);
    // print(attendanceModel);
    // print(attendanceModel.attendance!.length);
    if (attendanceModel.date != 'he') {
      for (int i = 0; i < attendanceModel.attendance!.length; i++) {
        listOfStudents.insert(
          i,
          await UserServices.fetchStudentById(
              attendanceModel.attendance![i].studentId!),
        );
      }
    }
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
        titleSpacing: 0,
        title: Text(
          widget.date,
          style: const TextStyle(
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
            : listOfStudents.isEmpty
                ? SizedBox(
                    width: size.width,
                    height: size.height / 1.2,
                    child: Center(
                      child: Text(
                        'No Data',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: BrandColors.darkBlueColor,
                        ),
                      ),
                    ),
                  )
                : Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12),
                    width: size.width,
                    child: RefreshIndicator(
                      onRefresh: () async {
                        await getData();
                      },
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: listOfStudents.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {},
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
                                    child: Image.asset(
                                        'assets/images/person1.png'),
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
                                                  listOfStudents[index].name!,
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
                                                position:
                                                    PopupMenuPosition.under,
                                                surfaceTintColor: Colors.white,
                                                icon:
                                                    const Icon(Icons.more_vert),
                                                onSelected: (int value) {
                                                  if (value == 0) {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            MarkAttendenceScreen(
                                                          date: widget.date,
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
                                                'Class ${listOfStudents[index].studentClass}',
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
                                              Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8,
                                                        vertical: 4),
                                                decoration: BoxDecoration(
                                                  color: attendanceModel
                                                              .attendance![
                                                                  index]
                                                              .status ==
                                                          'Absent'
                                                      ? BrandColors.redColor
                                                      : attendanceModel
                                                                  .attendance![
                                                                      index]
                                                                  .status ==
                                                              'Leave'
                                                          ? BrandColors
                                                              .greyColor
                                                          : BrandColors
                                                              .greenColor,
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                                child: Text(
                                                  attendanceModel
                                                      .attendance![index]
                                                      .status!,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontFamily: "Work Sans",
                                                    fontWeight: FontWeight.w500,
                                                    color:
                                                        BrandColors.whiteColor,
                                                  ),
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
                    ),
                  ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // await UserServices.createAttendance({
          //   'date': widget.date,
          // });
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MarkAttendenceScreen(
                date: widget.date,
              ),
            ),
          );
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        backgroundColor: BrandColors.darkBlueColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.asset('assets/images/personRaiseHand.png'),
        ),
      ),
    );
  }
}
