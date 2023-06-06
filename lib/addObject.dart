import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddObject extends StatefulWidget {
  const AddObject({Key? key}) : super(key: key);

  @override
  _AddObjectState createState() => _AddObjectState();
}


  String? guardianEmail;

class _AddObjectState extends State<AddObject> {
  TextEditingController textObject = TextEditingController();
  File? _image;
  
  

  @override
  void initState() {
    super.initState();
    getGuardianEmail();
  }
  

  Future getImage_camera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;

    final imageTemporary = File(image.path);

    setState(() {
      this._image = imageTemporary;
    });
  }

  Future getImage_gallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final imageTemporary = File(image.path);

    setState(() {
      this._image = imageTemporary;
    });
  }

  Future<void> saveObject() async {
    if (_image == null) {
      // No image selected
      Fluttertoast.showToast(
          msg: "No image selected!",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          fontSize: 16.0,
        );
      return;
      return;
    }

    if (textObject.text.isEmpty) {
      // TextField is empty
      Fluttertoast.showToast(
          msg: "TextField is empty!",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          fontSize: 16.0,
        );
      return;
    }

    // Get the directory for storing files
    final appDir = await getApplicationDocumentsDirectory();

    // Get the current date
    final currentDate = DateTime.now();

    // Format the date as 'MMddyyyy' (e.g., June 6, 2023 -> 06062023)
    final formattedDate = DateFormat('MMddyyyy').format(currentDate);

    // Create the file name by concatenating the TextField value and formatted date
    final fileName = '${textObject.text}-$formattedDate.jpg';

    // Copy the image file to the specified directory with the created file name
    final savedImage = await _image!.copy('${appDir.path}/$fileName');
    Fluttertoast.showToast(
          msg: "Object Saved!",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          fontSize: 16.0,
        );
    // Use the savedImage file for further processing or displaying
    print('Image saved to: ${savedImage.path}');
  }

  void showObjects(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ShowObjectsScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add OBJECTS"), centerTitle: true),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            GestureDetector(
              child: _image != null
                  ? Image.file(
                      _image!,
                      width: 250,
                      height: 250,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      'assets/images/backbag.png',
                      width: 250,
                      height: 250,
                    ),
              onTap: () async {
                print(textObject.text);
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 380,
                  child: ElevatedButton(
                    onPressed: () async {
                      getImage_camera();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyan,
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text(
                      "Add Object from Camera",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 380,
                  child: ElevatedButton(
                    onPressed: () async {
                      getImage_gallery();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyan,
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text(
                      "Add Object from Gallery",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 380,
                  child: TextField(
                    controller: textObject,
                    decoration: InputDecoration(
                      hintText: "Object",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: Colors.grey.withOpacity(0.3),
                      filled: true,
                      prefixIcon: const Icon(Icons.emoji_objects_rounded),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 380,
                  child: ElevatedButton(
                    onPressed: () async {
                      await saveObject();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text(
                      "Save Object",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 380,
                  child: ElevatedButton(
                    onPressed: () {
                      showObjects(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text(
                      "Show Objects",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
  

  void getGuardianEmail() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    guardianEmail = pref.getString('guardian_Email');
    //comments ko to: the key will be passed here (guardian_Email)
    setState(() {});
  }
}


class ShowObjectsScreen extends StatelessWidget {

  final player = AudioPlayer(); //audio player obj that will play audio

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
  
  
  String data_ = "";

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<File>>(
      future: getSavedImages(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final savedImages = snapshot.data!;

          return Scaffold(
            appBar: AppBar(
              title: Text("Saved Objects"),
            ),
            body: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: savedImages.length,
              itemBuilder: (context, index) {
                final file = savedImages[index];
                final fileName = basename(file.path);

                // Get the text before the last hyphen
                final displayText =
                    fileName.substring(0, fileName.lastIndexOf('-'));

                return Column(
                  children: [
                    SizedBox(height: 10),
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ZoomedInScreen(imagePath: file.path, tag: displayText),
                            ),
                          );
                          var map = Map<String, dynamic>();
                          map['Email'] = guardianEmail;
                          print('Guardian Email: $guardianEmail');
                          var uri =
                              "https://www.speech-assistive-app.com/getdata.php";
                          var res = await http.post(Uri.parse(uri), body: map);
                          //print(res.body);
                          final String data = res
                              .body; //content response of res.body must be converted from object to json string by using jsonEncode
                          // ignore: avoid_print
                          data_ = data;
                          //setState(() {});
                          if (data_ == "MALE") {
                            speakMaleVoice('-----$displayText!');
                          } else if (data_ == "FEMA") {
                            speakFemaleVoice('-----$displayText!');
                          }
                        },
                        child: AspectRatio(
                          aspectRatio: 1.0,
                          
        child: Hero(
          tag: displayText, // Unique tag for the blue image
                  child: Image.file(
                            file,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        displayText,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  Future<List<File>> getSavedImages() async {
    final appDir =
        Directory((await getApplicationDocumentsDirectory()).path);
    final files = appDir.listSync();
    return files
        .where((file) => file is File && file.path.endsWith('.jpg'))
        .map((file) => file as File)
        .toList();
  }
}



class ZoomedInScreen extends StatelessWidget {
  final String imagePath;
  final String tag;

  const ZoomedInScreen({required this.imagePath, required this.tag});

  @override
  Widget build(BuildContext context) {
    print('Image path: $imagePath'); // Add this line to print the file path

    return Scaffold(
      body: Stack(
        children: [
          // Semi-transparent black background
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context); // Pop the zoomed-in screen when tapped
            },
            child: Center(
              child: Hero(
                tag: tag, // Use the tag passed from the previous screen
                child: Image.file(
                  File(imagePath), // Use Image.file instead of Image.asset
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