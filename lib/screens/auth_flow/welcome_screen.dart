import 'dart:convert';

import 'package:attendenceapp/screens/auth_flow/login_screen.dart';
import 'package:attendenceapp/screens/auth_flow/registration_screen.dart';
import 'package:attendenceapp/utils/colors.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: BrandColors.appBackColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width,
              height: size.height / 10,
            ),
            Image.asset(
              'assets/images/welcome.png',
              height: size.height / 2.5,
            ),
            SizedBox(
              height: size.height / 20,
            ),
            const Text(
              'Welcome!',
              style: TextStyle(
                fontSize: 20,
                fontFamily: "Work Sans",
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: size.height / 15,
            ),
            Container(
              width: size.width,
              height: size.height / 15,
              margin: EdgeInsets.symmetric(
                horizontal: size.width / 10,
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
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
                  'Sign in',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontFamily: "Work Sans",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height / 20,
            ),
            Container(
              width: size.width,
              height: size.height / 15,
              margin: EdgeInsets.symmetric(
                horizontal: size.width / 10,
              ),
              child: ElevatedButton(
                onPressed: () async {
                  // print('api called --------------->');
                  // String uri = "http://10.0.2.2:8055/items/student";
                  // print(uri);
                  // Response response = await get(Uri.parse(uri));
                  // print('response is -------------->');
                  // print(response);
                  // Map data = await jsonDecode(response.body);
                  // print('api data --------------->');
                  // print(data);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegistrationScreen(),
                      ));
                  // showDialog(
                  //   context: context,
                  //   barrierDismissible: false,
                  //   builder: (context) {
                  //     return Center(
                  //       child: CircularProgressIndicator(
                  //         color: BrandColors.darkBlueColor,
                  //       ),
                  //     );
                  //   },
                  // );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Colors.white,
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      side: BorderSide(
                        color: BrandColors.darkBlueColor,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 16,
                    color: BrandColors.darkBlueColor,
                    fontFamily: "Work Sans",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
