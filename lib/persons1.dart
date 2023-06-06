// ignore_for_file: library_private_types_in_public_api, camel_case_types, prefer_const_constructors, unused_import, unused_element, non_constant_identifier_names, avoid_print, prefer_collection_literals, duplicate_ignore

import "package:flutter/material.dart";
import 'package:flutter_tts/flutter_tts.dart';
//import 'package:speechassistive/home2.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:speechassistive/colors2.dart';
import 'package:speechassistive/persons2.dart';
import 'package:speechassistive/schoolitem1.dart';
import 'package:speechassistive/schoolitem2.dart';
import 'package:speechassistive/vocabulary.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';

class Persons1 extends StatefulWidget {
  const Persons1({super.key});

  @override
  _Persons1 createState() => _Persons1();
}

String _data = "";
String data_ = "";
String gend = "";

class _Persons1 extends State<Persons1> {
  final FlutterTts flutterTts = FlutterTts();
  String? Gender;
  String? guardianEmail;
  
  final player = AudioPlayer(); //audio player obj that will play audio

  @override
  void initState() {
    super.initState();
    getGuardianEmail();
    //displaygender();
  }

  Future speakMaleVoice(String text) async {
    print("Male Voice will say: $text");
    String? EL_API_KEY = dotenv.env['EL_API_KEY'] as String?;
    
    print('EL_API_KEY Retrieved');
    print(EL_API_KEY);
    if (EL_API_KEY == null) {
      throw Exception('Failed to retrieve the API key from environment variables.');
    }
    String transformedText = text.split(" ").join("   , ");
    print("Male Voice will say Transformed: $transformedText");

    String url = 'https://api.elevenlabs.io/v1/text-to-speech/ErXwobaYiN019PkySvjV';
    //String url = 'https://api.elevenlabs.io/v1/text-to-speech/EXAVITQu4vr4xnSDxMaL';
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'accept': 'audio/mpeg',
        'xi-api-key': EL_API_KEY,
        'Content-Type': 'application/json',
      },
      body: json.encode({
        "text": transformedText,
        "model_id": "eleven_monolingual_v1",
        "voice_settings": {
          "stability": 0.75, 
          "similarity_boost": 0.75
          }
      }),
    );
    if (response.statusCode == 200) {
      final bytes = response.bodyBytes; //get the bytes ElevenLabs sent back
      await player.setAudioSource(MyCustomSource(
          bytes)); //send the bytes to be read from the JustAudio library
      player.play(); //play the audio
    } else {
      // throw Exception('Failed to load audio');
      return;
    }
    
  }

  Future speakFemaleVoice(String text) async {
    print("Female Voice will say: $text");
    String? EL_API_KEY = dotenv.env['EL_API_KEY'] as String?;
    
    print('EL_API_KEY Retrieved');
    print(EL_API_KEY);
    if (EL_API_KEY == null) {
      throw Exception('Failed to retrieve the API key from environment variables.');
    }
    String transformedText = text.split(" ").join("   , ");
    print("Female Voice will say Transformed: $transformedText");

    String url = 'https://api.elevenlabs.io/v1/text-to-speech/EXAVITQu4vr4xnSDxMaL';
    //String url = 'https://api.elevenlabs.io/v1/text-to-speech/EXAVITQu4vr4xnSDxMaL';
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'accept': 'audio/mpeg',
        'xi-api-key': EL_API_KEY,
        'Content-Type': 'application/json',
      },
      body: json.encode({
        "text": transformedText,
        "model_id": "eleven_monolingual_v1",
        "voice_settings": {
          "stability": 0.75, 
          "similarity_boost": 0.75
          }
      }),
    );
    if (response.statusCode == 200) {
      final bytes = response.bodyBytes; //get the bytes ElevenLabs sent back
      await player.setAudioSource(MyCustomSource(
          bytes)); //send the bytes to be read from the JustAudio library
      player.play(); //play the audio
    } else {
      // throw Exception('Failed to load audio');
      return;
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Tap the CHARACTERS/PERSONS"), centerTitle: true),
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
                  child: Hero(
                    tag: 'dentist', // Unique tag for the blue image
                    child: Image.asset(
                      'assets/images/dentist.png',
                      width: 150,
                      height: 120,
                    ),),
                    onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ZoomedInScreen(imagePath: 'assets/images/dentist.png', tag: 'dentist'),
                      ),
                    );
                      var map = Map<String, dynamic>();
                      map['Email'] = guardianEmail;
                      var uri =
                          "https://www.speech-assistive-app.com/getdata.php";
                      var res = await http.post(Uri.parse(uri), body: map);
                      //print(res.body);
                      final String data = res.body; //content response of res.body must be converted from object to json string by using jsonEncode
                      // ignore: avoid_print
                      data_ = data;
                      setState(() {});
                      if (data_ == "MALE") {
                        speakMaleVoice('-----DENTIST!');
                      } else if (data_ == "FEMA") {
                        speakFemaleVoice('-----DENTIST!');
                      }
                    },
                  ),
                  const Text('DENTIST',
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
                child: Hero(
                  tag: 'doctor', // Unique tag for the blue image
                    child: Image.asset(
                      'assets/images/doctor.png',
                      width: 150,
                      height: 120,
                    ),),
                    onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ZoomedInScreen(imagePath: 'assets/images/doctor.png', tag: 'doctor'),
                      ),
                    );
                      var map = Map<String, dynamic>();
                      map['Email'] = guardianEmail;
                      var uri =
                          "https://www.speech-assistive-app.com/getdata.php";
                      var res = await http.post(Uri.parse(uri), body: map);
                      //print(res.body);
                      final String data = res.body; //content response of res.body must be converted from object to json string by using jsonEncode
                      // ignore: avoid_print
                      data_ = data;
                      setState(() {});
                      if (data_ == "MALE") {
                        speakMaleVoice('-----DOCTOR!');
                      } else if (data_ == "FEMA") {
                        speakFemaleVoice('-----DOCTOR!');
                      }
                    },
                  ),
                  const Text('DOCTOR',
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
                child: Hero(
                  tag: 'nurse', // Unique tag for the blue image
                    child: Image.asset(
                      'assets/images/nurse.png',
                      width: 150,
                      height: 120,
                    ),),
                    onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ZoomedInScreen(imagePath: 'assets/images/nurse.png', tag: 'nurse'),
                      ),
                    );
                      var map = Map<String, dynamic>();
                      map['Email'] = guardianEmail;
                      var uri =
                          "https://www.speech-assistive-app.com/getdata.php";
                      var res = await http.post(Uri.parse(uri), body: map);
                      //print(res.body);
                      final String data = res.body; //content response of res.body must be converted from object to json string by using jsonEncode
                      // ignore: avoid_print
                      data_ = data;
                      setState(() {});
                      if (data_ == "MALE") {
                        speakMaleVoice('-----NURSE!');
                      } else if (data_ == "FEMA") {
                        speakFemaleVoice('-----NURSE!');
                      }
                    },
                  ),
                  const Text('NURSE',
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
                child: Hero(
                  tag: 'police', // Unique tag for the blue image
                    child: Image.asset(
                      'assets/images/police.png',
                      width: 150,
                      height: 120,
                    ),),
                    onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ZoomedInScreen(imagePath: 'assets/images/police.png', tag: 'police'),
                      ),
                    );
                      var map = Map<String, dynamic>();
                      map['Email'] = guardianEmail;
                      var uri =
                          "https://www.speech-assistive-app.com/getdata.php";
                      var res = await http.post(Uri.parse(uri), body: map);
                      //print(res.body);
                      final String data = res.body; //content response of res.body must be converted from object to json string by using jsonEncode
                      // ignore: avoid_print
                      data_ = data;
                      setState(() {});
                      if (data_ == "MALE") {
                        speakMaleVoice('-----POLICE.');
                      } else if (data_ == "FEMA") {
                        speakFemaleVoice('-----POLICE.');
                      }
                    },
                  ),
                  const Text('POLICE',
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
                child: Hero(
                  tag: 'seniorcitizens', // Unique tag for the blue image
                    child: Image.asset(
                      'assets/images/seniorcitizens.png',
                      width: 150,
                      height: 120,
                    ),),
                    onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ZoomedInScreen(imagePath: 'assets/images/seniorcitizens.png', tag: 'seniorcitizens'),
                      ),
                    );
                      var map = Map<String, dynamic>();
                      map['Email'] = guardianEmail;
                      var uri =
                          "https://www.speech-assistive-app.com/getdata.php";
                      var res = await http.post(Uri.parse(uri), body: map);
                      //print(res.body);
                      final String data = res.body; //content response of res.body must be converted from object to json string by using jsonEncode
                      // ignore: avoid_print
                      data_ = data;
                      setState(() {});
                      if (data_ == "MALE") {
                        speakMaleVoice('-----SENIOR CITIZENS!');
                      } else if (data_ == "FEMA") {
                        speakFemaleVoice('-----SENIOR CITIZENS!');
                      }
                    },
                  ),
                  const Text('SENIOR CITIZENS',
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
                    MaterialPageRoute(builder: (context) => const Persons2()),
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
          " Let us know more about the persons \n we encounter in our community. Tap \n each of them below.",
          textAlign: TextAlign.justify,
          style: TextStyle(fontSize: 17, color: Colors.black),
        )
      ],
    );
  }
}






// Feed your own stream of bytes into the player
class MyCustomSource extends StreamAudioSource {
  final List<int> bytes;
  MyCustomSource(this.bytes);

  @override
  Future<StreamAudioResponse> request([int? start, int? end]) async {
    start ??= 0;
    end ??= bytes.length;
    return StreamAudioResponse(
      sourceLength: bytes.length,
      contentLength: end - start,
      offset: start,
      stream: Stream.value(bytes.sublist(start, end)),
      contentType: 'audio/mpeg',
    );
  }
}

class ZoomedInScreen extends StatelessWidget {
  final String imagePath;
  final String tag;

  const ZoomedInScreen({required this.imagePath, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Semi-transparent black background
          Container(
            //color: Colors.black.withOpacity(0.5),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context); // Pop the zoomed-in screen when tapped
            },
            child: Center(
              child: Hero(
                tag: tag, // Use the tag passed from the previous screen
                child: Image.asset(
                  imagePath, // Use the image path passed from the previous screen
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Positioned(
            top: 120,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Pop the zoomed-in screen when the close button is pressed
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.cyan,
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(16),
              ),
              child: Icon(Icons.close),
            ),
          ),
        ],
      ),
    );
  }
}
