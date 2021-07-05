import 'package:flutter/material.dart';

import 'package:migrationflutter2/shared/models/user_model.dart';

class HomePage extends StatefulWidget {
  final UserModel user;
  HomePage({
    Key key,
    @required this.user,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
                accountName: Text(widget.user.name),
                accountEmail: Text(
                  widget.user.email,
                ))
          ],
        ),
      ),
    );
  }
}
