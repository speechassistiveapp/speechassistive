import "package:flutter/material.dart";

// ignore: camel_case_types
class sub_Person extends StatefulWidget {
  const sub_Person({super.key});
  @override

  // ignore: library_private_types_in_public_api
  _PersonState createState() => _PersonState();
}

class _PersonState extends State<sub_Person> {
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
              const SizedBox(height: 100),
              _headerImage(context),
            ],
          ),
        ),
      ),
    ));
  }
}

_headerImage(context) {
  return Column(
    children: [
      SizedBox(
        height: 400,
        width: 400,
        child: Image.asset('assets/images/colors.png'),
      )
    ],
  );
}
