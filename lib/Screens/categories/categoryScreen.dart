import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryScreen extends StatefulWidget {
  final String? catName;
  final model;
  const CategoryScreen({super.key, this.catName, this.model});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

bool isLiked = false;

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black, title: Text('${widget.catName}')),
      body: Container(
        child: ListView.builder(
            itemCount: widget.model.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: 240,
                            child: Text(
                              '${widget.model[index].q}',
                              style: GoogleFonts.raleway(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            )),
                        SizedBox(
                          height: 8,
                        ),
                        Text('${widget.model[index].a}',
                            style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w400,
                                color: Colors.grey)),
                      ],
                    ),
                    IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return StatefulBuilder(builder:
                                    (BuildContext context,
                                        StateSetter setState) {
                                  return Container(
                                    height: Get.height * 0.2,
                                    color: Color.fromRGBO(15, 15, 15, 0.1),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: isLiked
                                                  ? Colors.white
                                                  : Colors.transparent,
                                              border: Border.all(
                                                  color: Colors.white)),
                                          child: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  isLiked = !isLiked;
                                                });
                                              },
                                              icon: Icon(
                                                isLiked
                                                    ? Icons.bookmark
                                                    : Icons
                                                        .bookmark_add_outlined,
                                                color: isLiked
                                                    ? Colors.black
                                                    : Colors.white,
                                                size: 25,
                                              )),
                                        ),
                                        Container(
                                          height: 60,
                                          width: 60,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white
                                              // border: Border.all(color: Colors.white)

                                              ),
                                          child: IconButton(
                                              onPressed: () async {
                                                await Clipboard.setData(
                                                    ClipboardData(
                                                        text:
                                                            "${widget.model[index].q}"));
                                                // copied successfully
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(const SnackBar(
                                                        content: Text(
                                                            'Successfully Copied')));
                                              },
                                              icon: const Icon(
                                                Icons.copy,
                                                color: Colors.black,
                                                size: 25,
                                              )),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                              });
                        },
                        icon: const Icon(
                          Icons.more_vert_outlined,
                          color: Colors.white,
                        ))
                  ],
                ),
              );
            }),
      ),
    );
  }
}
