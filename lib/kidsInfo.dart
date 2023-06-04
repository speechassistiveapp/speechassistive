// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import "package:flutter/material.dart";
//import "package:speechassistive/choose_avatar.dart";

class KidsInfo extends StatefulWidget {
  const KidsInfo({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _KidsinfoState createState() => _KidsinfoState();
}

class _KidsinfoState extends State<KidsInfo> {
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
              _header(context),
              _inputField(context),
            ],
          ),
        ),
      ),
    ));
  }
}

_header(context) {
  return Column(
    children: const [
      Text(
        "Kid's Information",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      )
    ],
  );
}

_inputField(context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      const SizedBox(height: 40),
      TextField(
        //controller: email,
        decoration: InputDecoration(
            hintText: "Name",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none),
            fillColor: Colors.grey.withOpacity(0.3),
            filled: true,
            prefixIcon: const Icon(Icons.person)),
      ),
      const SizedBox(height: 10),
      TextField(
        //controller: password,
        decoration: InputDecoration(
            hintText: "Age",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none),
            fillColor: Colors.grey.withOpacity(0.3),
            filled: true,
            prefixIcon: const Icon(Icons.numbers)),
        obscureText: true,
      ),
      const SizedBox(height: 10),
      TextField(
        //controller: password,
        decoration: InputDecoration(
            hintText: "Address",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none),
            fillColor: Colors.grey.withOpacity(0.3),
            filled: true,
            prefixIcon: const Icon(Icons.home)),
        obscureText: true,
      ),
      const SizedBox(height: 10),
      TextField(
        //controller: password,
        keyboardType: TextInputType.multiline,
        maxLines: 5,
        decoration: InputDecoration(
            hintText: "Hobbies",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none),
            fillColor: Colors.grey.withOpacity(0.3),
            filled: true,
            prefixIcon: const Icon(Icons.gamepad)),
        //obscureText: true,
      ),
      const SizedBox(height: 40),
      ElevatedButton(
        onPressed: () {
          //Confirm(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const KidsInfo()),
          );
        },
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        child: const Text(
          "Confirm",
          style: TextStyle(fontSize: 20),
        ),
      ),
      const SizedBox(height: 30),
    ],
  );
}
