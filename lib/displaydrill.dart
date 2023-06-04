// ignore_for_file: no_logic_in_create_state, camel_case_types, unused_import, unused_element, non_constant_identifier_names, prefer_collection_literals, avoid_print, duplicate_ignore, unused_local_variable
import 'package:flutter/material.dart';
import 'package:speechassistive/choose_avatar.dart';
import 'package:speechassistive/practicedrill.dart';
import 'package:speechassistive/tts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:speechassistive/vocabulary.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DisplayDrills extends StatefulWidget {
  //final String Email;
  const DisplayDrills({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DisplayDrills createState() => _DisplayDrills();
}

class _DisplayDrills extends State<DisplayDrills> {
  String? Gender;
  String? guardianEmail;

  @override
  void initState() {
    //init state is the form load version of flutter

    super.initState();
    getGuardianEmail();
    //getSpeechDrills();
  }

  Future<void> getSpeechDrills() async {
// ignore: prefer_collection_literals

    var map = Map<String, dynamic>();
    map['Email'] = guardianEmail;
    var uri = "https://www.speech-assistive-app.com/getSpeechDrills.php";
    var res = await http.post(Uri.parse(uri), body: map);

    //print(res.body);
    final String data = jsonEncode(res.body);
    print(data
        .toString()); //content response of res.body must be converted from object to json string by using jsonEncode
    // ignore: avoid_print
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("List of Speech Drills"), centerTitle: true),
        body: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Container(
                height: 100,
                color: Colors.cyan,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                margin: const EdgeInsets.all(10),
                child: const Text(
                  'User Id: data',
                  style: TextStyle(fontSize: 18),
                ),
              );
            }));
  }

  void getGuardianEmail() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    guardianEmail = pref.getString('guardian_Email');
    //comments ko to: the key will be passed here (guardian_Email)
    getSpeechDrills();
    setState(() {});
  }

  void getGuardianGender() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    Gender = pref.getString('guardian_Gender');
    //comments ko to: the key will be passed here (guardian_Email)
    setState(() {});
  }
}
