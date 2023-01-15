import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
