import 'package:flutter/material.dart';
import 'package:recipe_app/ui/widgets/saved_dishes_card.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 140),
              child: Title(
                  color: Colors.black,
                  child: Text(
                    "Recipe Saved",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: const TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        labelText: "Ne Tarifi Aramak İstersiniz?"),
                  ),
                ),
              ],
            ),
            SavedDishCard(),
          ],
        ),
      ),
    );
  }
}
