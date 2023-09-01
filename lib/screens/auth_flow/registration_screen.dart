import 'package:attendenceapp/screens/home/landing_screen.dart';
import 'package:attendenceapp/services/auth_services.dart';
import 'package:attendenceapp/utils/alerts.dart';
import 'package:attendenceapp/utils/colors.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool showPassword = false;
  bool isLoading = false;
  TextEditingController userController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: BrandColors.appBackColor,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: size.width / 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height / 14),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Icon(Icons.arrow_back),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: size.height / 25),
                padding: EdgeInsets.symmetric(horizontal: size.width / 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Hello!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Work Sans",
                      ),
                    ),
                    SizedBox(
                      height: size.height / 50,
                    ),
                    Text(
                      'Please registration to Continue',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Work Sans",
                        color: BrandColors.greyColor,
                      ),
                    ),
                    SizedBox(
                      height: size.height / 40,
                    ),
                    const Text(
                      'Username',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Work Sans",
                      ),
                    ),
                    SizedBox(
                      height: size.height / 50,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width / 40),
                      width: size.width,
                      height: size.height / 13,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: BrandColors.greyColor),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.person,
                            color: BrandColors.greyColor,
                          ),
                          SizedBox(
                            width: size.width / 40,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: userController,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              decoration: const InputDecoration(
                                hintText: 'Enter username...',
                                enabledBorder: InputBorder.none,
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.text,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height / 50,
                    ),
                    const Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Work Sans",
                      ),
                    ),
                    SizedBox(
                      height: size.height / 50,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width / 40),
                      width: size.width,
                      height: size.height / 13,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: BrandColors.greyColor),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.email_outlined,
                            color: BrandColors.greyColor,
                          ),
                          SizedBox(
                            width: size.width / 40,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: emailController,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              decoration: const InputDecoration(
                                hintText: 'Enter email...',
                                enabledBorder: InputBorder.none,
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height / 50,
                    ),
                    const Text(
                      'Password',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Work Sans",
                      ),
                    ),
                    SizedBox(
                      height: size.height / 50,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width / 40),
                      width: size.width,
                      height: size.height / 13,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: BrandColors.greyColor),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.lock,
                            color: BrandColors.greyColor,
                          ),
                          SizedBox(
                            width: size.width / 40,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: passwordController,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              decoration: const InputDecoration(
                                hintText: 'Enter password...',
                                enabledBorder: InputBorder.none,
                                border: InputBorder.none,
                              ),
                              obscureText: !showPassword,
                              keyboardType: TextInputType.text,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              showPassword = !showPassword;
                              setState(() {});
                            },
                            child: showPassword
                                ? Icon(
                                    Icons.visibility_off_outlined,
                                    color: BrandColors.greyColor,
                                  )
                                : Icon(
                                    Icons.visibility_outlined,
                                    color: BrandColors.greyColor,
                                  ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height / 20,
                    ),
                    isLoading
                        ? SizedBox(
                            width: size.width,
                            height: 50,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: BrandColors.darkBlueColor,
                              ),
                            ),
                          )
                        : SizedBox(
                            width: size.width,
                            height: size.height / 15,
                            child: ElevatedButton(
                              onPressed: () async {
                                setState(() {
                                  isLoading = true;
                                });

                                String username = userController.text;
                                String email = emailController.text;
                                String password = passwordController.text;

                                if (username.length >= 6 &&
                                    password.length >= 6) {
                                  if (RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(email)) {
                                  } else {
                                    showAlert(size, BrandColors.redColor,
                                        context, 'email is invalid');
                                  }
                                  bool status = await AuthServices.createUser(
                                      username, email, password);
                                  if (status) {
                                    // ignore: use_build_context_synchronously
                                    showAlert(size, BrandColors.darkBlueColor,
                                        context, 'Sign up done');
                                    // ignore: use_build_context_synchronously
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const LandingScreen(),
                                        ),
                                        (route) => false);
                                  } else {
                                    // ignore: use_build_context_synchronously
                                    showAlert(size, BrandColors.redColor,
                                        context, 'Sign up failed');
                                  }
                                } else {
                                  showAlert(size, BrandColors.redColor, context,
                                      'username and password length should be greater than 6');
                                }

                                setState(() {
                                  isLoading = false;
                                });
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  BrandColors.darkBlueColor,
                                ),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
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
            ],
          ),
        ),
      ),
    );
  }
}
