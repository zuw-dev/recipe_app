import 'package:flutter/material.dart';

class NewDishCard extends StatelessWidget {
  const NewDishCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150, // Set a fixed height for the container
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.black, // Set the background color for each card
            child: Row(
              children: [
                Container(
                  child: const Column(
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
