import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/ui/providers/user_provider.dart';
import '/ui/providers/recipe_provider.dart';

import '../widgets/new_dish_card.dart';
import '../widgets/dishes_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    RecipeProvider recipeProvider = Provider.of<RecipeProvider>(context);
    UserProvider userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello, ${userProvider.getName}",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Text("What would you like to cook today?")
                  ],
                ),
                const SizedBox(
                  width: 30,
                ),
                const CircleAvatar(
                  backgroundImage: AssetImage("assets/images/avatar.png"),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: TextField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      labelText: "What recipe would you like to search?",
                      labelStyle: TextStyle(fontSize: 14),
                    ),
                    onSubmitted: (value) async {
                      recipeProvider.setComplexRecipe(value);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 0,
              child: SizedBox(
                height: 290,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: recipeProvider.getRecipes.length,
                  itemBuilder: (context, index) {
                    return DishesCard(
                      recipe: recipeProvider.getRecipes[index],
                    );
                  },
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 200, bottom: 2),
              child: Text(
                "New Recipes",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: recipeProvider.getRecentRecipes.length,
                  itemBuilder: (context, index) {
                    return NewDishCard(
                        recipe: recipeProvider.getRecentRecipes[index]);
                  }),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
