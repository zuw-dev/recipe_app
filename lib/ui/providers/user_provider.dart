// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:recipe_app/data/model/user_model.dart';
import 'package:recipe_app/data/services/user_services.dart';

class UserProvider with ChangeNotifier {
  UserModel? _user = UserModel(saved: [], posts: []);
  String? _name;

  UserModel get getUser => _user!;
  String? get getName => _name;

  Future postUser(UserModel user, String uid) async {
    _user = await UserServices().postUser(user, uid);
    notifyListeners();
  }

  Future setUser(String uid) async {
    _user = await UserServices().getUserById(uid);
    notifyListeners();
  }

  setName(String i) {
    _name = i;
    notifyListeners();
  }
}
