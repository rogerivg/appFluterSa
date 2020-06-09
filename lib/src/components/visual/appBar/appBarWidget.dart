import 'package:flutter/material.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget(this.title);

  @override
  Size get preferredSize => Size.fromHeight(100); // set height of your choice

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromRGBO(195, 16, 16, 1),
      //title: Text("App"),
      title: Text(title),
      actions: <Widget>[
        Image.asset('icons/accenture.png', height: 20, width: 20),
      ],
    );
  }
}