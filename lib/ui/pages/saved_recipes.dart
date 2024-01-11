import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/data/model/recipe_model.dart';
import 'package:recipe_app/ui/providers/user_provider.dart';
import 'package:recipe_app/ui/widgets/new_dish_card.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 140),
              child: Title(
                  color: Colors.black,
                  child: const Text(
                    "Saved Recipes",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  )),
            ),
            userProvider.getUser.saved != null
                ? Expanded(
                    child: ListView.builder(
                      itemCount: userProvider.getUser.saved!.length,
                      itemBuilder: (context, index) {
                        return NewDishCard(
                          recipe: Recipe(
                            id: userProvider.getUser.saved![index].id,
                            title: userProvider.getUser.saved![index].title,
                            image: userProvider.getUser.saved![index].image,
                            imageType:
                                userProvider.getUser.saved![index].imageType,
                          ),
                        );
                      },
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
