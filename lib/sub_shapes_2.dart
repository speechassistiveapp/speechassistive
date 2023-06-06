// ignore_for_file: avoid_print, prefer_final_fields, unused_field, prefer_const_constructors, non_constant_identifier_names, unused_element, prefer_collection_literals, duplicate_ignore

import "package:flutter/material.dart";
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speechassistive/sub_shapes3.dart';
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
  
  final player = AudioPlayer(); //audio player obj that will play audio

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
                  child: Hero(
                    tag: '13', // Unique tag for the blue image
                    child: Image.asset('assets/images/13.png'),),
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ZoomedInScreen(imagePath: 'assets/images/13.png', tag: '13'),
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
                      speakMaleVoice('-----Trapezium!');
                    } else if (data_ == "FEMALE") {
                      speakFemaleVoice('-----Trapezium!');
                    }
                  },
                )),
            SizedBox(
                width: 100,
                height: 120,
                child: GestureDetector(
                  child: Hero(
                    tag: '14', // Unique tag for the blue image
                    child: Image.asset('assets/images/14.png'),),
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ZoomedInScreen(imagePath: 'assets/images/14.png', tag: '14'),
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
                      speakMaleVoice('-----Pentagon!');
                    } else if (data_ == "FEMALE") {
                      speakFemaleVoice('-----Pentagon!');
                    }
                  },
                )),
            SizedBox(
                width: 100,
                height: 120,
                child: GestureDetector(
                  child: Hero(
                    tag: '15', // Unique tag for the blue image
                    child: Image.asset('assets/images/15.png'),),
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ZoomedInScreen(imagePath: 'assets/images/15.png', tag: '15'),
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
                      speakMaleVoice('-----Diamond!');
                    } else if (data_ == "FEMALE") {
                      speakFemaleVoice('-----Diamond!');
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
                  child: Hero(
                    tag: '16', // Unique tag for the blue image
                    child: Image.asset('assets/images/16.png'),),
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ZoomedInScreen(imagePath: 'assets/images/16.png', tag: '16'),
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
                      speakMaleVoice('-----Nonagon!');
                    } else if (data_ == "FEMALE") {
                      speakFemaleVoice('-----Nonagon!');
                    }
                  },
                )),
            SizedBox(
                width: 100,
                height: 120,
                child: GestureDetector(
                  child: Hero(
                    tag: '17', // Unique tag for the blue image
                    child: Image.asset('assets/images/17.png'),),
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ZoomedInScreen(imagePath: 'assets/images/17.png', tag: '17'),
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
                      speakMaleVoice('-----Arrow!');
                    } else if (data_ == "FEMALE") {
                      speakFemaleVoice('-----Arrow!');
                    }
                  },
                )),
            SizedBox(
                width: 100,
                height: 120,
                child: GestureDetector(
                  child: Hero(
                    tag: '18', // Unique tag for the blue image
                    child: Image.asset('assets/images/18.png'),),
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ZoomedInScreen(imagePath: 'assets/images/18.png', tag: '18'),
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
                      speakMaleVoice('-----Heptagon!');
                    } else if (data_ == "FEMALE") {
                      speakFemaleVoice('-----Heptagon!');
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
                  child: Hero(
                    tag: '19', // Unique tag for the blue image
                    child: Image.asset('assets/images/19.png'),),
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ZoomedInScreen(imagePath: 'assets/images/19.png', tag: '19'),
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
                      speakMaleVoice('-----Wedge!');
                    } else if (data_ == "FEMALE") {
                      speakFemaleVoice('-----Wedge!');
                    }
                  },
                )),
            SizedBox(
                width: 100,
                height: 120,
                child: GestureDetector(
                  child: Hero(
                    tag: '20', // Unique tag for the blue image
                    child: Image.asset('assets/images/20.png'),),
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ZoomedInScreen(imagePath: 'assets/images/20.png', tag: '20'),
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
                      speakMaleVoice('-----Cylinder!');
                    } else if (data_ == "FEMALE") {
                      speakFemaleVoice('-----Cylinder!');
                    }
                  },
                )),
            SizedBox(
                width: 100,
                height: 120,
                child: GestureDetector(
                  child: Hero(
                    tag: '21', // Unique tag for the blue image
                    child: Image.asset('assets/images/21.png'),),
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ZoomedInScreen(imagePath: 'assets/images/21.png', tag: '21'),
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
                      speakMaleVoice('-----Heart!');
                    } else if (data_ == "FEMALE") {
                      speakFemaleVoice('-----Heart!');
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
                  child: Hero(
                    tag: '22', // Unique tag for the blue image
                    child: Image.asset('assets/images/22.png'),),
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ZoomedInScreen(imagePath: 'assets/images/22.png', tag: '22'),
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
                      speakMaleVoice('-----Octagon!');
                    } else if (data_ == "FEMALE") {
                      speakFemaleVoice('-----Octagon!');
                    }
                  },
                )),
            SizedBox(
                width: 100,
                height: 120,
                child: GestureDetector(
                  child: Hero(
                    tag: '23', // Unique tag for the blue image
                    child: Image.asset('assets/images/23.png'),),
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ZoomedInScreen(imagePath: 'assets/images/23.png', tag: '23'),
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
                      speakMaleVoice('-----Drop!');
                    } else if (data_ == "FEMALE") {
                      speakFemaleVoice('-----Drop!');
                    }
                  },
                )),
            SizedBox(
                width: 100,
                height: 120,
                child: GestureDetector(
                  child: Hero(
                    tag: '24', // Unique tag for the blue image
                    child: Image.asset('assets/images/24.png'),),
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ZoomedInScreen(imagePath: 'assets/images/24.png', tag: '24'),
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
                      speakMaleVoice('-----Semi-circle!');
                    } else if (data_ == "FEMALE") {
                      speakFemaleVoice('-----Semi-circle!');
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
