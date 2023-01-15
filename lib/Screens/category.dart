import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotespiration/Screens/categories/categoryScreen.dart';
import 'package:quotespiration/Screens/home.dart';

import '../core/api.dart';
import '../core/webservice.dart';
import '../models/quotesofDay.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

List<QuotesOfDay> motivational = [];

List<QuotesOfDay> sport = [];

List<QuotesOfDay> happyQuotes = [];

List<QuotesOfDay> sadQuote = [];

List<QuotesOfDay> funnyQuote = [];

List<QuotesOfDay> popularQuote = [];

class _CategoriesState extends State<Categories> {
  Future<void> categories() async {
    try {
      var response = await WebService.getQod(
          Apis.motivational, '''{"query":"","variables":{}}''');

      log('$response getting response');
      final model = jsonDecode(response);
      for (int i = 0; i < model.length; i++) {
        motivational.add(QuotesOfDay.fromJson(model[i]));
        setState(() {});
      }
      // setState(() {
      //   quotesOfDay = QuotesOfDay.fromJson(jsonDecode(response));
      //   // news = newsModel.articles.first.
      // });
    } catch (error) {
      print("error here in summary $error}");
    }
  }

  Future<void> sports() async {
    try {
      var response = await WebService.getQod(
          Apis.sports, '''{"query":"","variables":{}}''');

      log('$response getting response');
      final model = jsonDecode(response);
      for (int i = 0; i < model.length; i++) {
        sport.add(QuotesOfDay.fromJson(model[i]));
        setState(() {});
      }
      // setState(() {
      //   quotesOfDay = QuotesOfDay.fromJson(jsonDecode(response));
      //   // news = newsModel.articles.first.
      // });
    } catch (error) {
      print("error here in summary $error}");
    }
  }

  Future<void> happy() async {
    try {
      var response = await WebService.getQod(
          Apis.happy, '''{"query":"","variables":{}}''');

      log('$response getting response');
      final model = jsonDecode(response);
      for (int i = 0; i < model.length; i++) {
        happyQuotes.add(QuotesOfDay.fromJson(model[i]));
        setState(() {});
      }
      // setState(() {
      //   quotesOfDay = QuotesOfDay.fromJson(jsonDecode(response));
      //   // news = newsModel.articles.first.
      // });
    } catch (error) {
      print("error here in summary $error}");
    }
  }

  Future<void> sad() async {
    try {
      var response =
          await WebService.getQod(Apis.sad, '''{"query":"","variables":{}}''');

      log('$response getting response');
      final model = jsonDecode(response);
      for (int i = 0; i < model.length; i++) {
        sadQuote.add(QuotesOfDay.fromJson(model[i]));
        setState(() {});
      }
      // setState(() {
      //   quotesOfDay = QuotesOfDay.fromJson(jsonDecode(response));
      //   // news = newsModel.articles.first.
      // });
    } catch (error) {
      print("error here in summary $error}");
    }
  }

  Future<void> funny() async {
    try {
      var response = await WebService.getQod(
          Apis.funny, '''{"query":"","variables":{}}''');

      log('$response getting response');
      final model = jsonDecode(response);
      for (int i = 0; i < model.length; i++) {
        funnyQuote.add(QuotesOfDay.fromJson(model[i]));
        setState(() {});
      }
      // setState(() {
      //   quotesOfDay = QuotesOfDay.fromJson(jsonDecode(response));
      //   // news = newsModel.articles.first.
      // });
    } catch (error) {
      print("error here in summary $error}");
    }
  }

  Future<void> popular() async {
    try {
      var response = await WebService.getQod(
          Apis.popular, '''{"query":"","variables":{}}''');

      log('$response getting response');
      final model = jsonDecode(response);
      for (int i = 0; i < model.length; i++) {
        popularQuote.add(QuotesOfDay.fromJson(model[i]));
        setState(() {});
      }
      // setState(() {
      //   quotesOfDay = QuotesOfDay.fromJson(jsonDecode(response));
      //   // news = newsModel.articles.first.
      // });
    } catch (error) {
      print("error here in summary $error}");
    }
  }

  Future<void> initialization() async {
    await categories();
    await sports();
    await funny();
    await sad();
    await happy();
    await popular();
  }

  @override
  void initState() {
    // TODO: implement initState
    initialization();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              categoryCard(() {
                Get.to(CategoryScreen(
                  catName: 'Motivational',
                  model: motivational,
                ));
              }, 'Motivational'),
              categoryCard(() {
                Get.to(CategoryScreen(
                  catName: 'Sports',
                  model: sport,
                ));
              }, 'Sports'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              categoryCard(() {
                Get.to(CategoryScreen(
                  catName: 'Happy',
                  model: happyQuotes,
                ));
              }, 'Happy'),
              categoryCard(() {
                Get.to(CategoryScreen(
                  catName: 'Sad',
                  model: sadQuote,
                ));
              }, 'Sad'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              categoryCard(() {
                Get.to(CategoryScreen(
                  catName: 'Funny',
                  model: funnyQuote,
                ));
              }, 'Funny'),
              categoryCard(() {
                Get.to(CategoryScreen(
                  catName: 'Popular',
                  model: popularQuote,
                ));
              }, 'Popular'),
            ],
          )
        ],
      ),
    );
  }

  categoryCard(final onTap, String cardName) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: Colors.grey.shade900,
              height: 90,
              width: 150,
              child: Icon(
                Icons.format_quote_outlined,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$cardName',
                  style: GoogleFonts.raleway(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
