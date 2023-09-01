import 'package:attendenceapp/utils/colors.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

class StudentDetailScreen extends StatefulWidget {
  const StudentDetailScreen({super.key});

  @override
  State<StudentDetailScreen> createState() => _StudentDetailScreenState();
}

class _StudentDetailScreenState extends State<StudentDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: BrandColors.appBackColor,
      appBar: AppBar(
        backgroundColor: BrandColors.whiteColor,
        titleSpacing: 0,
        title: const Text(
          'Student Details',
          style: TextStyle(
            fontSize: 18,
            fontFamily: "Work Sans",
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Container(
              decoration: BoxDecoration(
                color: BrandColors.whiteColor,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: BrandColors.whiteColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 74,
                          width: 80,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage('assets/images/person1.png'),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        height: size.height / 100,
                      ),
                      const Text(
                        "Harsh Kamboj",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Work Sans",
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: size.height / 50,
                      ),
                      Row(
                        children: [
                          Text(
                            'Class: 10th',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Work Sans",
                              fontWeight: FontWeight.w400,
                              color: BrandColors.greyColor,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Fees: ₹500',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Work Sans",
                              color: BrandColors.darkBlueColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            decoration: BoxDecoration(
              color: BrandColors.whiteColor,
              borderRadius: BorderRadius.circular(8),
            ),
            width: size.width,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: BrandColors.lighBlueColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Icon(
                    Icons.phone,
                    color: BrandColors.darkBlueColor,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '+91 9813433176',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Work Sans",
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Call Student by clicking here',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Work Sans",
                        color: BrandColors.greyColor,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'Joining Date: ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "24 August 2023",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: BrandColors.darkBlueColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      'Total Present: 40',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: BrandColors.greenColor,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      "Total Absent: 20",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: BrandColors.redColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Total Leave: 40',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: BrandColors.greyColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: BrandColors.whiteColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: CalendarDatePicker2(
              config: CalendarDatePicker2WithActionButtonsConfig(
                firstDayOfWeek: 1,
                calendarType: CalendarDatePicker2Type.multi,
                selectedDayTextStyle: TextStyle(
                  color: BrandColors.whiteColor,
                  fontWeight: FontWeight.w700,
                ),
                selectedDayHighlightColor: BrandColors.greenColor,
                dayBorderRadius: BorderRadius.circular(5),
              ),
              value: [
                DateTime.now(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
