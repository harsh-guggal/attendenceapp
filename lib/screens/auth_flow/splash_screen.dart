import 'package:attendenceapp/screens/auth_flow/welcome_screen.dart';
import 'package:attendenceapp/screens/home/landing_screen.dart';
import 'package:attendenceapp/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Future.delayed(const Duration(seconds: 3)).then((value) {
    //   Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => const WelcomeScreen(),
    //       ));
    // });
    fetchUser();
  }

  fetchUser() async {
    User? user = await FirebaseAuth.instance.currentUser;
    if (kDebugMode) {
      print(user?.uid.toString());
    }
    Future.delayed(const Duration(seconds: 3)).then((value) {
      if (user?.uid.toString() == null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const WelcomeScreen(),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LandingScreen(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: BrandColors.appBackColor,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: size.width / 20),
          width: size.width,
          height: size.height,
          child: Center(
            child: Image.asset('assets/images/splash.png'),
          ),
        ),
      ),
    );
  }
}
