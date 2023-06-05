// ignore_for_file: unused_import, no_logic_in_create_state, library_private_types_in_public_api, camel_case_types, unused_local_variable, use_key_in_widget_constructors, unused_element, avoid_print, non_constant_identifier_names, duplicate_ignore, prefer_const_constructors, unused_field, prefer_final_fields, must_be_immutable, prefer_interpolation_to_compose_strings, override_on_non_overriding_member, prefer_collection_literals, avoid_web_libraries_in_flutter, prefer_adjacent_string_concatenation, no_leading_underscores_for_local_identifiers, unnecessary_brace_in_string_interps, unnecessary_cast
import 'dart:convert';
import 'dart:io';
//import 'dart:js/js_wasm.dart';
import 'dart:math';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:speechassistive/newdrill.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:speechassistive/practicedrill.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';



String ques = "";
String imgpath = "";
String img_asset = "";
String gendValue = "";
String g_avatar = "";
  String ch_avatar= "";

class TexttoSpeech extends StatefulWidget {
  const TexttoSpeech({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TexttoSpeech createState() => _TexttoSpeech();
}

class _TexttoSpeech extends State<TexttoSpeech> {
  late ConfettiController _confetticontroller;
  
  String data_ = "";
  String _question = "";
  String _answer = "";

  String? gend;
  String? guardian_gender;
  String? guard_avatar;
  String? question;
  String? answer;
  String? guard_Nname;
  String? child_Nname;
  String? child_gender;
  String? child_avatar;
  String? guardianEmail;
  

  @override
  void initState() {
    super.initState();
    _confetticontroller =
        ConfettiController(duration: const Duration(milliseconds: 800));
    getQuestion();
    getAnswer();
    getAvatar();
    getGuardianEmail();
    getGuardianNname();
    getgenderGuardian();
    getChild_Nname();
    getChild_Gender();
    getChild_Avatar();

    _confetticontroller.play();
  }

  final FlutterTts flutterTts = FlutterTts();
  final TextEditingController textEditingController = TextEditingController();
  // ignore: non_constant_identifier_names

  final TextEditingController textEditingController_stud =
      TextEditingController();
  
  final player = AudioPlayer(); //audio player obj that will play audio

  @override
  void dispose() {
    textEditingController.dispose();
    textEditingController_stud.dispose();
    player.dispose();
    super.dispose();
  }

    Future speakMaleVoice(String text) async { 
      
    print("Male Voice will say: $text");
    String? EL_API_KEY = dotenv.env['EL_API_KEY'] as String?;
    
    print('EL_API_KEY Retrieved');
    print(EL_API_KEY);
    if (EL_API_KEY == null) {
      throw Exception('Failed to retrieve the API key from environment variables.');
    }

    print("The Gend Value is: $gendValue");
    
    String transformedText = text.split(" ").join("   ,");
    print("Male Voice will say Transformed: $transformedText");

    if (gendValue.compareTo('MALE') == 0)
    {
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
    }else if (gendValue.compareTo('FEMALE') == 0)
    {
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
    }else {
    // Handle the case when gendValue is null or has an unexpected value
    return;
}
    

    
  } //getResponse from Eleven Labs


  Future speak_stud_male(String text_answer) async { 
      
    //print("Male Voice will say: $text_answer");
    String? EL_API_KEY = dotenv.env['EL_API_KEY'] as String?;
    
    print('EL_API_KEY Retrieved');
    print(EL_API_KEY);
    if (EL_API_KEY == null) {
      throw Exception('Failed to retrieve the API key from environment variables.');
    }

    //print("The Gend Value is: $gendValue");
    
    String transformedText = text_answer.split(" ").join("   ,");
    //print("Male Voice will say Transformed: $transformedText");

    if (gendValue.compareTo('MALE') == 0)
    {
      String url = 'https://api.elevenlabs.io/v1/text-to-speech/SP0cpO1imnBqbiBkJdTZ';
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
    }else if (gendValue.compareTo('FEMALE') == 0)
    {
      String url = 'https://api.elevenlabs.io/v1/text-to-speech/EkZU0N80jsVFKZZtmBNQ';
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
    }else {
    // Handle the case when gendValue is null or has an unexpected value
    return;
}
  }

  Future<void> save_drill() async {
// ignore: prefer_collection_literals

    var map = Map<String, dynamic>();

    // Check if guardianEmail is null, assign a default value if needed
    if (guardianEmail == null) {
      // Provide a default value or handle the null case accordingly
      guardianEmail = "";
    }

    map['Email'] = guardianEmail;
    map['Question'] = question;
    map['Answer'] = answer;

    var uri = "https://www.speech-assistive-app.com/save_drill.php";
    var res = await http.post(Uri.parse(uri), body: map);

    print(res.body);
    final String data = jsonEncode(res
        .body); //content response of res.body must be converted from object to json string by using jsonEncode
    // ignore: avoid_print
    print(data);

    if (data == '"Drill Title already exist!"') {
      Fluttertoast.showToast(
        msg: "Drill Title already exist!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        fontSize: 16.0,
      );
    } else if (data == '"New Drill has been created!"') {
      Fluttertoast.showToast(
        msg: "New Drill has been created!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        fontSize: 16.0,
      );
      //_confetticontroller.play();
    }
  }

  _button(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          width: 150,
          child: ElevatedButton.icon(
            onPressed: () {
              save_drill();
              getQuestion();
              getAnswer();
              getGuardianEmail();
              getGuardianNname();
              getgenderGuardian();
              getAvatar();
              getChild_Nname();
              getChild_Gender();
              getChild_Avatar();
              //_confetticontroller.play();
              //Navigator.push(
              // context,
              //MaterialPageRoute(builder: (context) => const PracticeDrill()),
              //);
            },
            icon: const Icon(Icons.save),
            label: const Text("Save Drill"),
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: Colors.blue,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        SizedBox(
          width: 150,
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NewDrill()),
              );
            },
            icon: const Icon(Icons.arrow_back),
            label: const Text("Back"),
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: Colors.green,
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    getQuestion();
    getAnswer();
    getAvatar();
    getChild_Avatar();

    //print(img_asset);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: const Text("Speech Practice Drill"), centerTitle: true),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(24),
          child: Column(
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: ConfettiWidget(
                      confettiController: _confetticontroller,
                      blastDirection: pi,
                      emissionFrequency: 0.2,
                      numberOfParticles: 20,
                    ),
                  )
                ],
              ),
              //guardianEmail == null
              //? const Text('No guardian name passed')
              //: Text(guardianEmail!,
              //style: const TextStyle(color: Colors.white)),
              //gend == null
              //? const Text('No guardian gender passed')
              //: Text(gend!, style: const TextStyle(color: Colors.white)),
              
              guard_avatar == null
                  ? const Text('No guardian gender passed')
                  : Text(guard_avatar!,
                      style: const TextStyle(color: Colors.white)),
              const SizedBox(height: 5),
              //_logo(context),
              const SizedBox(height: 5),
              _header(context),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        GestureDetector(
                          child: child_avatar != null && child_avatar!.isNotEmpty
                ? Image.asset(
                            'assets/images/$guard_avatar',
                            width: 100,
                          )
                : Container(),
                          onTap: () async {
                            speakMaleVoice(textEditingController.text);
                            
                            if (gend == "MALE") {
                              //speakMaleVoice(textEditingController.text);
                            } else if (gend == "FEMALE") {
                              //speakFemaleVoice(textEditingController.text);
                            }
                            //print("gend value: $gend");
                            String tell = textEditingController.text;
                            //print("value: $tell");
                            //print("Response tapped!");
                          },
                        ),

                        
                        Text('$guard_Nname',
                            style: TextStyle(fontSize: 13, color: Colors.grey)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 300,
                    height: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextField(
                            readOnly: true,
                            controller: textEditingController,
                            decoration: InputDecoration(
                              hintText: "Type Phrase/Question",
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none),
                              fillColor: Colors.grey.withOpacity(0.3),
                              filled: true,
                            ),
                            obscureText: false),
                      ],
                    ),
                  ),
                ],
              ), /////

              const SizedBox(height: 110),
              
              ///child part
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        GestureDetector(
                          child: child_avatar != null && child_avatar!.isNotEmpty
                ? Image.asset(
                            'assets/images/$child_avatar',
                            width: 100,
                          ): Container(), // Display an empty container if child_avatar is null or empty
                          onTap: () async {
                              speak_stud_male(textEditingController_stud.text);
                            if (child_gender == "MALE") {
                              //speak_stud_male(textEditingController_stud.text);
                            } else if (child_gender == "FEMALE") {
                              //speak_stud_female(textEditingController_stud.text);
                            }
                            //print("gender value: $child_gender");
                            //print("Response tapped!");
                          },
                        ),
                        Text('$child_Nname',
                            style: TextStyle(fontSize: 13, color: Colors.grey)),

                        //_button(context),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        TextField(
                            readOnly: true,
                            controller: textEditingController_stud,
                            decoration: InputDecoration(
                              hintText: "Type Answer",
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide.none),
                              fillColor: Colors.grey.withOpacity(0.3),
                              filled: true,
                            ),
                            obscureText: false),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              _button(context),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    ));
  }

  void getQuestion() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    question = pref.getString('_question');
    textEditingController.text = question!;

    //comments ko to: the key will be passed here (guardian_Email)
    setState(() {});
  }

  void getAnswer() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    answer = pref.getString('_answer');
    textEditingController_stud.text = answer!;

    //comments ko to: the key will be passed here (guardian_Email)
    setState(() {});
  }

  void getgenderGuardian() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    gend = pref.getString('_guardgend');
    gendValue = pref.getString('_guardgend')?? "UNKNOWN";
    //print("Gender: $gend");

    //comments ko to: the key will be passed here (guardian_Email)
    setState(() {});
  }

  void getAvatar() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    guard_avatar = pref.getString('_avatar');
    g_avatar = pref.getString('_avatar') ?? "UNKNOWN";
    g_avatar = g_avatar.replaceAll('"', '');
    guard_avatar = guard_avatar?.replaceAll('"', '')?? '';
    //print('Guard Avatar: $guard_avatar');
    //print('Guard Avatar: $g_avatar');
    guard_avatar!;
    if (guard_avatar?.isEmpty ?? true) {
        guard_avatar = "Daddy1.png";
      
      //print('No choice: $guard_avatar');
    }else {
    guard_avatar = guard_avatar?.replaceAll('"', '')?? '';
   }
    //comments ko to: the key will be passed here (guardian_Email)
    setState(() {});
  }

  void getGuardianNname() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    guard_Nname = pref.getString('_guardNname');
    //print("GuardName: $guard_Nname");

    //comments ko to: the key will be passed here (guardian_Email)
    setState(() {});
  }

  void getGuardianEmail() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    guardianEmail = pref.getString('guardian_Email');
    //print("GuardEmail: $guardianEmail");

    setState(() {});
  }

  void getChild_Nname() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    child_Nname = pref.getString('_childNname');

    setState(() {});
  }

  void getChild_Gender() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    child_gender = pref.getString('_childgender');

    setState(() {});
  }

  void getChild_Avatar() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    child_avatar = pref.getString('_childavatar');
    ch_avatar = pref.getString('_childavatar') ?? "UNKNOWN";
    ch_avatar = ch_avatar.replaceAll('"', '');
    //print('Child Avatar: $child_avatar');
    //print('Child Avatar: $ch_avatar');

    setState(() {});
  }

  _header(context) {
    return Column(
      children: const [
        Text(
          "Tap the avatars one at a time to hear the conversation.",
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black),
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
