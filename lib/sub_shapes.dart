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

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';

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
  
  final player = AudioPlayer(); //audio player obj that will play audio

  @override
  void initState() {
    super.initState();
    getGuardianEmail();
    
    //displaygender();
  }

  Future getGender() async {
  //getGender();
                    var map = Map<String, dynamic>();
                    map['Email'] = guardianEmail;
                    var uri =
                        "https://www.speech-assistive-app.com/getdata.php";
                    var res = await http.post(Uri.parse(uri), body: map);
                    //print(res.body);
                    final String data = res
                        .body; //content response of res.body must be converted from object to json string by using jsonEncode
                    // ignore: avoid_print
                    data_ = data;
                    setState(() {});
                    if (data_ == "MALE") {
                      speakMaleVoice('Cross');
                    } else if (data_ == "FEMALE") {
                      speakFemaleVoice('Cross');
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
                child: Hero(
                  tag: 'crossImageTag', // Unique tag for the blue image
                  child: Image.asset('assets/images/9.png'),),
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ZoomedInScreen(imagePath: 'assets/images/9.png', tag: 'crossImageTag'),
                      ),
                    );
                    //getGender();
                    var map = Map<String, dynamic>();
                    map['Email'] = guardianEmail;
                    var uri =
                        "https://www.speech-assistive-app.com/getdata.php";
                    var res = await http.post(Uri.parse(uri), body: map);
                    //print(res.body);
                    final String data = res
                        .body; //content response of res.body must be converted from object to json string by using jsonEncode
                    // ignore: avoid_print
                    data_ = data;
                    setState(() {});
                    if (data_ == "MALE") {
                      speakMaleVoice('-----CROSS!');
                    } else if (data_ == "FEMALE") {
                      speakFemaleVoice('-----CROSS!');
                    }
                  },
                )),
            SizedBox(
                width: 100,
                height: 120,
                child: GestureDetector(
        child: Hero(
          tag: '2ImageTag', // Unique tag for the blue image
                  child: Image.asset('assets/images/2.png'),),
                  onTap: () async {Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ZoomedInScreen(imagePath: 'assets/images/2.png', tag: '2ImageTag'),
            ),
          );
                    var map = Map<String, dynamic>();
                    map['Email'] = guardianEmail;
                    var uri =
                        "https://www.speech-assistive-app.com/getdata.php";
                    var res = await http.post(Uri.parse(uri), body: map);
                    //print(res.body);
                    final String data = res
                        .body; //content response of res.body must be converted from object to json string by using jsonEncode
                    // ignore: avoid_print
                    data_ = data;
                    setState(() {});
                    if (data_ == "MALE") {
                      speakMaleVoice('-----Quadralateral!');
                    } else if (data_ == "FEMALE") {
                      speakFemaleVoice('-----Quadralateral!');
                    }
                  },
                )),
            SizedBox(
                width: 100,
                height: 120,
                child: GestureDetector(
        child: Hero(
          tag: '3ImageTag', // Unique tag for the blue image
                  child: Image.asset(
                    'assets/images/3.png',
                  ),),
                  onTap: () async {Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ZoomedInScreen(imagePath: 'assets/images/3.png', tag: '3ImageTag'),
            ),
          );
                    var map = Map<String, dynamic>();
                    map['Email'] = guardianEmail;
                    var uri =
                        "https://www.speech-assistive-app.com/getdata.php";
                    var res = await http.post(Uri.parse(uri), body: map);
                    //print(res.body);
                    final String data = res
                        .body; //content response of res.body must be converted from object to json string by using jsonEncode
                    // ignore: avoid_print
                    data_ = data;
                    setState(() {});
                    if (data_ == "MALE") {
                      speakMaleVoice('-----Pyramid!');
                    } else if (data_ == "FEMALE") {
                      speakFemaleVoice('-----Pyramid!');
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
        child: Hero(
          tag: '4ImageTag', // Unique tag for the blue image
                  child: Image.asset('assets/images/4.png'),),
                  onTap: () async {Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ZoomedInScreen(imagePath: 'assets/images/4.png', tag: '4ImageTag'),
            ),
          );
                    var map = Map<String, dynamic>();
                    map['Email'] = guardianEmail;
                    var uri =
                        "https://www.speech-assistive-app.com/getdata.php";
                    var res = await http.post(Uri.parse(uri), body: map);
                    //print(res.body);
                    final String data = res
                        .body; //content response of res.body must be converted from object to json string by using jsonEncode
                    // ignore: avoid_print
                    data_ = data;
                    setState(() {});
                    if (data_ == "MALE") {
                      speakMaleVoice('-----Sphere!');
                    } else if (data_ == "FEMALE") {
                      speakFemaleVoice('-----Sphere!');
                    }
                  },
                )),
            SizedBox(
                width: 100,
                height: 120,
                child: GestureDetector(
        child: Hero(
          tag: '5ImageTag', // Unique tag for the blue image
                  child: Image.asset('assets/images/5.png'),),
                  onTap: () async {Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ZoomedInScreen(imagePath: 'assets/images/5.png', tag: '5ImageTag'),
            ),
          );
                    var map = Map<String, dynamic>();
                    map['Email'] = guardianEmail;
                    var uri =
                        "https://www.speech-assistive-app.com/getdata.php";
                    var res = await http.post(Uri.parse(uri), body: map);
                    //print(res.body);
                    final String data = res
                        .body; //content response of res.body must be converted from object to json string by using jsonEncode
                    // ignore: avoid_print
                    data_ = data;
                    setState(() {});
                    if (data_ == "MALE") {
                      speakMaleVoice('-----Star!');
                    } else if (data_ == "FEMALE") {
                      speakFemaleVoice('-----Star!');
                    }
                  },
                )),
            SizedBox(
                width: 100,
                height: 120,
                child: GestureDetector(
        child: Hero(
          tag: '6ImageTag', // Unique tag for the blue image
                  child: Image.asset('assets/images/6.png'),),
                  onTap: () async {Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ZoomedInScreen(imagePath: 'assets/images/6.png', tag: '6ImageTag'),
            ),
          );
                    var map = Map<String, dynamic>();
                    map['Email'] = guardianEmail;
                    var uri =
                        "https://www.speech-assistive-app.com/getdata.php";
                    var res = await http.post(Uri.parse(uri), body: map);
                    //print(res.body);
                    final String data = res
                        .body; //content response of res.body must be converted from object to json string by using jsonEncode
                    // ignore: avoid_print
                    data_ = data;
                    setState(() {});
                    if (data_ == "MALE") {
                      speakMaleVoice('-----Rhombus!');
                    } else if (data_ == "FEMALE") {
                      speakFemaleVoice('-----Rhombus!');
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
        child: Hero(
          tag: '7ImageTag', // Unique tag for the blue image
                  child: Image.asset('assets/images/7.png'),),
                  onTap: () async {Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ZoomedInScreen(imagePath: 'assets/images/7.png', tag: '7ImageTag'),
            ),
          );
                    var map = Map<String, dynamic>();
                    map['Email'] = guardianEmail;
                    var uri =
                        "https://www.speech-assistive-app.com/getdata.php";
                    var res = await http.post(Uri.parse(uri), body: map);
                    //print(res.body);
                    final String data = res
                        .body; //content response of res.body must be converted from object to json string by using jsonEncode
                    // ignore: avoid_print
                    data_ = data;
                    setState(() {});
                    if (data_ == "MALE") {
                      speakMaleVoice('-----Do-decagon!');
                    } else if (data_ == "FEMALE") {
                      speakFemaleVoice('-----Do-decagon!');
                    }
                  },
                )),
            SizedBox(
                width: 100,
                height: 120,
                child: GestureDetector(
        child: Hero(
          tag: '8ImageTag', // Unique tag for the blue image
                  child: Image.asset('assets/images/8.png'),),
                  onTap: () async {Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ZoomedInScreen(imagePath: 'assets/images/8.png', tag: '8ImageTag'),
            ),
          );
                    var map = Map<String, dynamic>();
                    map['Email'] = guardianEmail;
                    var uri =
                        "https://www.speech-assistive-app.com/getdata.php";
                    var res = await http.post(Uri.parse(uri), body: map);
                    //print(res.body);
                    final String data = res
                        .body; //content response of res.body must be converted from object to json string by using jsonEncode
                    // ignore: avoid_print
                    data_ = data;
                    setState(() {});
                    if (data_ == "MALE") {
                      speakMaleVoice('-----Circle!');
                    } else if (data_ == "FEMALE") {
                      speakFemaleVoice('-----Circle!');
                    }
                  },
                )),
            SizedBox(
                width: 100,
                height: 120,
                child: GestureDetector(
        child: Hero(
          tag: '1ImageTag', // Unique tag for the blue image
                  child: Image.asset('assets/images/1.png'),),
                  onTap: () async {Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ZoomedInScreen(imagePath: 'assets/images/1.png', tag: '1ImageTag'),
            ),
          );
                    var map = Map<String, dynamic>();
                    map['Email'] = guardianEmail;
                    var uri =
                        "https://www.speech-assistive-app.com/getdata.php";
                    var res = await http.post(Uri.parse(uri), body: map);
                    //print(res.body);
                    final String data = res
                        .body; //content response of res.body must be converted from object to json string by using jsonEncode
                    // ignore: avoid_print
                    data_ = data;
                    setState(() {});
                    if (data_ == "MALE") {
                      speakMaleVoice('-----Cube!');
                    } else if (data_ == "FEMALE") {
                      speakFemaleVoice('-----Cube!');
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
        child: Hero(
          tag: '10ImageTag', // Unique tag for the blue image
                  child: Image.asset('assets/images/10.png'),),
                  onTap: () async {Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ZoomedInScreen(imagePath: 'assets/images/10.png', tag: '10ImageTag'),
            ),
          );
                    var map = Map<String, dynamic>();
                    map['Email'] = guardianEmail;
                    var uri =
                        "https://www.speech-assistive-app.com/getdata.php";
                    var res = await http.post(Uri.parse(uri), body: map);
                    //print(res.body);
                    final String data = res
                        .body; //content response of res.body must be converted from object to json string by using jsonEncode
                    // ignore: avoid_print
                    data_ = data;
                    setState(() {});
                    if (data_ == "MALE") {
                      speakMaleVoice('-----Club!');
                    } else if (data_ == "FEMALE") {
                      speakFemaleVoice('-----Club!');
                    }
                  },
                )),
            SizedBox(
                width: 100,
                height: 120,
                child: GestureDetector(
        child: Hero(
          tag: '11ImageTag', // Unique tag for the blue image
                  child: Image.asset('assets/images/11.png'),),
                  onTap: () async {Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ZoomedInScreen(imagePath: 'assets/images/11.png', tag: '11ImageTag'),
            ),
          );
                    var map = Map<String, dynamic>();
                    map['Email'] = guardianEmail;
                    var uri =
                        "https://www.speech-assistive-app.com/getdata.php";
                    var res = await http.post(Uri.parse(uri), body: map);
                    //print(res.body);
                    final String data = res
                        .body; //content response of res.body must be converted from object to json string by using jsonEncode
                    // ignore: avoid_print
                    data_ = data;
                    setState(() {});
                    if (data_ == "MALE") {
                      speakMaleVoice('-----Crescent!');
                    } else if (data_ == "FEMALE") {
                      speakFemaleVoice('-----Crescent!');
                    }
                  },
                )),
            SizedBox(
                width: 100,
                height: 120,
                child: GestureDetector(
        child: Hero(
          tag: '12ImageTag', // Unique tag for the blue image
                  child: Image.asset('assets/images/12.png'),),
                  onTap: () async {Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ZoomedInScreen(imagePath: 'assets/images/12.png', tag: '12ImageTag'),
            ),
          );
                    var map = Map<String, dynamic>();
                    map['Email'] = guardianEmail;
                    var uri =
                        "https://www.speech-assistive-app.com/getdata.php";
                    var res = await http.post(Uri.parse(uri), body: map);
                    //print(res.body);
                    final String data = res
                        .body; //content response of res.body must be converted from object to json string by using jsonEncode
                    // ignore: avoid_print
                    data_ = data;
                    setState(() {});
                    if (data_ == "MALE") {
                      speakMaleVoice('-----Triangle!');
                    } else if (data_ == "FEMALE") {
                      speakFemaleVoice('-----Triangle!');
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
    //speakFemaleVoice('----- Hi, There! Let us learn! the different shapes. Tap each shape below!');
    speakFemaleVoice('------');
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
