// ignore_for_file: avoid_print, non_constant_identifier_names, duplicate_ignore, dead_code, must_be_immutable, unused_local_variable, prefer_const_constructors, prefer_typing_uninitialized_variables, override_on_non_overriding_member, unused_import

//import "package:email_validator/email_validator.dart";
import "package:flutter/material.dart";
import "package:speechassistive/fetch.dart";
import "package:speechassistive/login.dart";
import "package:speechassistive/practicedrill.dart";
import "package:speechassistive/vocabulary.dart";
import 'package:shared_preferences/shared_preferences.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainMenu createState() => _MainMenu();
}

class _MainMenu extends State<MainMenu> {
  String? guardianEmail;

  @override
  void initState() {
    super.initState();
    getGuardianEmail();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(24),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  guardianEmail == null
                      ? const Text('No Email passed')
                      : Text(guardianEmail!,
                          style: const TextStyle(color: Colors.white)),
                  SizedBox(
                    height: 230,
                    width: 250,
                    child: Image.asset(
                        'assets/images/speechassistiveapp_updatedlogo.png'),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      setGuardianEmail(guardianEmail);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Vocabulary()),
                      );
                    },
                    icon: const Icon(Icons.book),
                    label: const Text("Vocabulary"),
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.blue,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const PracticeDrill()));
                    },
                    icon: const Icon(Icons.voice_chat_rounded),
                    label: const Text("Practice Drill"),
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.orange,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const fetch()),
                      );
                    },
                    icon: const Icon(Icons.person),
                    label: const Text("Profile"),
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                      //Navigator.push(
                      //context,
                      //MaterialPageRoute(builder: (context) => const PracticeDrill()),
                      // );
                    },
                    icon: const Icon(Icons.tour),
                    label: const Text("App Tour"),
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                    },
                    icon: const Icon(Icons.arrow_back),
                    label: const Text("Exit"),
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.red,
                    ),
                  ),
                ],
              )

              //_headerlogo(context),
              // _menubuttons(context),
            ],
          ),
        ),
      ),
    ));
  }

  void getGuardianEmail() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    guardianEmail = pref.getString('guardian_Email');
    //comments ko to: the key will be passed here (guardian_Email)
    setState(() {});
  }

  Future<void> setGuardianEmail(guardianEmail) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('guardian_Email',
        guardianEmail); //comments ko to: guardian_Email is the key here that will be passed to the get method that is called to another screen
  }
}

void logout() {}
