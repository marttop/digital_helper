import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String username;
  HomePage({this.username});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Bonjour~$username",
        )
      ),
    );
  }
}