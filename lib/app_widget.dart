import 'package:flutter/material.dart';
import 'package:migrationflutter2/modules/login/login_page.dart';
import 'package:migrationflutter2/modules/splash/splash_page.dart';

import 'modules/home/home_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter migration 2',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => SplashPage(),
        "/login": (context) => LoginPage(),
        "/home": (context) => HomePage(
              user: ModalRoute.of(context).settings.arguments,
            )
      },
    );
  }
}
