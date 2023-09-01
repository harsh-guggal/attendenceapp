import 'package:attendenceapp/utils/colors.dart';
import 'package:flutter/material.dart';

class MarkAttendenceScreen extends StatefulWidget {
  const MarkAttendenceScreen({super.key});

  @override
  State<MarkAttendenceScreen> createState() => _MarkAttendenceScreenState();
}

class _MarkAttendenceScreenState extends State<MarkAttendenceScreen> {
  // Initial Selected Value
  String dropdownvalue = 'Student 1';

  // List of items in our dropdown menu
  var items = [
    'Student 1',
    'Student 2',
    'Student 3',
    'Student 4',
    'Student 5',
  ];
  String reason = "Present";
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
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                        fillColor:
                            MaterialStatePropertyAll(BrandColors.greenColor),
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
                        fillColor:
                            MaterialStatePropertyAll(BrandColors.redColor),
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
                        fillColor:
                            MaterialStatePropertyAll(BrandColors.greyColor),
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
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      BrandColors.darkBlueColor,
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
