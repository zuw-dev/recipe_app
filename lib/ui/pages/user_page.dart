import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/ui/providers/page_provider.dart';
import 'package:recipe_app/ui/widgets/custom_grid.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});
  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider = Provider.of<PageProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: const Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/images/avatar.png"),
              ),
              Column(
                children: [
                  Text(
                    "Recipe",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "1",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Followers",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "2.5M",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Following",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "31",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  "Kaan Altmışdört",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
                width: 10,
              ),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Text(
                      "Chef",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Text("Love to hunt demons for life"),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: CustomGrid(
              imageUrls: [
                'https://picsum.photos/200',
                'https://picsum.photos/200',
                'https://picsum.photos/200',
                'https://picsum.photos/200',
                'https://picsum.photos/200',
                'https://picsum.photos/200',
                'https://picsum.photos/200',
                'https://picsum.photos/200',
                'https://picsum.photos/200',
                'https://picsum.photos/200',
                'https://picsum.photos/200',
                'https://picsum.photos/200',
                'https://picsum.photos/200',
                'https://picsum.photos/200',
                'https://picsum.photos/200',
              ],
            ),
          ),
        ],
      ),
    );
  }
}
