import 'package:flutter/material.dart';

class SavedDishCard extends StatelessWidget {
  const SavedDishCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550, // Set a fixed height for the container
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 15,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.black, // Set the background color for each card
            child: Row(
              children: [
                const Column(
                  children: [
                    SizedBox(
                      height: 25,
                    ), // Adjusted height for better centering
                    Text(
                      "Etli yemek",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ), // Set text color
                    SizedBox(
                        height: 25), // Adjusted height for better centering
                    Icon(Icons.panorama_fish_eye_outlined,
                        size: 15, color: Colors.white),
                  ],
                ),
                SizedBox(
                  width: 100,
                  child: Image.asset("assets/images/salata1.png"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
