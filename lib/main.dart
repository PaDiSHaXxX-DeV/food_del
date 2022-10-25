import 'package:flutter/material.dart';
import 'package:food_devilery/screens/home_page.dart';
import 'package:food_devilery/screens/registr_page.dart';
import 'package:food_devilery/screens/singIn_page.dart';
import 'package:food_devilery/screens/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash_page(),
    );
  }
}

