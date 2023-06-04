// ignore_for_file: unused_field, avoid_unnecessary_containers, prefer_interpolation_to_compose_strings, duplicate_ignore, avoid_print, unused_element, unused_import, non_constant_identifier_names, prefer_collection_literals

import "package:flutter/material.dart";
import 'package:speechassistive/fw_gallery.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:speechassistive/vocabulary.dart';
import 'package:shared_preferences/shared_preferences.dart';

final TextEditingController textEditingController = TextEditingController();
final FlutterTts flutterTts = FlutterTts();

// ignore: camel_case_types
class Funcwrd_Eat extends StatefulWidget {
  final TextEditingController textEditingController = TextEditingController();
  Funcwrd_Eat({super.key});
  @override

  // ignore: library_private_types_in_public_api
  _FuncwrdEat createState() => _FuncwrdEat();
}

String _data = "";
String data_ = "";
String gend = "";

class _FuncwrdEat extends State<Funcwrd_Eat> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  String? Gender;
  String? guardianEmail;
  @override
  void initState() {
    super.initState();
    getGuardianEmail();
    _controller = VideoPlayerController.asset('assets/videos/Eating.mp4');
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
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
    textEditingController.text = "Eating";
    return Scaffold(
      appBar: AppBar(
          title: const Text("Tap the FUNCTIONAL WORDS"), centerTitle: true),

      // ignore: avoid_unnecessary_containers
      body: Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        const SizedBox(
          height: 50,
        ),
        AspectRatio(
          aspectRatio: 10 / 7,
          child: VideoPlayer(_controller),
        ),
        Container(
            child: VideoProgressIndicator(_controller,
                allowScrubbing: true,
                colors: const VideoProgressColors(
                  backgroundColor: Colors.redAccent,
                  playedColor: Colors.green,
                  bufferedColor: Colors.purple,
                ))),
        Container(
          child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    if (_controller.value.isPlaying) {
                      _controller.pause();
                    } else {
                      _controller.play();
                    }

                    setState(() {});
                  },
                  icon: Icon(_controller.value.isPlaying
                      ? Icons.pause
                      : Icons.play_arrow)),
              IconButton(
                  onPressed: () {
                    _controller.seekTo(const Duration(seconds: 0));

                    setState(() {});
                  },
                  icon: const Icon(Icons.stop)),
              //dagdag
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            var map = Map<String, dynamic>();
            map['Email'] = guardianEmail;
            var uri = "https://www.speech-assistive-app.com/getdata.php";
            var res = await http.post(Uri.parse(uri), body: map);
            //print(res.body);
            final String data = jsonEncode(res
                .body); //content response of res.body must be converted from object to json string by using jsonEncode
            // ignore: avoid_print
            data_ = (data[15] + data[16] + data[17] + data[18]);
            setState(() {});
            if (data_ == "MALE") {
              speakMaleVoice(textEditingController.text);
            } else if (data_ == "FEMA") {
              speakFemaleVoice(textEditingController.text);
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          child: const Text(
            "Eating",
            style: TextStyle(fontSize: 20),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Gallery()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          child: const Text(
            "Back to Video Gallery",
            style: TextStyle(fontSize: 20),
          ),
        ),
        TextField(
          controller: textEditingController,
          decoration: InputDecoration(
            //hintText: "Expected Answer",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none),
            fillColor: Colors.white.withOpacity(0.3),
            filled: true,
          ),
          style: const TextStyle(color: Colors.white),
          obscureText: false,
        ),
        const SizedBox(
          height: 10,
        ),
      ])),
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
