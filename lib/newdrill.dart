// ignore_for_file: no_logic_in_create_state, camel_case_types, unused_import, unused_element, non_constant_identifier_names, prefer_collection_literals, avoid_print, duplicate_ignore, unused_local_variable, no_leading_underscores_for_local_identifiers
import 'package:flutter/material.dart';
import 'package:speechassistive/choose_avatar.dart';
import 'package:speechassistive/practicedrill.dart';
import 'package:speechassistive/tts.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:speechassistive/vocabulary.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewDrill extends StatefulWidget {
  const NewDrill({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _newdrill createState() => _newdrill();
}

String _data = "";
String data_ = "";
String guard_Nname = "";
String child_Nname = "";
String child_gender = "";

class _newdrill extends State<NewDrill> {
  String gend = "";
  String guard_avatar = "";
  String child_avatar = "";
  String? Gender;
  String? guardianEmail;

  Future<void> getGuardianNickName() async {
    var map = Map<String, dynamic>();
    map['Email'] = guardianEmail;
    var uri = "https://www.speech-assistive-app.com/getGuardian_Nname.php";
    var res = await http.post(Uri.parse(uri), body: map);
    //print(res.body);
    final String g_Nname = jsonEncode(res.body);

    //content response of res.body must be converted from object to json string by using jsonEncode
    guard_Nname = g_Nname;
    print(guard_Nname);
  }

  Future<void> getGuardian_Gender() async {
    var map = Map<String, dynamic>();
    map['Email'] = guardianEmail;
    var uri = "https://www.speech-assistive-app.com/getdata.php";
    var res = await http.post(Uri.parse(uri), body: map);
    //print(res.body);
    final String g_gender = jsonEncode(res
        .body); //content response of res.body must be converted from object to json string by using jsonEncode
    // ignore: avoid_print
    gend = g_gender;
    print(gend);
  }

  Future<void> getGuardian_AvatarName() async {
    var map = Map<String, dynamic>();
    map['Email'] = guardianEmail;
    var uri = "https://www.speech-assistive-app.com/getGuard_AvatarName.php";
    var res = await http.post(Uri.parse(uri), body: map);
    //print(res.body);
    final String g_avatarname = jsonEncode(res
        .body); //content response of res.body must be converted from object to json string by using jsonEncode
    // ignore: avoid_print
    guard_avatar = g_avatarname;
    if (g_avatarname == '"Daddy1.png"') {
      guard_avatar = "Daddy1.png";
      print(guard_avatar);
    }
  }

  Future<void> getChildNickName() async {
    var map = Map<String, dynamic>();
    map['Email'] = guardianEmail;
    var uri = "https://www.speech-assistive-app.com/getChild_Nname.php";
    var resp = await http.post(Uri.parse(uri), body: map);
    //print(resp.body);
    final String c_Nname = jsonEncode(resp
        .body); //content response of res.body must be converted from object to json string by using jsonEncode
    child_Nname = c_Nname;
    print(child_Nname);
  }

  Future<void> getChild_Gender() async {
    var map = Map<String, dynamic>();
    map['Email'] = guardianEmail;
    var uri = "https://www.speech-assistive-app.com/getChild_Gender.php";
    var res = await http.post(Uri.parse(uri), body: map);
    //print(res.body);
    final String c_data = jsonEncode(res
        .body); //content response of res.body must be converted from object to json string by using jsonEncode
    // ignore: avoid_print
    child_gender = c_data;
    print(child_gender);
  }

  Future<void> getChild_AvatarName() async {
    var map = Map<String, dynamic>();
    map['Email'] = guardianEmail;
    var uri = "https://www.speech-assistive-app.com/getChild_AvatarName.php";
    var res = await http.post(Uri.parse(uri), body: map);
    //print(res.body);
    final String c_avatarname = jsonEncode(res
        .body); //content response of res.body must be converted from object to json string by using jsonEncode
    // ignore: avoid_print
    //print(c_avatarname);
    child_avatar = c_avatarname;
    print(child_avatar);
  }

  @override
  void initState() {
    super.initState();
    getGuardianEmail();
  }

  final TextEditingController _question = TextEditingController();
  final TextEditingController _answer = TextEditingController();

  Future<void> passdata() async {
    try {
      if (_question.text == "" || _answer.text == "") {
        Fluttertoast.showToast(
          msg: "Fields Required!",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          fontSize: 16.0,
        );
      } else {
        if (gend == "MALE") {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const TexttoSpeech()));
        } else if (gend == "FEMALE") {}
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const TexttoSpeech()));
      } //try
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: const Text("New Drill"), centerTitle: true),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              guardianEmail == null
                  ? const Text('No Email passed')
                  : Text(guardianEmail!,
                      style: const TextStyle(color: Colors.white)),

              const SizedBox(height: 10),
              _logo(context),
              const SizedBox(height: 10),
              _header(context),
              Text(
                gend,
                style: const TextStyle(color: Colors.white),
              ),
              Text(
                guard_avatar,
                style: const TextStyle(color: Colors.white),
              ), //spacer between the Appbar and the button
              _inputField(context),
            ],
          ),
        ),
      ),
    ));
  }

  _inputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 10),
        TextField(
            controller: _question,
            decoration: InputDecoration(
                hintText: "Question asked by Guardian",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none),
                fillColor: Colors.grey.withOpacity(0.3),
                filled: true,
                prefixIcon: const Icon(Icons.question_answer)),
            obscureText: false),
        const SizedBox(height: 10),
        TextField(
          controller: _answer,
          decoration: InputDecoration(
              hintText: "Expected answer of the Student",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none),
              fillColor: Colors.grey.withOpacity(0.3),
              filled: true,
              prefixIcon: const Icon(Icons.question_answer)),
          obscureText: false,
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {
            passdata();
            setQuestion(_question.text);
            setAnswer(_answer.text);
            setgenderGuardian(gend);
            setAvatar(guard_avatar);
            setGuardian_NickName(guard_Nname);
            setChild_Nname(child_Nname);
            setChild_Gender(child_gender);
            setChild_Avatar(child_avatar);
            getGuardian_Gender();

            ///setDetails(_question, _answer, avatar, child_Nname, guard_Nname,
            //child_gender, child_avatar, gend);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          child: const Text(
            "Generate Drill",
            style: TextStyle(fontSize: 20),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PracticeDrill()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          child: const Text(
            "Back to Practice Drill",
            style: TextStyle(fontSize: 20),
          ),
        )
      ],
    );
  }

  void getGuardianEmail() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    guardianEmail = pref.getString('guardian_Email');
    getGuardianNickName();
    getGuardian_Gender();
    getGuardian_AvatarName();
    getChildNickName();
    getChild_Gender();
    getChild_AvatarName();
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

Future<void> setQuestion(question) async {
  final SharedPreferences pref = await SharedPreferences.getInstance();
  question = question.replaceAll('"', '');
//pref.setString('guardian_Email', guardianEmail);
  pref.setString('_question', question);
  //comments ko to: guardian_Email is the key here that will be passed to the get method that is called to another screen
}

Future<void> setAnswer(answer) async {
  final SharedPreferences pref = await SharedPreferences.getInstance();
//pref.setString('guardian_Email', guardianEmail);
  answer = answer.replaceAll('"', '');
  pref.setString('_answer', answer);
}

Future<void> setgenderGuardian(gend) async {
  final SharedPreferences pref = await SharedPreferences.getInstance();
  gend = gend.replaceAll('"', '');
  pref.setString('_guardgend', gend);
}

Future<void> setAvatar(guard_avatar) async {
  final SharedPreferences pref = await SharedPreferences.getInstance();
  guard_avatar = guard_avatar.replaceAll('"', '');
  pref.setString('_avatar', guard_avatar);
}

Future<void> setGuardian_NickName(guard_Nname) async {
  final SharedPreferences pref = await SharedPreferences.getInstance();
  guard_Nname = guard_Nname.replaceAll('"', '');
  pref.setString('_guardNname', guard_Nname);
}

Future<void> setChild_Nname(child_Nname) async {
  final SharedPreferences pref = await SharedPreferences.getInstance();
  child_Nname = child_Nname.replaceAll('"', '');
  pref.setString('_childNname', child_Nname);
}

Future<void> setChild_Gender(child_gender) async {
  final SharedPreferences pref = await SharedPreferences.getInstance();
  child_gender = child_gender.replaceAll('"', '');
  pref.setString('_childgender', child_gender);
}

Future<void> setChild_Avatar(child_avatar) async {
  final SharedPreferences pref = await SharedPreferences.getInstance();
  child_avatar = child_avatar.replaceAll('"', '');
  pref.setString('_childavatar', child_avatar);
}

_header(context) {
  return Column(
    children: const [
      Text(
        "Please enter your question and expected answer  \n in the textboxes below.",
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
      )
    ],
  );
}

_logo(context) {
  return Column(
    children: [
      SizedBox(
        height: 200,
        width: 250,
        child: Image.asset('assets/images/speechassistiveapp_updatedlogo.png'),
      )
    ],
  );
}
