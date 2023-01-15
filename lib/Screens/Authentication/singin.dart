import 'package:flutter/material.dart';
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
        body: Container(
      child: Column(
        children: [
          Form(
            key: formKey,
            child: Column(
              children: [
                CustomField(
                  controller: nameController,
                  hintName: 'Name',
                ),
                CustomField(
                  controller: emailController,
                  hintName: 'Email',
                ),
                CustomFieldPass(
                  controller: passwordController,
                  hintName: 'Password',
                ),
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  try {
                    auth.signUp(nameController.text, emailController.text,
                        passwordController.text, context);
                  } catch (e) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(e.toString())));
                  }
                } else {}
              },
              child: Text('SignUp'))
        ],
      ),
    ));
  }
}
