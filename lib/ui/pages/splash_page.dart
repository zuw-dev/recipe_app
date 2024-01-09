import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/ui/pages/sign_up_page.dart';
import 'package:recipe_app/ui/providers/recipe_provider.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    RecipeProvider recipeProvider = Provider.of<RecipeProvider>(context);
    return AnimatedSplashScreen.withScreenFunction(
      splash: 'assets/images/splash.gif',
      splashIconSize: 200,
      backgroundColor: Colors.black,
      pageTransitionType: PageTransitionType.fade,
      screenFunction: () async {
        await recipeProvider.setComplexRecipe("pizza");
        await recipeProvider.setRecentRecipes("salad");
        await recipeProvider.setRecentRecipes("beef");
        recipeProvider.getRecentRecipes.shuffle();
        return const SignupPage();
      },
    );
    // return AnimatedSplashScreen(
    //   splash: 'assets/images/splash.gif',
    //   nextScreen: const SignupPage(),
    //   splashIconSize: 200,
    //   backgroundColor: Colors.black,
    //   pageTransitionType: PageTransitionType.fade,
    // );
  }
}
