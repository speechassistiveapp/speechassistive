// ignore_for_file: library_private_types_in_public_api, camel_case_types, prefer_const_constructors, unused_import, unused_element, non_constant_identifier_names, avoid_print, prefer_collection_literals, duplicate_ignore

import "package:flutter/material.dart";
import 'package:flutter_tts/flutter_tts.dart';
//import 'package:speechassistive/home2.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:speechassistive/schoolitem1.dart';
import 'package:speechassistive/schoolitem2.dart';
import 'package:speechassistive/vocabulary.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SchoolItem1 extends StatefulWidget {
  const SchoolItem1({super.key});

  @override
  _SchoolItem1 createState() => _SchoolItem1();
}

String _data = "";
String data_ = "";
String gend = "";

class _SchoolItem1 extends State<SchoolItem1> {
  final FlutterTts flutterTts = FlutterTts();
  String? Gender;
  String? guardianEmail;

  @override
  void initState() {
    super.initState();
    getGuardianEmail();
    //displaygender();
  }

  Future speakMaleVoice(String text) async {
    await flutterTts.setLanguage("en-GB");
    await flutterTts.setPitch(0.6);
    await flutterTts.speak(text);
    //await flutterTts.setVoice({"name": "JOEY", "locale": "en-US"});
    print(await flutterTts.getVoices);
  }

  Future speakFemaleVoice(String text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
    //await flutterTts.setVoice({"name": "IVY", "locale": "en-US"});
    print(await flutterTts.getVoices);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tap the SCHOOL MATERIALS")),
      body: Column(children: [
        //guardianEmail == null
        //? const Text('No Email passed')
        // : Text(guardianEmail!,
        //  style: const TextStyle(
        //   color: Colors
        //   .black)), //spacer between the Appbar and the buttons

        const SizedBox(height: 30),
        _header(context),
        const SizedBox(height: 30), //spacer between the Appbar and the buttons

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    child: Image.asset(
                      'assets/images/backbag.png',
                      width: 150,
                      height: 120,
                    ),
                    onTap: () async {
                      var map = Map<String, dynamic>();
                      map['Email'] = guardianEmail;
                      var uri =
                          "https://www.speech-assistive-app.com/getdata.php";
                      var res = await http.post(Uri.parse(uri), body: map);
                      //print(res.body);
                      final String data = jsonEncode(res
                          .body); //content response of res.body must be converted from object to json string by using jsonEncode
                      // ignore: avoid_print
                      data_ = (data[15] + data[16] + data[17] + data[18]);
                      setState(() {});
                      if (data_ == "MALE") {
                        speakMaleVoice('BAG');
                      } else if (data_ == "FEMA") {
                        speakFemaleVoice('BAG');
                      }
                    },
                  ),
                  const Text('BAG',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    child: Image.asset(
                      'assets/images/blackboard.png',
                      width: 150,
                      height: 120,
                    ),
                    onTap: () async {
                      var map = Map<String, dynamic>();
                      map['Email'] = guardianEmail;
                      var uri =
                          "https://www.speech-assistive-app.com/getdata.php";
                      var res = await http.post(Uri.parse(uri), body: map);
                      //print(res.body);
                      final String data = jsonEncode(res
                          .body); //content response of res.body must be converted from object to json string by using jsonEncode
                      // ignore: avoid_print
                      data_ = (data[15] + data[16] + data[17] + data[18]);
                      setState(() {});
                      if (data_ == "MALE") {
                        speakMaleVoice('BLACKBOARD');
                      } else if (data_ == "FEMA") {
                        speakFemaleVoice('BLACKBOARD');
                      }
                    },
                  ),
                  const Text('BLACKBOARD',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    child: Image.asset(
                      'assets/images/calculator.png',
                      width: 150,
                      height: 120,
                    ),
                    onTap: () async {
                      var map = Map<String, dynamic>();
                      map['Email'] = guardianEmail;
                      var uri =
                          "https://www.speech-assistive-app.com/getdata.php";
                      var res = await http.post(Uri.parse(uri), body: map);
                      //print(res.body);
                      final String data = jsonEncode(res
                          .body); //content response of res.body must be converted from object to json string by using jsonEncode
                      // ignore: avoid_print
                      data_ = (data[15] + data[16] + data[17] + data[18]);
                      setState(() {});
                      if (data_ == "MALE") {
                        speakMaleVoice('CALCULATOR');
                      } else if (data_ == "FEMA") {
                        speakFemaleVoice('CALCULATOR');
                      }
                    },
                  ),
                  const Text('CALCULATOR',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    child: Image.asset(
                      'assets/images/clock.png',
                      width: 150,
                      height: 120,
                    ),
                    onTap: () async {
                      var map = Map<String, dynamic>();
                      map['Email'] = guardianEmail;
                      var uri =
                          "https://www.speech-assistive-app.com/getdata.php";
                      var res = await http.post(Uri.parse(uri), body: map);
                      //print(res.body);
                      final String data = jsonEncode(res
                          .body); //content response of res.body must be converted from object to json string by using jsonEncode
                      // ignore: avoid_print
                      data_ = (data[15] + data[16] + data[17] + data[18]);
                      setState(() {});
                      if (data_ == "MALE") {
                        speakMaleVoice('CLOCK');
                      } else if (data_ == "FEMA") {
                        speakFemaleVoice('CLOCK');
                      }
                    },
                  ),
                  const Text('CLOCK',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    child: Image.asset(
                      'assets/images/globe.png',
                      width: 150,
                      height: 120,
                    ),
                    onTap: () async {
                      var map = Map<String, dynamic>();
                      map['Email'] = guardianEmail;
                      var uri =
                          "https://www.speech-assistive-app.com/getdata.php";
                      var res = await http.post(Uri.parse(uri), body: map);
                      //print(res.body);
                      final String data = jsonEncode(res
                          .body); //content response of res.body must be converted from object to json string by using jsonEncode
                      // ignore: avoid_print
                      data_ = (data[15] + data[16] + data[17] + data[18]);
                      setState(() {});
                      if (data_ == "MALE") {
                        speakMaleVoice('GLOBE');
                      } else if (data_ == "FEMA") {
                        speakFemaleVoice('GLOBE');
                      }
                    },
                  ),
                  const Text('GLOBE',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 220,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Vocabulary()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  "Back to Vocabularies",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              width: 155,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SchoolItem2()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  "Next",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
        //_button(context),
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

  _header(context) {
    return Column(
      children: const [
        Text(
          " Let us be familiar with the different materials \n we see in school. Tap all the materials below.",
          textAlign: TextAlign.justify,
          style: TextStyle(fontSize: 17, color: Colors.black),
        )
      ],
    );
  }
}