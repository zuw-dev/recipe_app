import 'package:flutter/material.dart';

class PageProvider with ChangeNotifier {
  int page = 0;
  List<String> tabs = ["Recipes", "Videos", "Tag"];

  setPage(int i) {
    page = i;
    notifyListeners();
  }
}
