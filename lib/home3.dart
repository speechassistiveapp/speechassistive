// ignore_for_file: avoid_print, prefer_const_constructors, unused_import, duplicate_import, unused_element, non_constant_identifier_names, prefer_collection_literals, duplicate_ignore

import "package:flutter/material.dart";
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speechassistive/home4.dart';
import 'package:speechassistive/vocabulary.dart';
//import 'package:speechassistive/vocabulary.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:speechassistive/vocabulary.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<String> imageList = [
  'assets/images/ho17.png',
  'assets/images/ho18.png',
  'assets/images/ho18.png',
  'assets/images/ho20.png',
  'assets/images/ho21.png',
  'assets/images/ho22.png',
  'assets/images/ho23.png',
  'assets/images/ho24.png'
];

final FlutterTts flutterTts = FlutterTts();

// ignore: camel_case_types
class Home3 extends StatefulWidget {
  const Home3({super.key});
  @override

  // ignore: library_private_types_in_public_api
  _home3 createState() => _home3();
}

String _data = "";
String data_ = "";
String gend = "";

// ignore: camel_case_types
class _home3 extends State<Home3> {
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
        // guardianEmail == null
        //? const Text('No Email passed')
        // : Text(guardianEmail!,
        // style: const TextStyle(
        // color: Colors
        // .black)), //spacer between the Appbar and the button
        const SizedBox(height: 50), //spacer between the Appbar and the buttons

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                width: 150,
                height: 100,
                child: GestureDetector(
                  child: Image.asset('assets/images/ho17.png'),
                  onTap: () async {
                    //getGender();
                    var map = Map<String, dynamic>();
                    map['Email'] = guardianEmail;
                    var uri =
                        "https://www.speech-assistive-app.com/getdata.php";
                    var res = await http.post(Uri.parse(uri), body: map);
                    print(res.body);
                    final String data = jsonEncode(res
                        .body); //content response of res.body must be converted from object to json string by using jsonEncode
                    // ignore: avoid_print
                    data_ = (data[15] + data[16] + data[17] + data[18]);
                    setState(() {});
                    if (data_ == "MALE") {
                      speakMaleVoice('Bench');
                    } else if (data_ == "FEMA") {
                      speakFemaleVoice('Bench');
                    }
                  },
                )),
            SizedBox(
                width: 150,
                height: 100,
                child: GestureDetector(
                  child: Image.asset('assets/images/ho18.png'),
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
                      speakMaleVoice('Comfort Room');
                    } else if (data_ == "FEMA") {
                      speakFemaleVoice('Comfort Room');
                    }
                  },
                ))
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                width: 150,
                height: 100,
                child: GestureDetector(
                  child: Image.asset('assets/images/ho19.png'),
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
                      speakMaleVoice('Dog House');
                    } else if (data_ == "FEMA") {
                      speakFemaleVoice('Dog House');
                    }
                  },
                )),
            SizedBox(
                width: 150,
                height: 100,
                child: GestureDetector(
                  child: Image.asset('assets/images/ho20.png'),
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
                      speakMaleVoice('Fence');
                    } else if (data_ == "FEMA") {
                      speakFemaleVoice('Fence');
                    }
                  },
                ))
          ],
        ),

        const SizedBox(
          height: 20,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                width: 150,
                height: 100,
                child: GestureDetector(
                  child: Image.asset('assets/images/ho21.png'),
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
                      speakMaleVoice('Game Room');
                    } else if (data_ == "FEMA") {
                      speakFemaleVoice('Game Room');
                    }
                  },
                )),
            SizedBox(
                width: 150,
                height: 100,
                child: GestureDetector(
                  child: Image.asset('assets/images/ho22.png'),
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
                      speakMaleVoice('Garage');
                    } else if (data_ == "FEMA") {
                      speakFemaleVoice('Garage');
                    }
                  },
                ))
          ],
        ),

        const SizedBox(
          height: 20,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                width: 150,
                height: 100,
                child: GestureDetector(
                  child: Image.asset('assets/images/ho23.png'),
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
                      speakMaleVoice('Garden');
                    } else if (data_ == "FEMA") {
                      speakFemaleVoice('Garden');
                    }
                  },
                )),
            SizedBox(
                width: 150,
                height: 100,
                child: GestureDetector(
                  child: Image.asset('assets/images/ho24.png'),
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
                      speakMaleVoice('House');
                    } else if (data_ == "FEMA") {
                      speakFemaleVoice('House');
                    }
                  },
                ))
          ],
        ),

        const SizedBox(height: 30),
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
                    MaterialPageRoute(builder: (context) => const Home4()),
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
}
