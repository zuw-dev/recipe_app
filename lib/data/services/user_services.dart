// ignore_for_file: body_might_complete_normally_nullable

import 'package:http/http.dart' as http;
import '/data/constants/constants.dart';
import '/data/model/user_model.dart';

class UserServices {
  Uri getUrl(String endpoint) => Uri.parse("$baseUrl$endpoint.json");

  Future<UserModel?> postUser(UserModel user, String uid) async {
    http.Response response = await http.put(
      getUrl("users/$uid"),
      body: user.toJson(),
      headers: {'Content-Type': "application/json"},
    );
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return user;
    }
  }

  Future<UserModel?> getUserById(String uid) async {
    http.Response response = await http.get(getUrl("users/$uid"));
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var data = response.body;

      UserModel user = UserModel.fromJson(data);
      return user;
    }
  }
}
