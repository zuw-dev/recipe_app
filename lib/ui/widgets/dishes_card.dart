import 'package:flutter/material.dart';
import 'package:recipe_app/ui/pages/dish_page.dart';

class DishesCard extends StatelessWidget {
  const DishesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DishPage(),
          ),
        );
      },
      child: SizedBox(
        width: 250,
        child: Card(
          color: Colors.black,
          elevation: 5.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/images/salata1.png',
                fit: BoxFit.cover,
                width: 150,
                height: 150.0,
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Akdeniz Salatası',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'More details or other widgets can be added here.',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
