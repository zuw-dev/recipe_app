import 'package:flutter/material.dart';

import '../widgets/dish_new_card.dart';
import '../widgets/dishes_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Merhaba Kaan",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text("Bugün ne yemek yapmak istersin?")
                  ],
                ),
                SizedBox(
                  width: 30,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/avatar.png"),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
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
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.settings,
                    )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 0,
              child: SizedBox(
                height: 290,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const DishesCard();
                  },
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 200),
              child: Text(
                "New Recipes",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            const NewDishCard(),
          ],
        ),
      ),
    );
  }
}
