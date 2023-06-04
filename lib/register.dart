// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names, avoid_print, unnecessary_const, unused_import, sort_child_properties_last, sized_box_for_whitespace, unused_field, unused_local_variable

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:speechassistive/confirmpassword.dart';
import 'package:speechassistive/login.dart';
import 'package:speechassistive/register_child.dart';
import 'package:speechassistive/selectAvatar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  _Registration createState() => _Registration();
}

class _Registration extends State<Register> {
  TextEditingController Firstname = TextEditingController();
  TextEditingController Lastname = TextEditingController();
  TextEditingController NickName = TextEditingController();
  TextEditingController Phone = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Pword = TextEditingController();
  TextEditingController ConfirmPword = TextEditingController();

  Future<void> register() async {
    try {
      if (Firstname.text == "" ||
          Lastname.text == "" ||
          NickName.text == "" ||
          Phone.text == "" ||
          Email.text == "" ||
          Pword.text == "" ||
          ConfirmPword.text == "") {
        Fluttertoast.showToast(
          msg: "Fields Required!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          fontSize: 16.0,
        );
      } else if (Pword.text != ConfirmPword.text) {
        Fluttertoast.showToast(
          msg: "Passwords did not match",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          fontSize: 16.0,
        );
      } else if (Phone.text.length != 11) {
        Fluttertoast.showToast(
          msg: "Phone Number must be 11 digits",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          fontSize: 16.0,
        );
      } else if (Pword.text.length < 8) {
        Fluttertoast.showToast(
          msg: "Password must be minimum of eight characters long",
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
            builder: (context) => SelectAvatar(
                Firstname: Firstname.text,
                Lastname: Lastname.text,
                NickName: NickName.text,
                Phone: Phone.text,
                Email: Email.text,
                Pword: Pword.text,
                ConfirmPword: ConfirmPword.text)));
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
              const SizedBox(
                height: 1,
              ),
              _logo(context),
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
          "Sign-Up (Guardian)",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.cyan),
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
          controller: NickName,
          decoration: InputDecoration(
              hintText: "Nick Name",
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
          controller: Phone,
          decoration: InputDecoration(
              hintText: "Phone Number (i.e 09123456789)",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none),
              fillColor: Colors.grey.withOpacity(0.3),
              filled: true,
              prefixIcon: const Icon(Icons.phone)),
          //obscureText: true,
        ),
        const SizedBox(height: 10),
        TextField(
          controller: Email,
          decoration: InputDecoration(
              hintText: "Email",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none),
              fillColor: Colors.grey.withOpacity(0.3),
              filled: true,
              prefixIcon: const Icon(Icons.email)),
          onChanged: (val) {},
          //obscureText: true,
        ),
        const SizedBox(height: 10),
        TextField(
          controller: Pword,
          decoration: InputDecoration(
              hintText: "Password",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none),
              fillColor: Colors.grey.withOpacity(0.3),
              filled: true,
              prefixIcon: const Icon(Icons.key)),
          obscureText: true,
        ),

        const SizedBox(
          height: 10,
        ),

        TextField(
          controller: ConfirmPword,
          decoration: InputDecoration(
              hintText: "Confirm Password",
              // ignore: prefer_const_constructors
              suffixIcon: InkWell(
                  //onTap: _HideUnhidePassword,
                  // ignore: prefer_const_constructors
                  child: Icon(
                Icons.visibility,
              )),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none),
              fillColor: Colors.grey.withOpacity(0.3),
              filled: true,
              prefixIcon: const Icon(Icons.key)),
          obscureText: true,
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            setGuardEmail(Email.text);
            register();
          },
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: Colors.cyan,
          ),
          child: const Text(
            "Next",
            style: TextStyle(fontSize: 20),
          ),
        ),
        //const SizedBox(height: 30),
      ],
    );
  }

  Future<void> setGuardEmail(guardEmail) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('guard_Email',
        guardEmail); //comments ko to: guardian_Email is the key here that will be passed to the get method that is called to another screen
  }
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
