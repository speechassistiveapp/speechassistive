// ignore_for_file: file_names, no_leading_underscores_for_local_identifiers, unused_local_variable, avoid_print, duplicate_ignore, non_constant_identifier_names, prefer_collection_literals, use_build_context_synchronously, sort_child_properties_last, unused_element

import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:speechassistive/funcwrd_cooking.dart';
import 'package:speechassistive/login.dart';
import 'dart:convert';
import 'package:speechassistive/register_child.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<String> imageList = [
  'assets/images/Mommy1.png',
  'assets/images/Mommy2.png',
  'assets/images/Mommy3.png',
  'assets/images/Mommy4.png',
  'assets/images/Daddy1.png',
  'assets/images/Daddy2.png',
  'assets/images/Daddy3.png',
  'assets/images/Daddy4.png'
];

String Gender = "empty";
String Voice = "";
String avatar_name_F = "";
String avatar_name_M = "";
String fname = "";
String lname = "";
String n_name = "";
String phone = "";
String email = "";
String pword = "";
String confpword = "";
// ignore: unnecessary_late

class SelectAvatar extends StatefulWidget {
  // ignore: non_constant_identifier_names

  // ignore: non_constant_identifier_names
  final String Firstname;
  final String Lastname;
  final String NickName;
  final String Phone;
  final String Email;
  final String Pword;
  final String ConfirmPword;

  const SelectAvatar({
    Key? key,
    // ignore: non_constant_identifier_names

    required this.Firstname,
    required this.Lastname,
    required this.NickName,
    required this.Phone,
    required this.Email,
    required this.Pword,
    required this.ConfirmPword,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SelectAvatar createState() => _SelectAvatar();
}

class _SelectAvatar extends State<SelectAvatar> {
  // ignore: unused_field
  String? Gender;
  String? guardEmail;

  @override
  void initState() {
    super.initState();
    getGuardEmail();

    //displaygender();
  }

  // ignore: non_constant_identifier_names
  Future<void> register_guardian_male() async {
// ignore: prefer_collection_literals
    fname = widget.Firstname;
    lname = widget.Lastname;
    n_name = widget.NickName;
    phone = widget.Phone;
    email = widget.Email;
    pword = widget.Pword;
    confpword = widget.ConfirmPword;

    var map = Map<String, dynamic>();
    map['Firstname'] = widget.Firstname;
    map['Lastname'] = widget.Lastname;
    map['NickName'] = widget.NickName;
    map['Phone'] = widget.Phone;
    map['Email'] = widget.Email;
    map['Pword'] = widget.Pword;
    map['ConfirmPword'] = widget.ConfirmPword;
    map['VoiceRec'] = "en-AU";
    map['Avatar'] = avatar_name_M;
    map['Gender'] = "MALE";
    map['guardian_id'] = 0.toString();
    var uri = "https://www.speech-assistive-app.com/register_guard_male.php";
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
        msg: "Guardian profile already exist!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        fontSize: 16.0,
      );
    } else if (data == '"New User account has been successfully created!"') {
      Fluttertoast.showToast(
        msg: "New Guardian account has been successfully created!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        fontSize: 16.0,
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Register_Child()),
      );
    }
  }

  Future<void> register_guardian_female() async {
    fname = widget.Firstname;
    lname = widget.Lastname;
    n_name = widget.NickName;
    phone = widget.Phone;
    email = widget.Email;
    pword = widget.Pword;
    confpword = widget.ConfirmPword;

    var map = Map<String, dynamic>();
    map['Firstname'] = widget.Firstname;
    map['Lastname'] = widget.Lastname;
    map['NickName'] = widget.NickName;
    map['Phone'] = widget.Phone;
    map['Email'] = widget.Email;
    map['Pword'] = widget.Pword;
    map['ConfirmPword'] = widget.ConfirmPword;
    map['VoiceRec'] = "en-US";
    map['Avatar'] = avatar_name_F;
    map['Gender'] = "FEMALE";
    map['guardian_id'] = 0.toString();
    var uri = "https://www.speech-assistive-app.com/register_guard_female.php";
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
        msg: "Guardian profile already exist!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        fontSize: 16.0,
      );
    } else if (data == '"New User account has been successfully created!"') {
      Fluttertoast.showToast(
        msg: "New Guardian account has been successfully created!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        fontSize: 16.0,
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Register_Child()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController gender = TextEditingController();
    gender.text = Gender.toString();
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
                width: 100,
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      child: Image.asset(
                        'assets/images/Mommy1.png',
                        width: 180,
                      ),
                      onTap: () {
                        avatar = "FEMALE";
                        avatar_name_F = "Mommy1.png";
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
                    //const Text('Mommy 1',
                    // style: TextStyle(fontSize: 15, color: Colors.pink))
                  ],
                ),
              ),
              SizedBox(
                width: 100,
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      child: Image.asset(
                        'assets/images/Mommy2.png',
                        width: 180,
                      ),
                      onTap: () {
                        avatar = "FEMALE";
                        avatar_name_F = "Mommy2.png";
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
                    //const Text('Mommy 2',
                    //style: TextStyle(fontSize: 15, color: Colors.pink))
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 100,
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      child: Image.asset(
                        'assets/images/Mommy3.png',
                        width: 180,
                      ),
                      onTap: () {
                        avatar = "FEMALE";
                        avatar_name_F = "Mommy3.png";
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
                    //const Text('Mommy 3',
                    //style: TextStyle(fontSize: 15, color: Colors.pink))
                  ],
                ),
              ),
              SizedBox(
                width: 100,
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      child: Image.asset(
                        'assets/images/Mommy4.png',
                        width: 180,
                      ),
                      onTap: () {
                        avatar = "FEMALE";
                        avatar_name_F = "Mommy4.png";
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
                    //const Text('Mommy 4',
                    //style: TextStyle(fontSize: 15, color: Colors.pink))
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 100,
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      child: Image.asset(
                        'assets/images/Daddy1.png',
                        width: 180,
                      ),
                      onTap: () {
                        avatar = "MALE";
                        avatar_name_M = "Daddy1.png";
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
                    // const Text('Daddy 1',
                    // style: TextStyle(fontSize: 15, color: Colors.brown))
                  ],
                ),
              ),
              SizedBox(
                width: 100,
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      child: Image.asset(
                        'assets/images/Daddy2.png',
                        width: 180,
                      ),
                      onTap: () {
                        avatar = "MALE";
                        avatar_name_M = "Daddy2.png";
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
                    //const Text('Daddy 2',
                    //style: TextStyle(fontSize: 15, color: Colors.brown))
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 100,
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      child: Image.asset(
                        'assets/images/Daddy3.png',
                        width: 180,
                      ),
                      onTap: () {
                        avatar = "MALE";
                        avatar_name_M = "Daddy3.png";
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
                    // const Text('Daddy 3',
                    //style: TextStyle(fontSize: 15, color: Colors.brown))
                  ],
                ),
              ),
              SizedBox(
                width: 100,
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      child: Image.asset(
                        'assets/images/Daddy4.png',
                        width: 180,
                      ),
                      onTap: () {
                        avatar = "MALE";
                        avatar_name_M = "Daddy4.png";
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
                    //const Text('Daddy 4',
                    //style: TextStyle(fontSize: 15, color: Colors.brown))
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
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
                    print(Gender);
                  } else if (avatar == "MALE") {
                    print(avatar);
                    register_guardian_male();
                  } else if (avatar == "FEMALE") {
                    print(avatar);
                    register_guardian_female();
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Colors.cyan,
                ),
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
                  backgroundColor: Colors.cyan,
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  "Cancel",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ]),
          //_customizevoice(context),
          TextField(
            controller: gender,
            decoration: InputDecoration(
              hintText: "gender",
              contentPadding: const EdgeInsets.all(5.0),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none),
              fillColor: Colors.white.withOpacity(0.3),
              filled: true,
            ),
            style: const TextStyle(color: Colors.white),
            obscureText: false,
          ),

          //Text(
          // (widget.Firstname[0].toUpperCase()),
          //style: const TextStyle(color: Colors.white),
          //,
          //Text(
          //  widget.Lastname,
          //style: const TextStyle(color: Colors.white),
          //),
          //Text(
          // widget.NickName,
          // style: const TextStyle(color: Colors.white),
          // ),
          //  Text(
          //   widget.Phone,
          //  style: const TextStyle(color: Colors.white),
          //),
          //// Text(
          //  widget.Email,
          // style: const TextStyle(color: Colors.white),
          //  ),
          // Text(
          // widget.Pword,
          //  style: const TextStyle(color: Colors.white),
          //),
          // Text(
          // widget.ConfirmPword,
          // style: const TextStyle(color: Colors.white),
          // ),
        ]));
  }

//para magkaron ng chnages at kung may user interaction, gamit lang ng setstate
  //void getgenderMale() async {
  // // Gender = "MALE";
  // setState(() {});
  // }

  _headertext(context) {
    //ito yung interpolation yung may dollar sign
    return Column(
      children: [
        Text(
          "Hi ${widget.Firstname[0].toUpperCase() + widget.Firstname.substring(1)}, choose your avatar",
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.brown),
        )
      ],
    );
  }

  void getGuardEmail() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    guardEmail = pref.getString('guard_Email');
    //comments ko to: the key will be passed here (guardian_Email)
    setState(() {});
  }

  Future<void> setGuardEmail(guardEmail) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('guard_Email',
        guardEmail); //comments ko to: guardian_Email is the key here that will be passed to the get method that is called to another screen
  }
}
