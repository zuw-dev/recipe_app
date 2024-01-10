// ignore_for_file: avoid_unnecessary_containers

import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/data/model/post_model.dart';
import 'package:recipe_app/ui/providers/user_provider.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  late TextEditingController titleController;
  late TextEditingController instructionsController;

  String? imgUrl;

  FirebaseStorage storage = FirebaseStorage.instance;

  File? _photo;
  final ImagePicker _picker = ImagePicker();

  Future imgFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _photo = File(pickedFile.path);
      } else {
        print('Resim seçilmedi.');
      }
    });
  }

  Future uploadFile() async {
    if (_photo == null) return;
    final fileName = basename(_photo!.path);
    final destination = 'files/$fileName';

    try {
      final ref = FirebaseStorage.instance.ref(destination).child('file/');
      await ref.putFile(_photo!);
      imgUrl = await ref.getDownloadURL();
      _photo = null;
    } catch (e) {
      print('Bir hata oluştu! \n$e');
    }
  }

  @override
  void initState() {
    titleController = TextEditingController();
    instructionsController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text(
          "Add Recipe",
          style: GoogleFonts.lato(
            fontSize: 40,
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            GestureDetector(
              onTap: () {
                imgFromGallery();
              },
              child: _photo != null
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Image.file(
                        _photo!,
                        fit: BoxFit.contain,
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.grey[800],
                      ),
                    ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: TextField(
                controller: titleController,
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  hintText: "Recipe Name",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(width: 1, color: Colors.grey),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(width: 1, color: Colors.grey),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: TextField(
                controller: instructionsController,
                cursorColor: Colors.grey,
                keyboardType: TextInputType.multiline,
                maxLines: 6,
                decoration: InputDecoration(
                  hintText: "Recipe Instructions",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(width: 1, color: Colors.grey),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(width: 1, color: Colors.grey),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            ElevatedButton(
                onPressed: () async {
                  await uploadFile();
                  userProvider.getUser.posts!.add(
                    PostModel(
                      imgUrl: imgUrl!,
                      title: titleController.text,
                      instructions: instructionsController.text,
                    ),
                  );
                  await userProvider.postUser(
                      userProvider.getUser, userProvider.getUser.id!);
                  await userProvider.setUser(userProvider.getUser.id!);
                  titleController.text = "";
                  instructionsController.text = "";
                },
                child: const Text("Add")),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(
                //   height: MediaQuery.of(context).size.height * 0.065,
                //   child: CustomButton(
                //     text: "Ürün Ekle",
                //     bgColor: Colors.black,
                //     onPressed: () async {
                //       await uploadFile();
                //       await productProvider.addProduct(
                //         Product(
                //           img: imgUrl!,
                //           name: productName.text,
                //           desc: productDesc.text,
                //           price: productPrice.text,
                //           category: categoryProvider
                //               .undoCategoryName(categoryProvider.getValue),
                //           quantity: productQty.text,
                //           isFavorite: false,
                //         ),
                //         categoryProvider
                //             .undoCategoryName(categoryProvider.getValue),
                //       );

                //       productName.text = "";
                //       productDesc.text = "";
                //       productPrice.text = "";
                //       productQty.text = "";
                //     },
                //   ),
                // )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
