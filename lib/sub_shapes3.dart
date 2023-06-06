// ignore_for_file: avoid_print, prefer_const_constructors, unused_import, unused_element, prefer_collection_literals, duplicate_ignore, non_constant_identifier_names

import "package:flutter/material.dart";
import 'package:flutter_tts/flutter_tts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:speechassistive/vocabulary.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';

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
  
  final player = AudioPlayer(); //audio player obj that will play audio

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
                  child: Hero(
                    tag: '25', // Unique tag for the blue image
                    child: Image.asset('assets/images/25.png'),),
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ZoomedInScreen(imagePath: 'assets/images/25.png', tag: '25'),
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
                      speakMaleVoice('-----Cone!');
                    } else if (data_ == "FEMALE") {
                      speakFemaleVoice('-----Cone!');
                    }
                  },
                )),
            SizedBox(
                width: 100,
                height: 120,
                child: GestureDetector(
                  child: Hero(
                    tag: '26', // Unique tag for the blue image
                    child: Image.asset('assets/images/26.png'),),
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ZoomedInScreen(imagePath: 'assets/images/26.png', tag: '26'),
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
                      speakMaleVoice('-----Parallelogram!');
                    } else if (data_ == "FEMALE") {
                      speakFemaleVoice('-----Parallelogram!');
                    }
                  },
                )),
            SizedBox(
                width: 100,
                height: 120,
                child: GestureDetector(
                  child: Hero(
                    tag: '27', // Unique tag for the blue image
                    child: Image.asset('assets/images/27.png'),),
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ZoomedInScreen(imagePath: 'assets/images/27.png', tag: '27'),
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
                      speakMaleVoice('-----Spade!');
                    } else if (data_ == "FEMALE") {
                      speakFemaleVoice('-----Spade!');
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
                  child: Hero(
                    tag: '28', // Unique tag for the blue image
                    child: Image.asset('assets/images/28.png'),),
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ZoomedInScreen(imagePath: 'assets/images/28.png', tag: '28'),
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
                      speakMaleVoice('-----Rectangle!');
                    } else if (data_ == "FEMALE") {
                      speakFemaleVoice('-----Rectangle!');
                    }
                  },
                )),
            SizedBox(
                width: 100,
                height: 120,
                child: GestureDetector(
                  child: Hero(
                    tag: '29', // Unique tag for the blue image
                    child: Image.asset('assets/images/29.png'),),
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ZoomedInScreen(imagePath: 'assets/images/29.png', tag: '29'),
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
                      speakMaleVoice('-----Oval!');
                    } else if (data_ == "FEMALE") {
                      speakFemaleVoice('-----Oval!');
                    }
                  },
                )),
            SizedBox(
                width: 100,
                height: 120,
                child: GestureDetector(
                  child: Hero(
                    tag: '24', // Unique tag for the blue image
                    child: Image.asset('assets/images/30.png'),),
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ZoomedInScreen(imagePath: 'assets/images/30.png', tag: '30'),
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
                      speakMaleVoice('-----Hexagon!');
                    } else if (data_ == "FEMALE") {
                      speakFemaleVoice('-----Hexagon!');
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
