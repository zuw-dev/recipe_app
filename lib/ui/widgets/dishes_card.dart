// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/data/model/recipe_model.dart';
import 'package:recipe_app/ui/pages/dish_page.dart';
import 'package:recipe_app/ui/providers/recipe_provider.dart';

class DishesCard extends StatelessWidget {
  const DishesCard({super.key, required this.recipe});
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
      child: Padding(
        padding: const EdgeInsets.only(left: 5.0, right: 5, top: 5, bottom: 10),
        child: Container(
          width: 205,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 25,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  recipe.image!,
                  fit: BoxFit.cover,
                  width: 150,
                  height: 150,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  truncateText(recipe.title!, 24),
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
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
