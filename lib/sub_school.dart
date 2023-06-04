import "package:flutter/material.dart";

// ignore: camel_case_types
class sub_School extends StatefulWidget {
  const sub_School({super.key});
  @override

  // ignore: library_private_types_in_public_api
  _SchoolState createState() => _SchoolState();
}

class _SchoolState extends State<sub_School> {
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
