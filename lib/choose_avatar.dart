// ignore: file_names

import 'package:flutter/material.dart';

List<String> imageList = [
  'assets/images/Avatar2_g1.png',
  'assets/images/Avatar4_g2.png',
  'assets/images/Avatar1_b1.png',
  'assets/images/Avatar3_b2.png'
];

class Avatar extends StatefulWidget {
  const Avatar({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _Avatar createState() => _Avatar();
}

class _Avatar extends State<Avatar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          // ignore: prefer_const_literals_to_create_immutables
          children: [
            _header(context),
            const SizedBox(
              height: 30,
            ),
            // ignore: prefer_const_constructors
            CircleAvatar(
              radius: 100,
              backgroundImage:
                  const AssetImage("assets/images/avatar_mainpic.png"),
            ),
            const SizedBox(
              height: 7,
            ),

            // ignore: sized_box_for_whitespace
            Container(
              height: 150,
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                              image: AssetImage(imageList[index]),
                              fit: BoxFit.cover)),
                    );
                  }),
            ),

            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  backgroundColor: Colors.green,
                ),
                child: const Text(
                  "Upload from Device",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  backgroundColor: Colors.blue,
                ),
                child: const Text(
                  "Confirm",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ]),
    ));
  }

  _header(context) {
    return Column(
      children: const [
        Text(
          "Choose Your Avatar",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
