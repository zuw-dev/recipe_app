import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/ui/pages/home_page.dart';
import 'package:recipe_app/ui/pages/saved_recipes.dart';
import 'package:recipe_app/ui/pages/sign_in_page.dart';
import 'package:recipe_app/ui/pages/user_page.dart';
import 'package:recipe_app/ui/providers/page_provider.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);

  static List<Widget> _pages = <Widget>[
    HomePage(),
    SavedPage(),
    SigninPage(),
    UserPage(),
  ];
  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider = Provider.of<PageProvider>(context);

    return Scaffold(
      body: _pages[pageProvider.page],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: const [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: LineIcons.heart,
                  text: 'Likes',
                ),
                GButton(
                  icon: LineIcons.search,
                  text: 'Search',
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'Profile',
                ),
              ],
              selectedIndex: pageProvider.page,
              onTabChange: (index) {
                pageProvider.setPage(index);
              },
            ),
          ),
        ),
      ),
    );
  }
}
