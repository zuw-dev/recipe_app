import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/ui/pages/my_post_page.dart';
import 'package:recipe_app/ui/providers/user_provider.dart';

class CustomGrid extends StatelessWidget {
  const CustomGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    return userProvider.getUser.posts != null
        ? GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 2.0,
              mainAxisSpacing: 2.0,
            ),
            itemCount: userProvider.getUser.posts!.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          MyPostPage(post: userProvider.getUser.posts![index]),
                    ),
                  );
                },
                child: Image.network(
                  userProvider.getUser.posts![index].imgUrl!,
                  fit: BoxFit.cover,
                ),
              );
            },
          )
        : const SizedBox.shrink();
  }
}
