import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotespiration/Screens/Authentication/signin.dart';
import 'package:quotespiration/Screens/quotesBottom.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

User? user = FirebaseAuth.instance.currentUser;

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 3), () {
      user == null ? Get.offAll(SignIn()) : Get.offAll(QuotesBottomBar());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Quotespiration'.toUpperCase(),
            style: GoogleFonts.raleway(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.w400),
          ),
          // Container(
          //     margin: const EdgeInsets.symmetric(vertical: 10),
          //     width: 100,
          //     child: LinearProgressIndicator(
          //       backgroundColor: Colors.grey.withOpacity(0.3),
          //       color: Colors.blue,
          //     ))
        ],
      ),
    ));
  }
}
