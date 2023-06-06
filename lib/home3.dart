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

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';

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
                child: Hero(
                  tag: 'ho17', // Unique tag for the blue image
                    child: Image.asset('assets/images/ho17.png'),),
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ZoomedInScreen(imagePath: 'assets/images/ho17.png', tag: 'ho17'),
                      ),
                    );
                      var map = Map<String, dynamic>();
                    map['Email'] = guardianEmail;
                    var uri =
                        "https://www.speech-assistive-app.com/getdata.php";
                    var res = await http.post(Uri.parse(uri), body: map);
                    print(res.body);
                    final String data = res.body; //content response of res.body must be converted from object to json string by using jsonEncode
                    // ignore: avoid_print
                    data_ = data;
                    setState(() {});
                    if (data_ == "MALE") {
                      speakMaleVoice('-----Bench');
                    } else if (data_ == "FEMA") {
                      speakFemaleVoice('-----Bench');
                    }
                  },
                )),
            SizedBox(
                width: 150,
                height: 100,
                child: GestureDetector(
                child: Hero(
                  tag: 'ho18', // Unique tag for the blue image
                    child: Image.asset('assets/images/ho18.png'),),
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ZoomedInScreen(imagePath: 'assets/images/ho18.png', tag: 'ho18'),
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
                      speakMaleVoice('-----Comfort Room');
                    } else if (data_ == "FEMA") {
                      speakFemaleVoice('-----Comfort Room');
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
                child: Hero(
                  tag: 'ho19', // Unique tag for the blue image
                    child: Image.asset('assets/images/ho19.png'),),
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ZoomedInScreen(imagePath: 'assets/images/ho19.png', tag: 'ho19'),
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
                      speakMaleVoice('-----Dog House');
                    } else if (data_ == "FEMA") {
                      speakFemaleVoice('-----Dog House');
                    }
                  },
                )),
            SizedBox(
                width: 150,
                height: 100,
                child: GestureDetector(
                child: Hero(
                  tag: 'ho20', // Unique tag for the blue image
                    child: Image.asset('assets/images/ho20.png'),),
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ZoomedInScreen(imagePath: 'assets/images/ho20.png', tag: 'ho20'),
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
                      speakMaleVoice('-----Fence');
                    } else if (data_ == "FEMA") {
                      speakFemaleVoice('-----Fence');
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
                child: Hero(
                  tag: 'ho21', // Unique tag for the blue image
                    child: Image.asset('assets/images/ho21.png'),),
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ZoomedInScreen(imagePath: 'assets/images/ho21.png', tag: 'ho21'),
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
                      speakMaleVoice('-----Game Room');
                    } else if (data_ == "FEMA") {
                      speakFemaleVoice('-----Game Room');
                    }
                  },
                )),
            SizedBox(
                width: 150,
                height: 100,
                child: GestureDetector(
                child: Hero(
                  tag: 'ho22', // Unique tag for the blue image
                    child: Image.asset('assets/images/ho22.png'),),
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ZoomedInScreen(imagePath: 'assets/images/ho22.png', tag: 'ho22'),
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
                      speakMaleVoice('-----Garage');
                    } else if (data_ == "FEMA") {
                      speakFemaleVoice('-----Garage');
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
                child: Hero(
                  tag: 'ho23', // Unique tag for the blue image
                    child: Image.asset('assets/images/ho23.png'),),
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ZoomedInScreen(imagePath: 'assets/images/ho23.png', tag: 'ho23'),
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
                      speakMaleVoice('-----Garden');
                    } else if (data_ == "FEMA") {
                      speakFemaleVoice('-----Garden');
                    }
                  },
                )),
            SizedBox(
                width: 150,
                height: 100,
                child: GestureDetector(
                child: Hero(
                  tag: 'ho24', // Unique tag for the blue image
                    child: Image.asset('assets/images/ho24.png'),),
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ZoomedInScreen(imagePath: 'assets/images/ho24.png', tag: 'ho24'),
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
                      speakMaleVoice('-----House');
                    } else if (data_ == "FEMA") {
                      speakFemaleVoice('-----House');
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
