import 'package:flutter/material.dart';
//import 'package:speechassistive/choose_avatar.dart';
//import 'package:speechassistive/confirmpassword.dart';

// ignore: camel_case_types
class Edit_KidProf extends StatefulWidget {
  const Edit_KidProf({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Edit_KidProfState createState() => _Edit_KidProfState();
}

// ignore: camel_case_types
class _Edit_KidProfState extends State<Edit_KidProf> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Edit Profile"), centerTitle: true),
        backgroundColor: Colors.white,
        body: Column(children: [
          const SizedBox(
              height: 10), //spacer between the Appbar and the buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    //Navigator.push(
                    //context,
                    //MaterialPageRoute(builder: (context) => const Avatar()),
                    // );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.green,
                  ),
                  child: const Text(
                    "Change Avatar",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                width: 120,
                child: Image.asset("assets/images/Avatar1_b1.png"),
              ),
            ],
          ), //can insert containers after the row
          const SizedBox(height: 30),
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Row(
              children: [
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Name",
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.person,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 110,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 1,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: const Text(
                    "Edit",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Row(
              children: [
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Age",
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.numbers,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 110,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 1,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: const Text(
                    "Edit",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Row(
              children: [
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Address",
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.home,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 110,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 1,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: const Text(
                    "Edit",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Row(
              children: [
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 0),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Hobbies",
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.gamepad,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 110,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 1,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: const Text(
                    "Edit",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: 350,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () {
                //Navigator.push(
                //context,
                //MaterialPageRoute(
                // builder: (context) => const Confirmpassword()),
                //);
              },
              child: const Text(
                "Apply Changes",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 350,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () {
                //Navigator.push(
                //context,
                //MaterialPageRoute(
                // builder: (context) => const Confirmpassword()),
                //);
              },
              child: const Text(
                "Log-Out",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
