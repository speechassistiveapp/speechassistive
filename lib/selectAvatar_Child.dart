// ignore_for_file: file_names, no_leading_underscores_for_local_identifiers, unused_local_variable, avoid_print, duplicate_ignore, non_constant_identifier_names, prefer_collection_literals, camel_case_types, use_build_context_synchronously, unused_import

import 'dart:async';
import 'dart:ffi';
//import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
//import 'package:path_provider/path_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:speechassistive/login.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

List<String> imageList = [
  'assets/images/Avatar1_b1.png',
  'assets/images/Avatar4_g2.png'
];

String Gender = "";
String Voice = "";
String avatar_name_F = "";
String avatar_name_M = "";
String fname = "";
String lname = "";
String mi = "";
String n_name = "";
String age = "";
String gender = "";

// ignore: unnecessary_late

class SelectAvatar_Child extends StatefulWidget {
  // ignore: non_constant_identifier_names

  // ignore: non_constant_identifier_names
  final String Firstname;
  final String Lastname;
  final String MI;
  final String NickName;
  final String Age;
  final String Gender;
  //final String? guardian_Email;

  const SelectAvatar_Child({
    Key? key,
    // ignore: non_constant_identifier_names

    required this.Firstname,
    required this.Lastname,
    required this.MI,
    required this.NickName,
    required this.Age,
    required this.Gender,
    //required this.guardian_Email
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SelectAvatar_Child createState() => _SelectAvatar_Child();
}

class _SelectAvatar_Child extends State<SelectAvatar_Child> {
  // ignore: unused_field

  // ignore: non_constant_identifier_names

  String? guardEmail;

  @override
  void initState() {
    super.initState();
    getGuardEmail();

    //displaygender();
  }

  Future<void> register_child_male() async {
// ignore: prefer_collection_literals
    fname = widget.Firstname;
    lname = widget.Lastname;
    mi = widget.MI;
    n_name = widget.NickName;
    age = widget.Age;
    gender = widget.Gender;

    var map = Map<String, dynamic>();
    map['Firstname'] = widget.Firstname;
    map['Lastname'] = widget.Lastname;
    map['MI'] = widget.MI;
    map['NickName'] = widget.NickName;
    map['Age'] = widget.Age;
    map['Gender'] = widget.Gender;
    map['Voice'] = "en-AU";
    map['Avatar'] = avatar_name_M;
    map['guardian_Email'] = guardEmail;
    map['child_id'] = 0.toString();

    var uri = "https://www.speech-assistive-app.com/register_child_male.php";
    var res = await http.post(Uri.parse(uri), body: map);
    //var uri =
    //"https://www.speech-assistive-app.com/updaterec_Guardian_Male.php";
    // var res = await http.post(Uri.parse(uri), body: map);
    // ignore: avoid_print
    print(res.body);
    final String data = jsonEncode(res
        .body); //content response of res.body must be converted from object to json string by using jsonEncode
    // ignore: avoid_print
    print(data);
    if (data == '"User already exist!"') {
      Fluttertoast.showToast(
        msg: "Child profile already exist!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        fontSize: 16.0,
      );
    } else if (data == '"New User account has been successfully created!"') {
      Fluttertoast.showToast(
        msg: "New Child account has been successfully created!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        fontSize: 16.0,
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
      // ignore: use_build_context_synchronously
    }
  }

  Future<void> register_child_female() async {
    fname = widget.Firstname;
    lname = widget.Lastname;
    mi = widget.MI;
    n_name = widget.NickName;
    age = widget.Age;
    gender = widget.Gender;

    var map = Map<String, dynamic>();
    map['Firstname'] = widget.Firstname;
    map['Lastname'] = widget.Lastname;
    map['MI'] = widget.MI;
    map['NickName'] = widget.NickName;
    map['Age'] = widget.Age;
    map['Gender'] = widget.Gender;
    map['Voice'] = "en-US";
    map['Avatar'] = avatar_name_F;
    map['guardian_Email'] = guardEmail;
    map['child_id'] = 0.toString();

    var uri = "https://www.speech-assistive-app.com/register_child_female.php";
    var res = await http.post(Uri.parse(uri), body: map);
    //var uri =
    //"https://www.speech-assistive-app.com/updaterec_Guardian_Male.php";
    // var res = await http.post(Uri.parse(uri), body: map);
    // ignore: avoid_print
    print(res.body);
    final String data = jsonEncode(res
        .body); //content response of res.body must be converted from object to json string by using jsonEncode
    // ignore: avoid_print
    print(data);
    if (data == '"User already exist!"') {
      Fluttertoast.showToast(
        msg: "Child profile already exist!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        fontSize: 16.0,
      );
    } else if (data == '"New User account has been successfully created!"') {
      Fluttertoast.showToast(
        msg: "New Child account has been successfully created!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        fontSize: 16.0,
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String avatar = "empty";

    return Scaffold(
        appBar: AppBar(title: const Text("Choose Avatar"), centerTitle: true),
        body: Column(children: [
          const SizedBox(
              height: 20), //spacer between the Appbar and the buttons
          _headertext(context),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 200,
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      child: Image.asset(
                        'assets/images/Avatar2_g1.png',
                        width: 180,
                      ),
                      onTap: () {
                        avatar = "FEMALE";
                        avatar_name_F = "Avatar2_g1.png";
                        Fluttertoast.showToast(
                          msg: "You selected an avatar",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER,
                          fontSize: 16.0,
                        );
                        print(avatar);
                        print(avatar_name_F);
                      },
                    ),
                    //const Text('MALE VOICE',
                    //style: TextStyle(fontSize: 15, color: Colors.red))
                  ],
                ),
              ),
              SizedBox(
                width: 200,
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      child: Image.asset(
                        'assets/images/Avatar4_g2.png',
                        height: 180,
                      ),
                      onTap: () {
                        avatar = "FEMALE";
                        avatar_name_F = "Avatar4_g2.png";
                        Fluttertoast.showToast(
                          msg: "You selected an avatar",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER,
                          fontSize: 16.0,
                        );
                        print(avatar);
                        print(avatar_name_F);
                      },
                    ),
                    //const Text('FEMALE VOICE',
                    // style: TextStyle(fontSize: 15, color: Colors.green)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 200,
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      child: Image.asset(
                        'assets/images/Avatar1_b1.png',
                        width: 180,
                      ),
                      onTap: () {
                        avatar = "MALE";
                        avatar_name_M = "Avatar1_b1.png";
                        Fluttertoast.showToast(
                          msg: "You selected an avatar",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER,
                          fontSize: 16.0,
                        );
                        print(avatar);
                        print(avatar_name_M);
                      },
                    ),
                    //const Text('MALE VOICE',
                    //style: TextStyle(fontSize: 15, color: Colors.red))
                  ],
                ),
              ),
              SizedBox(
                width: 200,
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      child: Image.asset(
                        'assets/images/Avatar3_b2.png',
                        height: 180,
                      ),
                      onTap: () {
                        avatar = "MALE";
                        avatar_name_M = "Avatar3_b2.png";
                        Fluttertoast.showToast(
                          msg: "You selected an avatar",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER,
                          fontSize: 16.0,
                        );
                        print(avatar);
                        print(avatar_name_M);
                      },
                    ),
                    //const Text('FEMALE VOICE',
                    // style: TextStyle(fontSize: 15, color: Colors.green)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),

          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            SizedBox(
              width: 155,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  if (avatar == "empty") {
                    Fluttertoast.showToast(
                      msg: "You did not choose an Avatar",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.CENTER,
                      fontSize: 16.0,
                    );
                    print(avatar);
                  } else if (avatar == "MALE") {
                    print(avatar);
                    register_child_male();
                  } else if (avatar == "FEMALE") {
                    print(avatar);
                    register_child_female();
                  }
                },
                style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.cyan),
                child: const Text(
                  "Save Profile",
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
                        builder: (context) => const LoginScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.cyan),
                child: const Text(
                  "Cancel",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            )
          ]),

          //Text(
          //widget.Firstname,
          //style: const TextStyle(color: Colors.white),
          //),
          //Text(
          //widget.Lastname,
          //style: const TextStyle(color: Colors.white),
          ///),
          //Text(
          ///widget.MI,
          //style: const TextStyle(color: Colors.white),
          //),
          //Text(
          //  widget.NickName,
          // style: const TextStyle(color: Colors.white),
          // ),
          // Text(
          //widget.Age,
          // style: const TextStyle(color: Colors.white),
          //),
          //Text(
          //  widget.Gender,
          //  style: const TextStyle(color: Colors.white),
          // ),
          // Text(
          //   widget.Gender,
          //  style: const TextStyle(color: Colors.white),
          //),
        ]));
  }

  void getGuardEmail() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    guardEmail = pref.getString('guard_Email');
    //comments ko to: the key will be passed here (guardian_Email)
    setState(() {});
  }

  _headertext(context) {
    //ito yung interpolation yung may dollar sign
    return Column(
      children: [
        Text(
          "Hi ${widget.Firstname[0].toUpperCase() + widget.Firstname.substring(1)}, choose your avatar",
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        )
      ],
    );
  }
}
