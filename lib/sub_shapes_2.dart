// ignore_for_file: avoid_print, prefer_final_fields, unused_field, prefer_const_constructors, non_constant_identifier_names, unused_element, prefer_collection_literals, duplicate_ignore

import "package:flutter/material.dart";
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speechassistive/sub_shapes3.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:speechassistive/vocabulary.dart';

List<String> imageList = [
  'assets/images/13.png',
  'assets/images/14.png',
  'assets/images/15.png',
  'assets/images/16.png',
  'assets/images/17.png',
  'assets/images/18.png',
  'assets/images/19.png',
  'assets/images/20.png',
  'assets/images/21.png',
  'assets/images/22.png',
  'assets/images/23.png',
  'assets/images/24.png',
];

final FlutterTts flutterTts = FlutterTts();

// ignore: camel_case_types
class sub_Shapes2 extends StatefulWidget {
  const sub_Shapes2({super.key});
  @override

  // ignore: library_private_types_in_public_api
  _ShapeState2 createState() => _ShapeState2();
}

String _data = "";
String data_ = "";
String gend = "";

class _ShapeState2 extends State<sub_Shapes2> {
  String? Gender;
  String? guardianEmail;
  double _width = 200;
  double _height = 200;

  @override
  void initState() {
    super.initState();
    getGuardianEmail();
    //displaygender();
  }

  Future<void> updateState() async {
    if (_width == 200) {
      setState(() {
        _width = 400;
        _height = 400;
      });
    } else {
      setState(() {
        _width = 200;
        _height = 200;
      });
    }
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
        //const SizedBox(height: 1),
        //guardianEmail == null
        // ? const Text('No Email passed')
        // : Text(guardianEmail!,
        //   style: const TextStyle(
        // color: Colors
        //   .white)), //spacer between the Appbar and the buttons

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                width: 100,
                height: 120,
                child: GestureDetector(
                  child: Image.asset('assets/images/13.png'),
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
                      speakMaleVoice('Trapezium');
                    } else if (data_ == "FEMA") {
                      speakFemaleVoice('Trapezium');
                    }
                  },
                )),
            SizedBox(
                width: 100,
                height: 120,
                child: GestureDetector(
                  child: Image.asset('assets/images/14.png'),
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
                      speakMaleVoice('Pentagon');
                    } else if (data_ == "FEMA") {
                      speakFemaleVoice('Pentagon');
                    }
                  },
                )),
            SizedBox(
                width: 100,
                height: 120,
                child: GestureDetector(
                  child: Image.asset('assets/images/15.png'),
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
                      speakMaleVoice('Diamond');
                    } else if (data_ == "FEMA") {
                      speakFemaleVoice('Diamond');
                    }
                  },
                )),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                width: 100,
                height: 120,
                child: GestureDetector(
                  child: Image.asset('assets/images/16.png'),
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
                      speakMaleVoice('Nonangon');
                    } else if (data_ == "FEMA") {
                      speakFemaleVoice('Nonagon');
                    }
                  },
                )),
            SizedBox(
                width: 100,
                height: 120,
                child: GestureDetector(
                  child: Image.asset('assets/images/17.png'),
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
                      speakMaleVoice('Arrow');
                    } else if (data_ == "FEMA") {
                      speakFemaleVoice('Arrow');
                    }
                  },
                )),
            SizedBox(
                width: 100,
                height: 120,
                child: GestureDetector(
                  child: Image.asset('assets/images/18.png'),
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
                      speakMaleVoice('Heptagon');
                    } else if (data_ == "FEMA") {
                      speakFemaleVoice('Heptagon');
                    }
                  },
                ))
          ],
        ),

        const SizedBox(
          height: 10,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                width: 100,
                height: 120,
                child: GestureDetector(
                  child: Image.asset('assets/images/19.png'),
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
                      speakMaleVoice('Wedge');
                    } else if (data_ == "FEMA") {
                      speakFemaleVoice('Wedge');
                    }
                  },
                )),
            SizedBox(
                width: 100,
                height: 120,
                child: GestureDetector(
                  child: Image.asset('assets/images/20.png'),
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
                      speakMaleVoice('Cylinder');
                    } else if (data_ == "FEMA") {
                      speakFemaleVoice('Cylinder');
                    }
                  },
                )),
            SizedBox(
                width: 100,
                height: 120,
                child: GestureDetector(
                  child: Image.asset('assets/images/21.png'),
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
                      speakMaleVoice('Heart');
                    } else if (data_ == "FEMA") {
                      speakFemaleVoice('Heart');
                    }
                  },
                ))
          ],
        ),

        const SizedBox(
          height: 10,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                width: 100,
                height: 120,
                child: GestureDetector(
                  child: Image.asset('assets/images/22.png'),
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
                      speakMaleVoice('Octagon');
                    } else if (data_ == "FEMA") {
                      speakFemaleVoice('Octagon');
                    }
                  },
                )),
            SizedBox(
                width: 100,
                height: 120,
                child: GestureDetector(
                  child: Image.asset('assets/images/23.png'),
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
                      speakMaleVoice('Drop');
                    } else if (data_ == "FEMA") {
                      speakFemaleVoice('Drop');
                    }
                  },
                )),
            SizedBox(
                width: 100,
                height: 120,
                child: GestureDetector(
                  child: Image.asset('assets/images/24.png'),
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
                      speakMaleVoice('Semicircle');
                    } else if (data_ == "FEMA") {
                      speakFemaleVoice('Semicircle');
                    }
                  },
                )),
            const SizedBox(height: 10),
          ],
        ),
        const SizedBox(height: 10),
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
                        builder: (context) => const sub_Shapes3()),
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
