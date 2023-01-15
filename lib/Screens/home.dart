import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotespiration/models/quotesofDay.dart';

import '../core/api.dart';
import '../core/webservice.dart';

class Home extends StatefulWidget {
  Home({super.key, this.qod});
  String? qod;
  @override
  State<Home> createState() => _HomeState();
}

List<QuotesOfDay> quotesOfDay = [];

List<QuotesOfDay>? qod;
bool isLiked = false;

class _HomeState extends State<Home> {
  Future<void> getQod() async {
    try {
      var response = await WebService.getQod(
          Apis.quotesOfDay, '''{"query":"","variables":{}}''');

      log('$response getting response');
      final model = jsonDecode(response);
      for (int i = 0; i < model.length; i++) {
        quotesOfDay.add(QuotesOfDay.fromJson(model[i]));
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
    await getQod();
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
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: quotesOfDay.length,
          itemBuilder: (context, index) {
            return Container(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Text(
                  //   'QUOTES OF DAY'.toUpperCase(),
                  //   style: GoogleFonts.raleway(
                  //       color: Colors.white,
                  //       fontWeight: FontWeight.bold,
                  //       fontSize: 20),
                  // ),
                  Container(),
                  Container(
                    alignment: Alignment.center,
                    width: 280,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${quotesOfDay[index].q}".toUpperCase(),
                          style: GoogleFonts.raleway(
                              color: Colors.white, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "${quotesOfDay[index].a}".toUpperCase(),
                          style: GoogleFonts.raleway(
                              color: Colors.grey, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isLiked ? Colors.white : Colors.transparent,
                            border: Border.all(color: Colors.white)),
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                isLiked = !isLiked;
                              });
                            },
                            icon: Icon(
                              isLiked
                                  ? Icons.bookmark
                                  : Icons.bookmark_add_outlined,
                              color: isLiked ? Colors.black : Colors.white,
                              size: 25,
                            )),
                      ),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white
                            // border: Border.all(color: Colors.white)

                            ),
                        child: IconButton(
                            onPressed: () async {
                              await Clipboard.setData(ClipboardData(
                                  text: "${quotesOfDay[index].q}"));
                              // copied successfully
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Successfully Copied')));
                            },
                            icon: const Icon(
                              Icons.copy,
                              color: Colors.black,
                              size: 25,
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
