import 'package:flutter/material.dart';
import 'package:migrationflutter2/shared/models/user_model.dart';

class LoginController {
  final userNotifier = ValueNotifier<UserModel>(null);
  UserModel get user => userNotifier.value;
  set user(UserModel value) => userNotifier.value = value;

  void login({String email, String password}) {
    if (email == "contato@gabul.dev" && password == "rocketseat") {
      user = UserModel(name: "Gabul Dev", email: "contato@gabul.dev");
    } else {
      user = null;
    }
  }
}
