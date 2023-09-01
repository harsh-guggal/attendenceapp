import 'package:attendenceapp/screens/auth_flow/welcome_screen.dart';
import 'package:attendenceapp/services/auth_services.dart';
import 'package:attendenceapp/utils/alerts.dart';
import 'package:attendenceapp/utils/colors.dart';
import 'package:flutter/material.dart';

Future showRemoveStudentPopUp(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: BrandColors.appBackColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Container(
            // height: 200,
            padding: const EdgeInsets.all(16),
            // width: 200,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/redBack.png'),
                          ),
                        ),
                        child: Image.asset(
                          'assets/images/cancel.png',
                          color: BrandColors.redColor,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Image.asset(
                            'assets/images/cancel.png',
                            width: 16,
                            height: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const Text(
                  'Remove Student',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Work Sans",
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Are you sure you want to remove this student?',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Work Sans",
                    color: BrandColors.greyColor,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 48, vertical: 8),
                        decoration: BoxDecoration(
                          color: BrandColors.whiteColor,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: BrandColors.greyColor,
                            width: 0.5,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'No',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Work Sans",
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: BrandColors.darkBlueColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(
                          child: Text(
                            'Yes',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Work Sans",
                              color: BrandColors.whiteColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      });
}

Future showSignOutPopUp(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: BrandColors.appBackColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Container(
            // height: 200,
            padding: const EdgeInsets.all(16),
            // width: 200,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        // padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/redBack.png'),
                          ),
                        ),
                        child: Icon(
                          Icons.logout_rounded,
                          color: BrandColors.redColor,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Image.asset(
                            'assets/images/cancel.png',
                            width: 16,
                            height: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const Text(
                  'Sign Out',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Work Sans",
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Are you sure you want to sign out?',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Work Sans",
                    color: BrandColors.greyColor,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 48, vertical: 8),
                        decoration: BoxDecoration(
                          color: BrandColors.whiteColor,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: BrandColors.greyColor,
                            width: 0.5,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'No',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Work Sans",
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          await AuthServices.logout();
                          // ignore: use_build_context_synchronously
                          showSuccessNoti(
                              context, 'Authentication', 'Logout successfully');
                          // ignore: use_build_context_synchronously
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const WelcomeScreen(),
                              ),
                              (route) => false);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: BrandColors.darkBlueColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Center(
                            child: Text(
                              'Yes',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Work Sans",
                                color: BrandColors.whiteColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      });
}
