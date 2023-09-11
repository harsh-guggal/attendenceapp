import 'package:attendenceapp/screens/home/one_day_detail.dart';
import 'package:attendenceapp/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AllDaysScreen extends StatefulWidget {
  const AllDaysScreen({super.key});

  @override
  State<AllDaysScreen> createState() => _AllDaysScreenState();
}

class _AllDaysScreenState extends State<AllDaysScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: BrandColors.appBackColor,
      appBar: AppBar(
        backgroundColor: BrandColors.whiteColor,
        titleSpacing: 0,
        title: const Text(
          'All Days',
          style: TextStyle(
            fontSize: 18,
            fontFamily: "Work Sans",
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          width: size.width,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OneDayDetail(
                        date: DateFormat("dd MMMM yyyy").format(
                          DateTime.now(),
                        ),
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
                                '22 August 2023 $index',
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
            },
          ),
        ),
      ),
    );
  }
}
