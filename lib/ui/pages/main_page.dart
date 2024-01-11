import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import '/ui/pages/home_page.dart';
import '/ui/pages/post_page.dart';
import '/ui/pages/saved_recipes.dart';
import '/ui/pages/user_page.dart';
import '/ui/providers/page_provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final List<Widget> _pages = <Widget>[
    const HomePage(),
    const SavedPage(),
    const PostPage(),
    const UserPage(),
  ];

  @override
  void initState() {
    Navigator.popUntil(context, (route) => route.isFirst);
    super.initState();
  }

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
                  icon: LineIcons.bookmark,
                  text: 'Saved',
                ),
                GButton(
                  icon: LineIcons.plus,
                  text: 'Post',
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
