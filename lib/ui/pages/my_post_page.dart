import 'package:flutter/material.dart';
import 'package:recipe_app/data/model/post_model.dart';

class MyPostPage extends StatelessWidget {
  const MyPostPage({super.key, required this.post});
  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Image.network(
              post.imgUrl!,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.4,
            ),
            const SizedBox(
              height: 20,
            ),
            Text("${post.title!} "),
            const SizedBox(
              height: 20,
            ),
            Text("${post.instructions!} "),
          ],
        ),
      ),
    );
  }
}
