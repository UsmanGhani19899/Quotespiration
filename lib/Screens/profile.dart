import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  final Brightness? brightness;
  const Profile({super.key, this.brightness});

  @override
  State<Profile> createState() => _ProfileState();
}

bool _switchValue = true;

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Usman Ghani".toUpperCase(),
                    style: GoogleFonts.roboto(
                        color: Colors.white, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Usmanghani19899@gmail.com".toUpperCase(),
                    style: GoogleFonts.raleway(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListTile(
                  tileColor: Colors.grey.shade900.withOpacity(0.3),
                  title: Text(
                    _switchValue
                        ? "Dark Theme".toUpperCase()
                        : "Light Theme".toUpperCase(),
                    style: GoogleFonts.raleway(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                  trailing: Switch(
                    // colo
                    value: _switchValue,
                    onChanged: (value) {
                      setState(() {
                        _switchValue = value;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListTile(
                    tileColor: Colors.grey.shade900.withOpacity(0.3),
                    title: Text(
                      'Logout'.toUpperCase(),
                      style: GoogleFonts.raleway(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                    trailing: Icon(
                      Icons.logout,
                      color: Colors.white,
                    )),
              )
            ],
          )),
    );
  }
}
