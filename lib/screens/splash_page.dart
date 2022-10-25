
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_devilery/screens/singIn_page.dart';

class Splash_page extends StatefulWidget {
  const Splash_page({super.key});

  @override
  
  State<Splash_page> createState() => _Splash_pageState();
}

class _Splash_pageState extends State<Splash_page> {
  @override
  void initState() {
   Future.delayed(Duration(seconds: 3),(() {
     Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => Sign_page())));
   }));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Image.asset(
          'assets/images/splash.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
