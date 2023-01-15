import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotespiration/Screens/Authentication/signup.dart';
import 'package:quotespiration/Screens/widgets/customField.dart';
import 'package:quotespiration/Screens/widgets/passField.dart';
import 'package:quotespiration/core/firebaseauth.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

Auth auth = Auth();
TextEditingController emailController = TextEditingController();

TextEditingController nameController = TextEditingController();
TextEditingController passwordController = TextEditingController();
final formKey = GlobalKey<FormState>();

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 50, left: 12, right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SignIn'.toUpperCase(),
                  style: GoogleFonts.raleway(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ),
                Text(
                  'Welcome Back'.toUpperCase(),
                  style: GoogleFonts.raleway(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    CustomField(
                      controller: emailController,
                      hintName: 'Email',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomFieldPass(
                      controller: passwordController,
                      hintName: 'Password',
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              alignment: Alignment.centerRight,
              child: Text(
                'Forgot Password',
                style: GoogleFonts.raleway(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 13),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have account?",
                    style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 13),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(SignUp());
                    },
                    child: Text(
                      'SignUp',
                      style: GoogleFonts.raleway(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      try {
                        auth.signIn(emailController.text,
                            passwordController.text, context);
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(e.toString())));
                      }
                    }
                  },
                  child: Text('SignUp')),
            )
          ],
        ),
      ),
    ));
  }
}
