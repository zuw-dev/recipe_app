import 'package:flutter/material.dart';
import 'package:recipe_app/data/model/recipe_info_model.dart';

class DishPage extends StatelessWidget {
  const DishPage({super.key, required this.recipeInfo});
  final RecipeInfo recipeInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(recipeInfo.image!),
              Text(recipeInfo.title!),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const Center(child: Text("Malzemeler"));
                  },
                ),
              ),
              Text(
                recipeInfo.instructions!,
                style: const TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
