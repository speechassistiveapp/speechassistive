// ignore_for_file: import_of_legacy_library_into_null_safe, use_build_context_synchronously, avoid_print, non_constant_identifier_names, duplicate_ignore
import 'dart:convert';
import "package:flutter/material.dart";
import 'package:speechassistive/mainmenu.dart';
import 'package:speechassistive/register.dart';
//import 'package:speechassistive/forgotpassword.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  TextEditingController Email = TextEditingController();
  TextEditingController pword = TextEditingController();

  Future login() async {
    if ((Email.text == "") || (pword.text == "")) {
      Fluttertoast.showToast(
        msg: "Fileds Required!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        fontSize: 16.0,
      );
    } else {
// ignore: prefer_collection_literals
      var map = Map<String, dynamic>();
      map['Email'] = Email.text;
      map['Pword'] = pword.text;
      var uri = "https://www.speech-assistive-app.com/login.php";
      var res = await http.post(Uri.parse(uri), body: map);
      //print(res.body);
      final String data = jsonEncode(res
          .body); //content response of res.body must be converted from object to json string by using jsonEncode
      print(data);
      if (data == '"Successful Login! "') {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const MainMenu()));
        Fluttertoast.showToast(
          msg: "Successful Login!",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          fontSize: 16.0,
        );
        //Email.text = "";
        pword.text = "";
      } else if (data == '"The email address provided is invalid "') {
        Fluttertoast.showToast(
          msg: "The email address provided is invalid",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          fontSize: 16.0,
        );

        pword.text = "";
      } else {
        Fluttertoast.showToast(
          msg: "Incorrect Email or Password",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          fontSize: 16.0,
        );

        pword.text = "";
      }
    }
  }

  // ignore: non_constant_identifier_names

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 5),
              _logo(context),
              _header(context),
              _inputField(context),
              //_forgotPassword(context),///forgot password
            ],
          ),
        ),
      ),
    ));
  }

  _logo(context) {
    return Column(
      children: [
        SizedBox(
          height: 250,
          width: 250,
          child:
              Image.asset('assets/images/speechassistiveapp_updatedlogo.png'),
        )
      ],
    );
  }

  _header(context) {
    return Column(
      children: const [
        Text(
          "Log-in",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  _inputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 20),
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
        ),
        const SizedBox(height: 10),
        TextField(
          controller: pword,
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
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: () {
            setGuardianEmail(Email.text);
            login();
          },
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          child: const Text(
            "Login",
            style: TextStyle(fontSize: 20),
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Register()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          child: const Text(
            "Create New Account",
            style: TextStyle(fontSize: 20),
          ),
        )
      ],
    );
  }

  Future<void> setGuardianEmail(guardianEmail) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('guardian_Email',
        guardianEmail); //comments ko to: guardian_Email is the key here that will be passed to the get method that is called to another screen
  }

  //_forgotPassword(context) {
  //return TextButton(
  //  onPressed: () {
  //   Navigator.push(
  //     context,
  //   MaterialPageRoute(builder: (context) => const test()),
  //  );
  // },
  // child: const Text("Forgot Password?"));
  //}
}

// ignore: camel_case_types

class $data {}



//const LoginScreen({super.key});
