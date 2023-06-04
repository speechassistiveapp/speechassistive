import "package:flutter/material.dart";

// ignore: camel_case_types
class sub_Colors extends StatefulWidget {
  const sub_Colors({super.key});
  @override

  // ignore: library_private_types_in_public_api
  _ColorsState createState() => _ColorsState();
}

class _ColorsState extends State<sub_Colors> {
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
