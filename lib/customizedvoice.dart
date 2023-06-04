// ignore_for_file: library_private_types_in_public_api, camel_case_types, avoid_print

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

class CustomizedVoice extends StatefulWidget {
  const CustomizedVoice({super.key});

  @override
  _customizedvoice createState() => _customizedvoice();
}

class _customizedvoice extends State<CustomizedVoice> {
  @override
  Widget build(BuildContext context) {
    String avatar = "empty";
    return Scaffold(
        body: Column(children: [
      const SizedBox(height: 50), //spacer between the Appbar and the buttons
      _headertext(context),
      const SizedBox(height: 10),

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Column(
              children: <Widget>[
                GestureDetector(
                  child: Image.asset(
                    'assets/images/Mommy1.png',
                    height: 180,
                  ),
                  onTap: () {
                    avatar = "FEMALE";
                  },
                ),
                const Text('Mommy 1',
                    style: TextStyle(fontSize: 15, color: Colors.green)),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                GestureDetector(
                  child: Image.asset(
                    'assets/images/Mommy2.png',
                    height: 180,
                  ),
                  onTap: () {
                    avatar = "FEMALE";
                  },
                ),
                const Text('Mommy 2',
                    style: TextStyle(fontSize: 15, color: Colors.green)),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                GestureDetector(
                  child: Image.asset(
                    'assets/images/Mommy3.png',
                    height: 180,
                  ),
                  onTap: () {
                    avatar = "FEMALE";
                  },
                ),
                const Text('Mommy 3',
                    style: TextStyle(fontSize: 15, color: Colors.green)),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                GestureDetector(
                  child: Image.asset(
                    'assets/images/Mommy4.png',
                    height: 180,
                  ),
                  onTap: () {
                    avatar = "FEMALE";
                  },
                ),
                const Text('Mommy 4',
                    style: TextStyle(fontSize: 15, color: Colors.green)),
              ],
            ),
          ),
        ],
      ),

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Column(
              children: <Widget>[
                GestureDetector(
                  child: Image.asset(
                    'assets/images/Daddy1.png',
                    height: 180,
                  ),
                  onTap: () {
                    avatar = "MALE";
                  },
                ),
                const Text('Daddy 1',
                    style: TextStyle(fontSize: 15, color: Colors.red)),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                GestureDetector(
                  child: Image.asset(
                    'assets/images/Daddy2.png',
                    height: 180,
                  ),
                  onTap: () {
                    avatar = "MALE";
                  },
                ),
                const Text('Daddy 2',
                    style: TextStyle(fontSize: 15, color: Colors.red)),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                GestureDetector(
                  child: Image.asset(
                    'assets/images/Daddy3.png',
                    height: 180,
                  ),
                  onTap: () {
                    avatar = "MALE";
                  },
                ),
                const Text('Daddy 3',
                    style: TextStyle(fontSize: 15, color: Colors.red)),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                GestureDetector(
                  child: Image.asset(
                    'assets/images/Daddy4.png',
                    height: 180,
                  ),
                  onTap: () {
                    avatar = "MALE";
                  },
                ),
                const Text('Daddy 4',
                    style: TextStyle(fontSize: 15, color: Colors.red)),
              ],
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 5,
      ),

      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        SizedBox(
          width: 400,
          child: ElevatedButton(
            onPressed: () {
              //function
            },
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text(
              "Upload Customized Voice",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ]),

      const SizedBox(
        height: 10,
      ),
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        SizedBox(
          width: 400,
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
                //register_guardian_male();
              } else if (avatar == "FEMALE") {
                print(avatar);
                //register_guardian_female();
              }
            },
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text(
              "Save Profile",
              style: TextStyle(fontSize: 20),
            ),
          ),
        )
      ]),
    ]));
  }
}

_headertext(context) {
  return Column(
    children: const [
      Text(
        "Choose Guardian's Avatar \n      (Customized Voice)",
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent),
      )
    ],
  );
}
