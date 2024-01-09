import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/image_picker_widget.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Tarifiniz için görsel seçiniz",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              ImagePickerWidget(
                onImagePicked: (XFile? image) {
                  if (image != null) {
                    print('Image picked: ${image.path}');
                  } else {
                    print("No Image Selected");
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    hintText: 'Tarif adını giriniz',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    hintText: 'Tarifi giriniz',
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Tarifi paylaş"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/* import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recipe_app/ui/widgets/image_picker.dart';

import '../widgets/image_picker_widget.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Tarifiniz için görsel seçiniz",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            ImagePickerWidget(
              onImagePicked: (XFile? image) {
                if (image != null) {
                  print('Image picked: ${image.path}');
                } else {
                  print("No Image Selected");
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Tarif adını giriniz',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Tarifi giriniz',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Tarifi paylaş"),
            ),
          ],
        ),
      ),
    );
  }
}

 */