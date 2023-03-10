import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotespiration/Screens/Authentication/signup.dart';
import 'package:quotespiration/Screens/home.dart';
import 'package:quotespiration/Screens/quotesBottom.dart';
import 'package:quotespiration/Screens/splash.dart';

import 'Screens/Authentication/signin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white, brightness: Brightness.light),
      darkTheme: ThemeData(
          brightness: Brightness.dark, scaffoldBackgroundColor: Colors.black),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
