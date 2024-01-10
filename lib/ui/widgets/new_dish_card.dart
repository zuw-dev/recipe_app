// ignore_for_file: use_build_context_synchronously
import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/data/model/recipe_model.dart';
import 'package:recipe_app/ui/providers/recipe_provider.dart';

import '../pages/dish_page.dart';

class NewDishCard extends StatelessWidget {
  const NewDishCard({
    super.key,
    required this.recipe,
  });
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    RecipeProvider recipeProvider = Provider.of<RecipeProvider>(context);
    return GestureDetector(
      onTap: () async {
        await recipeProvider.setRecipeInfo(recipe.id.toString());
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DishPage(
              recipeInfo: recipeProvider.getRecipeInfo,
            ),
          ),
        );
      },
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.95,
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          truncateText(recipe.title!, 23),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: List.generate(
                            Random().nextInt(5) + 1,
                            (index) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.90,
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.network(
                                  Faker().image.image(
                                        width: 500,
                                        height: 500,
                                        keywords: ['selfie', 'person'],
                                        random: true,
                                      ),
                                  width: 35,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                Faker().person.name(),
                                style: const TextStyle(color: Colors.grey),
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.watch_later_outlined,
                                color: Colors.grey,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                "${(Random().nextInt(100) + 20)} mins",
                                style: const TextStyle(color: Colors.grey),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.02,
              left: MediaQuery.of(context).size.width * 0.71,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                recipe.image!,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text; // Return the original text if it's shorter than or equal to the maxLength
    } else {
      return '${text.substring(0, maxLength)}...'; // Truncate the text and add "..."
    }
  }
}
