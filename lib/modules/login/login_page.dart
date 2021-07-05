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
        Navigator.pushReplacementNamed(context, "/home",
            arguments: controller.user);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.png",
              width: MediaQuery.of(context).size.width * 0.9,
            ),
            Form(
                key: formKey,
                child: Column(
                  children: [
                    AnimatedCard(
                      direction: AnimatedCardDirection.right,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: TextFormField(
                          decoration: InputDecoration(labelText: "Email"),
                          onChanged: (value) => email = value,
                          validator: (value) =>
                              value.contains("@") ? null : "Email inválido!",
                        ),
                      ),
                    ),
                    AnimatedCard(
                      direction: AnimatedCardDirection.left,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: TextFormField(
                          decoration: InputDecoration(labelText: "Password"),
                          onChanged: (value) => password = value,
                          validator: (value) =>
                              value.isEmpty || value.length < 6
                                  ? "Senha inválida!"
                                  : null,
                        ),
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: 24,
            ),
            AnimatedCard(
              direction: AnimatedCardDirection.bottom,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Expanded(
                      child: RaisedButton(
                          color: Colors.purple,
                          colorBrightness: Brightness.dark,
                          child: Text("Entrar"),
                          onPressed: () {
                            if (validate()) {
                              controller.login(
                                  email: email, password: password);
                            }
                          }),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
