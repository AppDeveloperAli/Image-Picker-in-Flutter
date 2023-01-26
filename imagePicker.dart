import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PostsSender extends StatefulWidget {
  const PostsSender({super.key});

  @override
  State<PostsSender> createState() => _PostsSenderState();
}

class _PostsSenderState extends State<PostsSender> {
  
  /// Variables
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: imageFile == null
              ? Image.asset('assets/img/login_logo.png')
              : Image.file(imageFile!),
        ),
      ]),
    );
  }

  /// Get from gallery
  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  /// Get from Camera
  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  //Let user make a choice with the help of a Dialogue Box
  Future<void> getDilogueBox() async {
    return showDialog<void>(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Image Picker'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Pick an image from ?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Camera',
                style: const TextStyle(color: Colors.blueAccent),
              ),
              onPressed: () {
                _getFromCamera();
              },
            ),
            TextButton(
              child: Text(
                'Gallery',
                style: const TextStyle(color: Colors.blueAccent),
              ),
              onPressed: () {
                _getFromGallery();
              },
            ),
          ],
        );
      },
    );
  }
}
