// ignore_for_file: avoid_print, prefer_const_constructors, unused_import, unused_element, prefer_collection_literals, duplicate_ignore, non_constant_identifier_names

import "package:flutter/material.dart";
import 'package:flutter_tts/flutter_tts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:speechassistive/vocabulary.dart';

List<String> imageList = [
  'assets/images/25.png',
  'assets/images/26.png',
  'assets/images/27.png',
  'assets/images/28.png',
  'assets/images/29.png',
  'assets/images/30.png',
  'assets/images/31.png',
  'assets/images/pyramid.png',
  'assets/images/33.png',
  'assets/images/34.png',
  //'assets/images/43.png'
];

final FlutterTts flutterTts = FlutterTts();

// ignore: camel_case_types
class sub_Shapes3 extends StatefulWidget {
  const sub_Shapes3({super.key});
  @override

  // ignore: library_private_types_in_public_api
  _ShapeState3 createState() => _ShapeState3();
}

String _data = "";
String data_ = "";
String gend = "";

class _ShapeState3 extends State<sub_Shapes3> {
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
      appBar: AppBar(title: const Text("Tap the SHAPES"), centerTitle: true),
      body: Column(children: [
        const SizedBox(height: 1),
        //guardianEmail == null
        //  ? const Text('No Email passed')
        //: Text(guardianEmail!,
        // style: const TextStyle(
        //   color: Colors
        //   .white)), //spacer between the Appbar and the buttons

        const SizedBox(height: 100), //spacer between the Appbar and the buttons

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
                width: 100,
                height: 120,
                child: GestureDetector(
                  child: Image.asset('assets/images/25.png'),
                  onTap: () async {
                    //getGender();
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
                      speakMaleVoice('Cone');
                    } else if (data_ == "FEMA") {
                      speakFemaleVoice('Cone');
                    }
                  },
                )),
            SizedBox(
                width: 100,
                height: 120,
                child: GestureDetector(
                  child: Image.asset('assets/images/26.png'),
                  onTap: () async {
                    //getGender();
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
                      speakMaleVoice('Parallelogram');
                    } else if (data_ == "FEMA") {
                      speakFemaleVoice('Parallelogram');
                    }
                  },
                )),
            SizedBox(
                width: 100,
                height: 120,
                child: GestureDetector(
                  child: Image.asset('assets/images/27.png'),
                  onTap: () async {
                    //getGender();
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
                      speakMaleVoice('Spade');
                    } else if (data_ == "FEMA") {
                      speakFemaleVoice('Spade');
                    }
                  },
                ))
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
                width: 100,
                height: 120,
                child: GestureDetector(
                  child: Image.asset('assets/images/28.png'),
                  onTap: () async {
                    //getGender();
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
                      speakMaleVoice('Rectangle');
                    } else if (data_ == "FEMA") {
                      speakFemaleVoice('Rectangle');
                    }
                  },
                )),
            SizedBox(
                width: 100,
                height: 120,
                child: GestureDetector(
                  child: Image.asset('assets/images/29.png'),
                  onTap: () async {
                    //getGender();
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
                      speakMaleVoice('Oval');
                    } else if (data_ == "FEMA") {
                      speakFemaleVoice('Oval');
                    }
                  },
                )),
            SizedBox(
                width: 100,
                height: 120,
                child: GestureDetector(
                  child: Image.asset('assets/images/30.png'),
                  onTap: () async {
                    //getGender();
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
                      speakMaleVoice('Hexagon');
                    } else if (data_ == "FEMA") {
                      speakFemaleVoice('Hexagon');
                    }
                  },
                ))
          ],
        ),

        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 380,
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
          ],
        ),

        const SizedBox(height: 12),
      ]),
    );
  }

  void getGuardianEmail() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    guardianEmail = pref.getString('guardian_Email');
    //comments ko to: the key will be passed here (guardian_Email)
    setState(() {});

    void getGuardianGender() async {
      final SharedPreferences pref = await SharedPreferences.getInstance();
      Gender = pref.getString('guardian_Gender');
      //comments ko to: the key will be passed here (guardian_Email)
      setState(() {});
    }
  }

//setstate function
  void displaygender() async {
    gend = data_;
    setState(() {});
  }
}
