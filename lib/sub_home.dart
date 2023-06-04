// ignore_for_file: avoid_print, prefer_const_constructors, unused_import, unused_element, non_constant_identifier_names, prefer_collection_literals, duplicate_ignore

import "package:flutter/material.dart";
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speechassistive/home2.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:speechassistive/vocabulary.dart';
import 'package:shared_preferences/shared_preferences.dart';

///import 'package:speechassistive/vocabulary.dart';

List<String> imageList = [
  'assets/images/ho1.png',
  'assets/images/ho2.png',
  'assets/images/ho3.png',
  'assets/images/ho4.png',
  'assets/images/ho5.png',
  'assets/images/ho6.png',
  'assets/images/ho7.png',
  'assets/images/ho8.png'
];

final FlutterTts flutterTts = FlutterTts();

// ignore: camel_case_types
class sub_Home extends StatefulWidget {
  const sub_Home({super.key});
  @override

  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

String _data = "";
String data_ = "";
String gend = "";

class _HomeState extends State<sub_Home> {
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
      appBar: AppBar(
          title: const Text("Tap the PARTS OF THE HOUSE"), centerTitle: true),
      body: Column(children: [
        //guardianEmail == null
        //? const Text('No Email passed')
        //: Text(guardianEmail!,
        // style: const TextStyle(
        //  color: Colors
        // .black)), //spacer between the Appbar and the button
        const SizedBox(height: 20),
        _header(context),
        const SizedBox(height: 30), //spacer between the Appbar and the buttons

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                width: 150,
                height: 100,
                child: GestureDetector(
                  child: Image.asset('assets/images/ho1.png'),
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
                      speakMaleVoice('Dining Room');
                    } else if (data_ == "FEMA") {
                      speakFemaleVoice('Dining Room');
                    }
                  },
                )),
            SizedBox(
                width: 150,
                height: 100,
                child: GestureDetector(
                  child: Image.asset('assets/images/ho2.png'),
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
                      speakMaleVoice('Door');
                    } else if (data_ == "FEMA") {
                      speakFemaleVoice('Door');
                    }
                  },
                ))
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                width: 150,
                height: 100,
                child: GestureDetector(
                  child: Image.asset('assets/images/ho3.png'),
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
                      speakMaleVoice('Kitchen');
                    } else if (data_ == "FEMA") {
                      speakFemaleVoice('Kitchen');
                    }
                  },
                )),
            SizedBox(
                width: 150,
                height: 100,
                child: GestureDetector(
                  child: Image.asset('assets/images/ho4.png'),
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
                      speakMaleVoice('Living Room');
                    } else if (data_ == "FEMA") {
                      speakFemaleVoice('Living Room');
                    }
                  },
                ))
          ],
        ),

        const SizedBox(
          height: 30,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                width: 150,
                height: 100,
                child: GestureDetector(
                  child: Image.asset('assets/images/ho5.png'),
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
                      speakMaleVoice('Roof');
                    } else if (data_ == "FEMA") {
                      speakFemaleVoice('Roof');
                    }
                  },
                )),
            SizedBox(
                width: 150,
                height: 100,
                child: GestureDetector(
                  child: Image.asset('assets/images/ho6.png'),
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
                      speakMaleVoice('Stairs');
                    } else if (data_ == "FEMA") {
                      speakFemaleVoice('Stairs');
                    }
                  },
                ))
          ],
        ),

        const SizedBox(
          height: 30,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                width: 150,
                height: 100,
                child: GestureDetector(
                  child: Image.asset('assets/images/ho7.png'),
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
                      speakMaleVoice('Window');
                    } else if (data_ == "FEMA") {
                      speakFemaleVoice('Window');
                    }
                  },
                )),
            SizedBox(
                width: 150,
                height: 100,
                child: GestureDetector(
                  child: Image.asset('assets/images/ho8.png'),
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
                      speakMaleVoice('Living Room');
                    } else if (data_ == "FEMA") {
                      speakFemaleVoice('Living Room');
                    }
                  },
                ))
          ],
        ),

        const SizedBox(height: 20),
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
                    MaterialPageRoute(builder: (context) => const Home2()),
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
          " Join me in a house tour. Let us check what \n we can find in this house. Tap each of the \n parts below.",
          textAlign: TextAlign.justify,
          style: TextStyle(fontSize: 17, color: Colors.black),
        )
      ],
    );
  }
}
