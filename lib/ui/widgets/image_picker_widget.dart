import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class ImagePickerWidget extends StatefulWidget {
  final Function(XFile?) onImagePicked;

  const ImagePickerWidget({super.key, required this.onImagePicked});

  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  XFile? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = pickedImage;
    });

    widget.onImagePicked(_image);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _image == null
            ? const Text('No image selected.')
            : Image.file(File(_image!.path)),
        const SizedBox(height: 20),
        FloatingActionButton(
          onPressed: _pickImage,
          tooltip: 'Pick Image',
          child: const Icon(Icons.add_a_photo),
        ),
      ],
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker Example'),
      ),
      body: Center(
        child: ImagePickerWidget(
          onImagePicked: (XFile? image) {
            // Handle the picked image as you want
            print('Image picked: ${image?.path}');
          },
        ),
      ),
    );
  }
}
