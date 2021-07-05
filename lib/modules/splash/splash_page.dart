import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2))
        .then((value) => Navigator.pushNamed(context, "/login"));
    return Scaffold(
      backgroundColor: Colors.purple,
      body: AnimatedCard(
          direction: AnimatedCardDirection.top,
          child: Image.asset(
            "assets/images/logo.png",
            width: MediaQuery.of(context).size.width * 0.9,
          )),
    );
  }
}
