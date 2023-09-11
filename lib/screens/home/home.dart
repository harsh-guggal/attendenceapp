import 'package:attendenceapp/screens/home/all_days.dart';
import 'package:attendenceapp/screens/home/one_day_detail.dart';
import 'package:attendenceapp/services/user_services.dart';
import 'package:attendenceapp/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<DateTime> listofDays = [
    DateTime.now(),
    DateTime.now().subtract(const Duration(days: 1)),
    DateTime.now().subtract(const Duration(days: 2)),
    DateTime.now().subtract(const Duration(days: 3)),
    DateTime.now().subtract(const Duration(days: 4)),
    DateTime.now().subtract(const Duration(days: 5)),
    DateTime.now().subtract(const Duration(days: 6)),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: BrandColors.appBackColor,
      appBar: AppBar(
        leading: const SizedBox(
          width: 0,
          height: 0,
        ),
        leadingWidth: 0,
        titleSpacing: 0,
        backgroundColor: BrandColors.whiteColor,
        title: Row(
          children: [
            SizedBox(
              height: size.height / 15,
              child: Image.asset('assets/images/avatar.png'),
            ),
            SizedBox(
              width: size.width / 24,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Hello Harsh!',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Work Sans",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: size.height / 150,
                ),
                Text(
                  'Today: ${DateFormat("dd MMMM yyyy").format(DateTime.now())}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontFamily: "Work Sans",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: size.width / 20),
            height: size.height / 15,
            child: Image.asset('assets/images/notifications.png'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: size.width / 20, vertical: size.height / 40),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Today',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Work Sans",
                    ),
                  ),
                  SizedBox(
                    height: size.height / 50,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: size.height / 50),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: BrandColors.darkBlueColor,
                          ),
                          child: const Center(
                            child: Text(
                              'Total Students: 40',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Work Sans",
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width / 40,
                      ),
                      Expanded(
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: size.height / 50),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: BrandColors.greenColor,
                          ),
                          child: Center(
                            child: Text(
                              'Present Students: 40',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Work Sans",
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height / 50,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: size.height / 50),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: BrandColors.redColor,
                          ),
                          child: const Center(
                            child: Text(
                              'Absent Students: 40',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Work Sans",
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width / 40,
                      ),
                      Expanded(
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: size.height / 50),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: BrandColors.greyColor,
                          ),
                          child: const Center(
                            child: Text(
                              'Leave Students: 40',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Work Sans",
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: size.height / 20,
              ),
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Last 7 days',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontFamily: "Work Sans",
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AllDaysScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'View All',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Work Sans",
                        color: BrandColors.darkBlueColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height / 50,
              ),
              ListView.builder(
                  itemCount: listofDays.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OneDayDetail(
                              date: DateFormat("dd-MMMM-yyyy")
                                  .format(listofDays[index]),
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
                              height: 40,
                              width: 40,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: BrandColors.lighBlueColor,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Image.asset('assets/images/calender.png'),
                            ),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(left: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      DateFormat("dd-MMMM-yyyy")
                                          .format(listofDays[index]),
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontFamily: "Work Sans",
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      height: size.height / 200,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Present : 50',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: BrandColors.greenColor,
                                            fontFamily: "Work Sans",
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          width: size.width / 40,
                                        ),
                                        Text(
                                          'Absent : 20',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: BrandColors.redColor,
                                            fontFamily: "Work Sans",
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      'Leave : 30',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: BrandColors.greyColor,
                                        fontFamily: "Work Sans",
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: BrandColors.greyColor,
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
