import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
            : Image.file(
                File(_image!.path),
                width: 250,
                fit: BoxFit.cover,
              ),
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
