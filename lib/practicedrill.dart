// ignore_for_file: non_constant_identifier_names, duplicate_ignore, prefer_const_constructors, unused_import, unused_element, prefer_collection_literals, avoid_print, unused_local_variable

import "package:flutter/material.dart";
import 'package:speechassistive/displaydrill.dart';
import "package:speechassistive/mainmenu.dart";
import "package:speechassistive/newdrill.dart";
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:speechassistive/vocabulary.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PracticeDrill extends StatefulWidget {
  //final String Email;
  const PracticeDrill({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PracticeDrillstate createState() => _PracticeDrillstate();
}

String _data = "";
String data_ = "";
String gend = "";

class _PracticeDrillstate extends State<PracticeDrill> {
  String? Gender;
  String? guardianEmail;

  @override
  void initState() {
    super.initState();
    getGuardianEmail();
    //displaygender();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text("Speech Practice Drill"), centerTitle: true),
      body: Column(children: [
        //guardianEmail == null
        //? const Text('No Email passed')
        // : Text(guardianEmail!,
        // style: const TextStyle(
        //  color: Colors
        //  .black)), //spacer between the Appbar and the button
        const SizedBox(height: 50),
        _image(context),
        const SizedBox(height: 10),
        _header(context),

        const SizedBox(height: 40),
        //spacer between the Appbar and the buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 150,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DisplayDrills()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.green,
                ),
                child: const Text(
                  "Review Drill",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NewDrill()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.red,
                ),
                child: const Text(
                  "New Speech Drill",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 380,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MainMenu()),
              );
            },
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: Colors.orange,
            ),
            child: const Text(
              "Back to Main Menu",
              style: TextStyle(fontSize: 20),
            ),
          ),
        )
      ]),
    );
  }

  void getGuardianEmail() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    guardianEmail = pref.getString('guardian_Email');
    //comments ko to: the key will be passed here (guardian_Email)
    setState(() {});
  }

  void getGuardianGender() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    Gender = pref.getString('guardian_Gender');
    //comments ko to: the key will be passed here (guardian_Email)
    setState(() {});
  }
}

_header(context) {
  return Column(
    children: const [
      Text(
        " Join me! Together, let us learn new phrases.",
        textAlign: TextAlign.justify,
        style: TextStyle(fontSize: 18, color: Colors.black),
      )
    ],
  );
}

_image(context) {
  return Column(
    children: [
      SizedBox(
        height: 200,
        width: 250,
        child: Image.asset('assets/images/Practicedrill.png'),
      )
    ],
  );
}
