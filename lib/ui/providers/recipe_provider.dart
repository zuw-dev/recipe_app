// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:recipe_app/data/model/recipe_info_model.dart';
import 'package:recipe_app/data/model/recipe_model.dart';
import 'package:recipe_app/data/services/recipe_services.dart';

class RecipeProvider with ChangeNotifier {
  List<Recipe> _recipes = [];
  List<Recipe> _recentRecipes = [];
  RecipeInfo _recipeInfo = RecipeInfo();

  List<Recipe> get getRecipes => _recipes;
  List<Recipe> get getRecentRecipes => _recentRecipes;
  RecipeInfo get getRecipeInfo => _recipeInfo;

  Future setComplexRecipe(String query) async {
    _recipes = await RecipeServices().getComplexRecipe(query);
    notifyListeners();
  }

  Future setRecentRecipes(String query) async {
    _recentRecipes.addAll(await RecipeServices().getComplexRecipe(query));
    notifyListeners();
  }

  Future setRecipeInfo(String id) async {
    _recipeInfo = await RecipeServices().getRecipeInfo(id);
    notifyListeners();
  }
}
