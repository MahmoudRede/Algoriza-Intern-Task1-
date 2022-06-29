import 'package:algoriza_intern_task1/presentation/screens/login_screen/loginscreen.dart';
import 'package:algoriza_intern_task1/presentation/screens/onboarding_screen/onboarding.dart';
import 'package:algoriza_intern_task1/presentation/screens/register_screen/registerscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoarding(),
    );
  }
}

