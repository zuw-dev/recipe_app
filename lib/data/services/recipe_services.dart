import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:recipe_app/data/constants/constants.dart';
import 'package:recipe_app/data/model/recipe_info_model.dart';
import 'package:recipe_app/data/model/recipe_model.dart';

class RecipeServices {
  Uri getComplexUrl(String query) =>
      Uri.parse("$complexSearch?query=$query&apiKey=$apiKey");
  Uri getRecipeInfoUrl(String id) => Uri.parse(
      "$recipeInfo$id/information?includeNutrition=false&apiKey=$apiKey");

  Future<List<Recipe>> getComplexRecipe(String query) async {
    http.Response response = await http.get(getComplexUrl(query));

    List<Recipe> recipes = [];
    var data = jsonDecode(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      for (var elem in data["results"]) {
        Recipe tmp = Recipe.fromMap(elem);
        recipes.add(tmp);
      }
    }
    return recipes;
  }

  Future<RecipeInfo> getRecipeInfo(String id) async {
    http.Response response = await http.get(getRecipeInfoUrl(id));

    var data = jsonDecode(response.body);
    RecipeInfo recipeInfo = RecipeInfo();
    if (response.statusCode >= 200 && response.statusCode < 300) {
      recipeInfo = RecipeInfo.fromMap(data);
    }
    return recipeInfo;
  }
}
