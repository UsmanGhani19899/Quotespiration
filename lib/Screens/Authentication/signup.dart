import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotespiration/Screens/Authentication/signin.dart';
import 'package:quotespiration/Screens/widgets/customField.dart';
import 'package:quotespiration/Screens/widgets/passField.dart';
import 'package:quotespiration/core/firebaseauth.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

Auth auth = Auth();
TextEditingController emailController = TextEditingController();

TextEditingController nameController = TextEditingController();
TextEditingController passwordController = TextEditingController();
final formKey = GlobalKey<FormState>();

class _SignUpState extends State<SignUp> {
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
                  'Signup'.toUpperCase(),
                  style: GoogleFonts.raleway(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ),
                Text(
                  'create an account'.toUpperCase(),
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
                      controller: nameController,
                      hintName: 'Name',
                    ),
                    SizedBox(
                      height: 10,
                    ),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: GoogleFonts.raleway(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 13),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.offAll(SignIn());
                    },
                    child: Text(
                      'SignIn',
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
                        auth.signUp(nameController.text, emailController.text,
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
