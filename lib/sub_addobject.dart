import "package:flutter/material.dart";

// ignore: camel_case_types
class sub_AddObj extends StatefulWidget {
  const sub_AddObj({super.key});
  @override

  // ignore: library_private_types_in_public_api
  _AddObjState createState() => _AddObjState();
}

class _AddObjState extends State<sub_AddObj> {
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
