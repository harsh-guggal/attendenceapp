import 'package:attendenceapp/utils/colors.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: BrandColors.appBackColor,
      appBar: AppBar(
        backgroundColor: BrandColors.whiteColor,
        titleSpacing: 0,
        title: const Text(
          "Edit Profile",
          style: TextStyle(
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
                    'Username:',
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
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: 'Enter username',
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
                  horizontal: size.width / 10, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Email:',
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
                      readOnly: true,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: 'Enter email',
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
              width: size.width,
              height: size.height / 15,
              margin: EdgeInsets.symmetric(
                horizontal: size.width / 10,
                vertical: 16,
              ),
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
                  "Edit",
                  style: TextStyle(
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
