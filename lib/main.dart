import 'package:attendenceapp/screens/auth_flow/splash_screen.dart';
import 'package:attendenceapp/utils/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Attendence App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: BrandColors.darkBlueColor),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
