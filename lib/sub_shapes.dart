// ignore_for_file: avoid_print, unnecessary_import, unused_shown_name, unnecessary_new, unused_import, duplicate_ignore, unused_field, non_constant_identifier_names, duplicate_import, prefer_const_constructors, prefer_collection_literals, camel_case_types, unused_element

import 'package:flutter/material.dart';
//import 'package:vector_math/vector_math.dart' as prefix;
// ignore: unused_import
//import 'package:vector_math/vector_math_64.dart' as prefix;
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speechassistive/selectAvatar.dart';
import 'package:speechassistive/sub_shapes_2.dart';
//import 'package:matrix4_transform/matrix4_transform.dart';
//import 'package:vector_math/vector_math_64.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:speechassistive/vocabulary.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<String> imageList = [
  'assets/images/1.png',
  'assets/images/2.png',
  'assets/images/3.png',
  'assets/images/4.png',
  'assets/images/5.png',
  'assets/images/6.png',
  'assets/images/7.png',
  'assets/images/8.png',
  'assets/images/9.png',
  'assets/images/10.png',
  'assets/images/11.png',
  'assets/images/12.png',
];

final FlutterTts flutterTts = FlutterTts();

// ignore: camel_case_types
class sub_Shapes extends StatefulWidget {
  const sub_Shapes({super.key});

  @override

  // ignore: library_private_types_in_public_api
  _ShapeState createState() => _ShapeState();
}

String _data = "";
String data_ = "";
String gend = "";

class _ShapeState extends State<sub_Shapes> {
  // with SingleTickerProviderStateMixin
  //late Animation _animation;
  //late AnimationController _animationController;
  String? Gender;
  String? guardianEmail;

  @override
  void initState() {
    super.initState();
    getGuardianEmail();
    //displaygender();
  }

  Future getGender() async {
// ignore: prefer_collection_literals

    var map = Map<String, dynamic>();
    map['Email'] = guardianEmail;
    var uri = "https://www.speech-assistive-app.com/getdata.php";
    var res = await http.post(Uri.parse(uri), body: map);

    //print(res.body);
    final String data = jsonEncode(res
        .body); //content response of res.body must be converted from object to json string by using jsonEncode
    // ignore: avoid_print

    //print(data[15]);
    //print(data[16]);
    //print(data[17]);
    //print(data[18]);
    data_ = (data[15] + data[16] + data[17] + data[18]);

    setState(() {});
    //displaygender(); //function with setState function

    //print(data_);
  }

  Future speakMaleVoice(String text) async {
    await flutterTts.setLanguage("en-GB");
    await flutterTts.setPitch(0.6);
    await flutterTts.speak(text);
    await flutterTts.setVoice({"name": "en-US-Neural2-D", "locale": "en-US"});
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
    TextEditingController email = TextEditingController();
    //email.text = guardianEmail.toString();
    return Scaffold(
      appBar: AppBar(title: const Text("Tap the SHAPES"), centerTitle: true),
      body: Column(children: [
        //TextField(
        //controller: email,
        //decoration: InputDecoration(
        //hintText: "Email",
        // contentPadding: EdgeInsets.all(5.0),
        // border: OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(30),
        //   borderSide: BorderSide.none),
        //fillColor: Colors.grey.withOpacity(0.3),
        // filled: true,
        // prefixIcon: const Icon(Icons.email)),
        // ),
        const SizedBox(height: 30),
        _header(context),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                width: 100,
                height: 120,
                child: GestureDetector(
                  child: Image.asset('assets/images/9.png'),
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
                      speakMaleVoice('Cross');
                    } else if (data_ == "FEMA") {
                      speakFemaleVoice('Cross');
                    }
                  },
                )),
            SizedBox(
                width: 100,
                height: 120,
                child: GestureDetector(
                  child: Image.asset('assets/images/2.png'),
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
                      speakMaleVoice('Quadralateral');
                    } else if (data_ == "FEMA") {
                      speakFemaleVoice('Quadralateral');
                    }
                  },
                )),
            SizedBox(
                width: 100,
                height: 120,
                child: GestureDetector(
                  child: Image.asset(
                    'assets/images/3.png',
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
                      speakMaleVoice('Pyramid');
                    } else if (data_ == "FEMA") {
                      speakFemaleVoice('Pyramid');
                    }
                  },
                ))
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                width: 100,
                height: 120,
                child: GestureDetector(
                  child: Image.asset('assets/images/4.png'),
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
                      speakMaleVoice('Sphere');
                    } else if (data_ == "FEMA") {
                      speakFemaleVoice('Sphere');
                    }
                  },
                )),
            SizedBox(
                width: 100,
                height: 120,
                child: GestureDetector(
                  child: Image.asset('assets/images/5.png'),
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
                      speakMaleVoice('Star');
                    } else if (data_ == "FEMA") {
                      speakFemaleVoice('Star');
                    }
                  },
                )),
            SizedBox(
                width: 100,
                height: 120,
                child: GestureDetector(
                  child: Image.asset('assets/images/6.png'),
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
                      speakMaleVoice('Rhombus');
                    } else if (data_ == "FEMA") {
                      speakFemaleVoice('Rhombus');
                    }
                  },
                )),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                width: 100,
                height: 120,
                child: GestureDetector(
                  child: Image.asset('assets/images/7.png'),
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
                      speakMaleVoice('Dodecagon');
                    } else if (data_ == "FEMA") {
                      speakFemaleVoice('Dodecagon');
                    }
                  },
                )),
            SizedBox(
                width: 100,
                height: 120,
                child: GestureDetector(
                  child: Image.asset('assets/images/8.png'),
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
                      speakMaleVoice('Circle');
                    } else if (data_ == "FEMA") {
                      speakFemaleVoice('Circle');
                    }
                  },
                )),
            SizedBox(
                width: 100,
                height: 120,
                child: GestureDetector(
                  child: Image.asset('assets/images/1.png'),
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
                      speakMaleVoice('Cube');
                    } else if (data_ == "FEMA") {
                      speakFemaleVoice('Cube');
                    }
                  },
                ))
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                width: 100,
                height: 120,
                child: GestureDetector(
                  child: Image.asset('assets/images/10.png'),
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
                      speakMaleVoice('Club');
                    } else if (data_ == "FEMA") {
                      speakFemaleVoice('Club');
                    }
                  },
                )),
            SizedBox(
                width: 100,
                height: 120,
                child: GestureDetector(
                  child: Image.asset('assets/images/11.png'),
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
                      speakMaleVoice('Crescent');
                    } else if (data_ == "FEMA") {
                      speakFemaleVoice('Crescent');
                    }
                  },
                )),
            SizedBox(
                width: 100,
                height: 120,
                child: GestureDetector(
                  child: Image.asset('assets/images/12.png'),
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
                      speakMaleVoice('Triangle');
                    } else if (data_ == "FEMA") {
                      speakFemaleVoice('Triangle');
                    }
                  },
                )),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 220,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  email.text = "";
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
                        builder: (context) => const sub_Shapes2()),
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
          " Let us learn the different shapes. \n Tap each shape below.",
          textAlign: TextAlign.justify,
          style: TextStyle(fontSize: 17, color: Colors.black),
        )
      ],
    );
  }
}

//setstate function
  //void displaygender() async {
    //gend = data_;
   // setState(() {});
//  }

