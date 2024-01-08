import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:recipe_app/ui/pages/sign_in_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'assets/images/splash.gif',
      nextScreen: const SigninPage(),
      splashIconSize: 200,
      backgroundColor: Colors.black,
      pageTransitionType: PageTransitionType.fade,
    );
  }
}
