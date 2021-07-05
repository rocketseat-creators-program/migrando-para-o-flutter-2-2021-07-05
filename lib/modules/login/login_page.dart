import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:migrationflutter2/modules/login/login_controller.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginController();
  final formKey = GlobalKey<FormState>();
  String email;
  String password;

  bool validate() {
    final form = formKey.currentState;
    return form.validate();
  }

  @override
  void initState() {
    controller.userNotifier.addListener(() {
      if (controller.user != null) {
        Navigator.pushNamed(context, "/home", arguments: controller.user);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Form(
              child: Column(
            children: [
              AnimatedCard(
                direction: AnimatedCardDirection.right,
                child: TextFormField(
                  decoration: InputDecoration(labelText: "Email"),
                  onChanged: (value) => email = value,
                ),
              ),
              AnimatedCard(
                direction: AnimatedCardDirection.left,
                child: TextFormField(
                  decoration: InputDecoration(labelText: "Password"),
                  onChanged: (value) => password = value,
                ),
              ),
            ],
          )),
          AnimatedCard(
            direction: AnimatedCardDirection.bottom,
            child: RaisedButton(
                child: Text("Entrar"),
                onPressed: () {
                  if (validate()) {
                    controller.login(email: email, password: password);
                  }
                }),
          )
        ],
      ),
    );
  }
}
