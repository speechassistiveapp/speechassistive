// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace, prefer_const_constructors, avoid_types_as_parameter_names, file_names, unnecessary_this, unused_field, unused_import, depend_on_referenced_packages, avoid_unnecessary_containers, avoid_print
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class AddObject extends StatefulWidget {
  const AddObject({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddObject createState() => _AddObject();
}

class _AddObject extends State<AddObject> {
  TextEditingController textObject = TextEditingController();
  File? _image;

  Future getImage_camera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;

    final imageTemporary = File(image.path);

    setState(() {
      this._image = imageTemporary;
    });
  }

  Future getImage_gallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final imageTemporary = File(image.path);

    setState(() {
      this._image = imageTemporary;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add OBJECTS"), centerTitle: true),
      body: Container(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const SizedBox(
          height: 30,
        ),
        GestureDetector(
          child: _image != null
              ? Image.file(
                  _image!,
                  width: 250,
                  height: 250,
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  'assets/images/backbag.png',
                  width: 250,
                  height: 250,
                ),
          onTap: () async {
            print(textObject.text);
          },
        ),
        const SizedBox(
          height: 20,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          SizedBox(
            width: 380,
            child: ElevatedButton(
              onPressed: () async {
                getImage_camera();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan,
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                "Add Object from Camera",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ]),
        const SizedBox(
          height: 10,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          SizedBox(
            width: 380,
            child: ElevatedButton(
              onPressed: () async {
                getImage_gallery();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan,
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                "Add Object from Gallery",
                style: TextStyle(fontSize: 18),
              ),
            ),
          )
        ]),
        const SizedBox(
          height: 20,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          SizedBox(
            width: 380,
            child: TextField(
              controller: textObject,
              decoration: InputDecoration(
                  hintText: "Object",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none),
                  fillColor: Colors.grey.withOpacity(0.3),
                  filled: true,
                  prefixIcon: const Icon(Icons.emoji_objects_rounded)),
              //obscureText: true,
            ),
          ),
        ]),
        const SizedBox(
          height: 10,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          SizedBox(
            width: 380,
            child: ElevatedButton(
              onPressed: () async {
                //getImage_gallery();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                "Save Object",
                style: TextStyle(fontSize: 18),
              ),
            ),
          )
        ]),
        const SizedBox(
          height: 20,
        ),
      ])),
    );
  }
}
