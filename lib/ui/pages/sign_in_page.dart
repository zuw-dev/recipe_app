// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/ui/pages/main_page.dart';
import 'package:recipe_app/ui/providers/user_provider.dart';

class SigninPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SigninPage({super.key});

  Future<void> _signIn(BuildContext context) async {
    UserProvider _userProvider =
        Provider.of<UserProvider>(context, listen: false);
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      _userProvider.setName(userCredential.user!.displayName!);
      await _userProvider.setUser(userCredential.user!.uid);
      print("Signed in as: ${userCredential.user?.email}");
      print("Signed in as: ${userCredential.user}");
      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return MainPage(profileName: userCredential.user!.displayName!);
          },
        ),
      );
    } on FirebaseAuthException catch (e) {
      print("Error: $e");
      // Handle specific errors if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ... (your existing UI code)

              // Email TextField
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "Email", // Add a label for the email input
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                  // ... (your existing settings)
                ),
              ),

              // Password TextField
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Password", // Add a label for the password input
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  ),
                  // ... (your existing settings)
                ),
              ),

              // Login Button
              ElevatedButton(
                onPressed: () => _signIn(context),
                child: const Text('Login'),
              ),

              // ... (your existing UI code)
            ],
          ),
        ),
      ),
    );
  }
}

/* import 'package:flutter/material.dart';
import 'package:recipe_app/ui/pages/main_page.dart';
import 'package:recipe_app/ui/pages/sign_up_page.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 80,
              ),
              const Text(
                "Hello,",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Welcome Back!",
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              //TODO Email
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    labelText: "Email",
                    hintText: "Enter your email",
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              //TODO Password
              const SizedBox(height: 30),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    labelText: "Password",
                    hintText: "Enter your password",
                  ),
                  obscureText: true,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //TODO Login Button
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainPage(),
                    ),
                  );
                },
                child: const Text('Login'),
              ),
              const SizedBox(
                height: 20,
              ),
              //TODO Forgot Password Button
              TextButton(
                onPressed: () {},
                child: const Text("Forgot Password"),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Sign up",
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
 */