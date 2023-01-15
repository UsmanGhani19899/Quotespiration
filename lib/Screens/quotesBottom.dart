import 'package:flutter/material.dart';
import 'package:quotespiration/Screens/category.dart';
import 'package:quotespiration/Screens/home.dart';
import 'package:quotespiration/Screens/profile.dart';

class QuotesBottomBar extends StatefulWidget {
  final theme;
  const QuotesBottomBar({super.key, this.theme});

  @override
  State<QuotesBottomBar> createState() => _QuotesBottomBarState();
}

final screen = [
  Home(),
  Categories(),
  Profile(),
];
int _currentindex = 0;

class _QuotesBottomBarState extends State<QuotesBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.black,
          currentIndex: _currentindex,
          onTap: (index) {
            setState(() {
              _currentindex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.format_quote_sharp,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.category_outlined,
                ),
                label: 'Category'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline,
                ),
                label: 'Profile')
          ]),
      body: screen[_currentindex],
    );
  }
}
