import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:flutter_bloc_security/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class DataRepository {

  static const String PREF_USER="prefUser";

  Future<User> getUser() async {

    final SharedPreferences preferences = await SharedPreferences.getInstance();

    User user;

    String value = preferences.get(PREF_USER);
    if (value != null) {
      user = User.fromJson(jsonDecode(value));
    }

    return user;

  }

  Future<void> setUser(User user) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    String value;
    if (user != null) {
      Map map = user.toJson();
      value = jsonEncode(map);
    }

    await preferences.setString(PREF_USER, value);

  }

}