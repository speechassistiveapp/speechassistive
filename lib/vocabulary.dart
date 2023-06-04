// ignore_for_file: non_constant_identifier_names, duplicate_ignore, avoid_print, prefer_collection_literals, unused_element, unused_import

//import "dart:convert";

import "package:flutter/material.dart";
import "package:speechassistive/addObject.dart";
import "package:speechassistive/colors1.dart";
//import "package:speechassistive/forgotpassword.dart";
import "package:speechassistive/fw_gallery.dart";
//import "package:speechassistive/main.dart";
import "package:speechassistive/mainmenu.dart";
import "package:speechassistive/persons1.dart";
import "package:speechassistive/schoolitem1.dart";
import "package:speechassistive/sub_addobject.dart";
import "package:speechassistive/sub_home.dart";
import "package:speechassistive/sub_objects.dart";
//import "package:speechassistive/sub_school.dart";
//import "package:speechassistive/sub_shapes.dart";
//import 'package:http/http.dart' as http;
import "package:speechassistive/sub_shapes.dart";
import 'package:shared_preferences/shared_preferences.dart';

class Vocabulary extends StatefulWidget {
  const Vocabulary({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _VocabularyState createState() => _VocabularyState();
}

class _VocabularyState extends State<Vocabulary> {
  String? guardianEmail;

  @override
  void initState() {
    super.initState();
    getGuardianEmail();
  }

  // ignore: non_constant_identifier_names
  Future getGender() async {
// ignore: prefer_collection_literals

    ///var map = Map<String, dynamic>();
    //map['Email'] = guardianEmail;
    //var uri = "https://www.speech-assistive-app.com/getdata.php";
    //  var res = await http.post(Uri.parse(uri), body: map);

    // print(res.body);
    // final String data = jsonEncode(res
    //    .body); //content response of res.body must be converted from object to json string by using jsonEncode
    // ignore: avoid_print

    // print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Choose Your Vocabulary"), centerTitle: true),
      body: Column(children: [
        const SizedBox(height: 30), //spacer between the Appbar and the buttons
        guardianEmail == null
            ? const Text('No Email passed')
            : Text(guardianEmail!, style: const TextStyle(color: Colors.white)),
        _logo(context),

        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 150,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Colors1()),
                  );
                },
                icon: const Icon(Icons.color_lens),
                label: const Text("Colors"),
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.blue,
                ),
              ),
            ),
            SizedBox(
              width: 150,
              child: ElevatedButton.icon(
                onPressed: () {
                  getGender();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const sub_Shapes()),
                  );
                },
                icon: const Icon(Icons.diamond),
                label: const Text("Shapes"),
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.blue,
                ),
              ),
            )
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
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AddObject()),
                  );
                },
                icon: const Icon(Icons.add_box),
                label: const Text("Add Objects"),
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.orange,
                ),
              ),
            ),
            SizedBox(
              width: 150,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Persons1()),
                  );
                },
                icon: const Icon(Icons.person),
                label: const Text("Person"),
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.orange,
                ),
              ),
            )
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
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SchoolItem1()),
                  );
                },
                icon: const Icon(Icons.school),
                label: const Text("School"),
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.brown,
                ),
              ),
            ),
            SizedBox(
              width: 150,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const sub_Home()),
                  );
                },
                icon: const Icon(Icons.home),
                label: const Text("Home"),
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.brown,
                ),
              ),
            )
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
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MainMenu()),
                  );
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text("Back to \n Main Menu"),
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.red,
                ),
              ),
            ),
            SizedBox(
              width: 150,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Gallery()),
                  );
                },
                icon: const Icon(Icons.chat),
                label: const Text("Functional \n Words"),
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.red,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(
          height: 20,
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

  Future<void> setGuardianEmail(guardianEmail) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('guardian_Email',
        guardianEmail); //comments ko to: guardian_Email is the key here that will be passed to the get method that is called to another screen
  }
}

_logo(context) {
  return Column(
    children: [
      SizedBox(
        height: 150,
        width: 280,
        child: Image.asset('assets/images/speechassistiveapp_updatedlogo.png'),
      )
    ],
  );
}
