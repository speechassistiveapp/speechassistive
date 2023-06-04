import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

//import 'package:speechassistive/home.dart';
// ignore: depend_on_referenced_packages
import 'package:page_transition/page_transition.dart';
import 'package:speechassistive/login.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:just_audio/just_audio.dart';
import 'package:http/http.dart' as http;

Future<void> main() async {
  await dotenv.load(fileName: ".env");

  if (dotenv.env.isNotEmpty) {
    print('.env file is not empty.');
    print('Contents of .env file:');
    dotenv.env.forEach((key, value) {
      print('$key=$value');
    });
  } else {
    print('.env file is empty.');
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        //home: Image.asset('assets/images/speech_assistive_logo.png',height: 200.0,width: 200.0,),
        home: AnimatedSplashScreen(
          splash: 'assets/images/speechassistiveapp_updatedlogo.png',
          duration: 3000,
          nextScreen: const LoginScreen(
              //title: 'Speech Assistive',
              ),
          splashTransition: SplashTransition.fadeTransition,
          splashIconSize: 250,
          pageTransitionType: PageTransitionType.leftToRightWithFade,
        ));
  }
}
