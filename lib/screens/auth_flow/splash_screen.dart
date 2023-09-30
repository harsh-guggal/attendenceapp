import 'package:attendenceapp/screens/auth_flow/welcome_screen.dart';
import 'package:attendenceapp/screens/home/landing_screen.dart';
import 'package:attendenceapp/services/base_services.dart';
import 'package:attendenceapp/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  fetchUser() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool? isLogin = prefs.getBool('isLogin') ?? false;
    if (!isLogin) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => const WelcomeScreen(),
        ),
      );
    } else {
      await BaseService.getSavedAuth();
      await BaseService.refreshAuth(force: true);
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => const LandingScreen(),
        ),
      );
    }
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
