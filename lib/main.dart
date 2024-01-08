import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/ui/pages/splash_page.dart';
import 'ui/providers/page_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ListenableProvider(
        create: (_) => PageProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashPage(),
    );
  }
}
