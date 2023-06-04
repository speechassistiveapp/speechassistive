// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names, avoid_print, unnecessary_const, unused_import, sort_child_properties_last, sized_box_for_whitespace, unused_field, unused_local_variable, camel_case_types, unnecessary_string_interpolations

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:speechassistive/login.dart';
import 'package:speechassistive/newdrill.dart';
import 'package:speechassistive/selectAvatar.dart';
import 'package:speechassistive/selectAvatar_Child.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register_Child extends StatefulWidget {
  const Register_Child({super.key});

  @override
  _Registration_Child createState() => _Registration_Child();
}

class _Registration_Child extends State<Register_Child> {
  TextEditingController Firstname = TextEditingController();
  TextEditingController Lastname = TextEditingController();
  TextEditingController MI = TextEditingController();
  TextEditingController NickName = TextEditingController();
  TextEditingController Age = TextEditingController();
  TextEditingController Gender = TextEditingController();
  //String? Gender;
  //String? Gender;
  String? guardEmail;

  @override
  void initState() {
    super.initState();
    getGuardEmail();

    //displaygender();
  }

  Future<void> register() async {
    try {
      if (Firstname.text == "" ||
          Lastname.text == "" ||
          MI.text == "" ||
          NickName.text == "" ||
          Age.text == "" ||
          Gender.text == "") {
        Fluttertoast.showToast(
          msg: "Fields Required!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          fontSize: 16.0,
        );
      } else {
        //dito start ng pag uncomment
// ignore: prefer_collection_literals
        //var map = Map<String, dynamic>();
        //map['Firstname'] = Firstname.text;
        // map['Lastname'] = Lastname.text;
        // map['NickName'] = NickName.text;
        // map['Phone'] = Phone.text;
        // map['Email'] = Email.text;
        // map['Pword'] = Pword.text;
        // map['ConfirmPword'] = ConfirmPword.text;
        // map['VoiceRec'] = "default";
        //var uri = "https://www.speech-assistive-app.com/register.php";
        //var res = await http.post(Uri.parse(uri), body: map);

        //var url = "https://www.speech-assistive-app.com/updaterec_Guardian.php";

        //var resp = await http.post(Uri.parse(url), body: map);
        //print(res.body);
        //final String data = jsonEncode(res
        //.body); //content response of res.body must be converted from object to json string by using jsonEncode
        // print(data);
        //if (data == '"User already exist!"') {
        //Fluttertoast.showToast(
        // msg: "User already exist!",
        // toastLength: Toast.LENGTH_LONG,
        // gravity: ToastGravity.CENTER,
        // fontSize: 16.0,
        // );
        //} else if (data == '"Phone Number is invalid"') {
        // Fluttertoast.showToast(
        //msg: "Phone Number is invalid",
        // toastLength: Toast.LENGTH_LONG,
        // gravity: ToastGravity.CENTER,
        // fontSize: 16.0,
        //  );
        //} else if (data == '"The email address provided is invalid"') {
        //Fluttertoast.showToast(
        // msg: "The Email address provided is invalid",
        // toastLength: Toast.LENGTH_LONG,
        // gravity: ToastGravity.CENTER,
        //fontSize: 16.0,
        // );
        //} else if (data ==
        //'"New User account has been successfully created!"') {
        // ignore: use_build_context_synchronously
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SelectAvatar_Child(
                Firstname: Firstname.text,
                Lastname: Lastname.text,
                MI: MI.text,
                NickName: NickName.text,
                Age: Age.text,
                Gender: Gender.text)));
        //guardian_Email: guardian_Email)));
        //}
      }
    } //try////this is how to insert records to mysql database via post
    catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _logo(context),
              guardEmail == null
                  ? const Text('No Email passed')
                  : Text(guardEmail!,
                      style: const TextStyle(color: Colors.white)),
              const SizedBox(
                height: 10,
              ),
              _headertext(context),
              _inputField(context),
            ],
          ),
        ),
      ),
    ));
  }

  _headertext(context) {
    return Column(
      children: const [
        Text(
          "Register your Child",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.cyan),
        )
      ],
    );
  }

  _inputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 10),
        TextField(
          controller: Firstname,
          decoration: InputDecoration(
              hintText: "First Name",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none),
              fillColor: Colors.grey.withOpacity(0.3),
              filled: true,
              prefixIcon: const Icon(Icons.person)),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: Lastname,
          decoration: InputDecoration(
              hintText: "Last Name",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none),
              fillColor: Colors.grey.withOpacity(0.3),
              filled: true,
              prefixIcon: const Icon(Icons.person)),
          //obscureText: true,
        ),
        const SizedBox(height: 10),
        TextField(
          controller: MI,
          decoration: InputDecoration(
              hintText: "Middel Initial",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none),
              fillColor: Colors.grey.withOpacity(0.3),
              filled: true,
              prefixIcon: const Icon(Icons.person)),
          //obscureText: true,
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          controller: NickName,
          decoration: InputDecoration(
              hintText: "Nick Name",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none),
              fillColor: Colors.grey.withOpacity(0.3),
              filled: true,
              prefixIcon: const Icon(Icons.person)),
          onChanged: (val) {},
          //obscureText: true,
        ),
        const SizedBox(height: 10),
        TextField(
          controller: Age,
          decoration: InputDecoration(
              hintText: "Age",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none),
              fillColor: Colors.grey.withOpacity(0.3),
              filled: true,
              prefixIcon: const Icon(Icons.numbers)),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: Gender,
          decoration: InputDecoration(
              hintText: "Gender",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none),
              fillColor: Colors.grey.withOpacity(0.3),
              filled: true,
              prefixIcon: const Icon(Icons.person)),
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () {
            register();
          },
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          child: const Text(
            "Next",
            style: TextStyle(fontSize: 20),
          ),
        ),
        //const SizedBox(height: 5),
        //_newdrill(context)
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
    pref.setString('guardian_Email',
        guardEmail); //comments ko to: guardian_Email is the key here that will be passed to the get method that is called to another screen
  }

  _logo(context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          width: 250,
          child:
              Image.asset('assets/images/speechassistiveapp_updatedlogo.png'),
        )
      ],
    );
  }
}


//_logo(context) {
  //return Column(
    //children: [
      //SizedBox(
        //height: 20,
        //width: 20,
        //child: Image.asset('assets/images/Avater1_b1.png'),
      //)
    //],
  //);
//}
