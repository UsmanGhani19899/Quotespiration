import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quotespiration/Screens/Authentication/signin.dart';
import 'package:quotespiration/Screens/quotesBottom.dart';
import 'package:quotespiration/models/userModel.dart';

class Auth {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  User? user;
  signUp(
    String? name,
    String? email,
    // String? uid,
    String? password,
    BuildContext context,
  ) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email!, password: password!)
          .then((value) async {
        UserModel userModel = UserModel(
            email: email,
            name: name!,
            password: password,
            uid: value.user!.uid);
        await db.collection('users').doc().set(userModel.toMap()).then((value) {
          Get.offAll(const QuotesBottomBar());
        });
      });
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  signIn(String email, String password, BuildContext context) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => Get.offAll(const QuotesBottomBar()));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  logout(BuildContext context) {
    try {
      auth.signOut().then((value) => Get.offAll(const SignIn()));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  forgetPassword(String email, BuildContext context) async {
    try {
      await auth
          .sendPasswordResetEmail(email: email)
          .then((value) => Get.offAll(const QuotesBottomBar()));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
