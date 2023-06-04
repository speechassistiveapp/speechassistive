import 'package:flutter/material.dart';
//import 'package:speechassistive/choose_avatar.dart';
import 'package:speechassistive/login.dart';

class Confirmpassword extends StatelessWidget {
  const Confirmpassword({super.key});

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
              const SizedBox(height: 180),
              _header(context),
              _inputField(context),
            ],
          ),
        ),
      ),
    ));
  }

  _header(context) {
    return Column(
      children: const [
        Text(
          "Confirm Password",
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
            decoration: InputDecoration(
                hintText: "New Password",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none),
                fillColor: Colors.grey.withOpacity(0.3),
                filled: true,
                prefixIcon: const Icon(Icons.key)),
            obscureText: true),
        const SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
              hintText: "Confirm Password",
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          child: const Text(
            "Confirm",
            style: TextStyle(fontSize: 20),
          ),
        )
      ],
    );
  }
}
