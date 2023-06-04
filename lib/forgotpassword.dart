import 'package:flutter/material.dart';
import 'package:speechassistive/confirmpassword.dart';

// ignore: camel_case_types
class test extends StatelessWidget {
  const test({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _header(context),
            const SizedBox(height: 20),
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Row(
                children: const [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Phone",
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.phone,
                          ),
                        ),
                      ),
                    ),
                  )
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
                          hintText: "Code",
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.code,
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
                      "Get a Code",
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Confirmpassword()),
                  );
                },
                child: const Text(
                  "Verify",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            const SizedBox(height: 10),
            _Code(context),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  _Code(context) {
    return Column(
      children: const [
        Text(
          "Did not receive the code?",
          style: TextStyle(
              fontSize: 13, fontWeight: FontWeight.bold, color: Colors.red),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Click here",
          style: TextStyle(
              fontSize: 13, fontWeight: FontWeight.bold, color: Colors.blue),
        )
      ],
    );
  }

  _header(context) {
    return Column(
      children: const [
        Text(
          "Forgot Password",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
