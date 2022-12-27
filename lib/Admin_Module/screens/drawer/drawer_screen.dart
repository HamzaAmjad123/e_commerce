import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  String text = "Initial Text";
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        DrawerHeader(child: Container()),
        Column(children: <Widget>[
          ListTile(
              leading: Icon(Icons.home),
              onTap: () {
                setState(() {
                  text = "Stock";
                });
              }),
          ListTile(
              leading: Icon(Icons.save),
              onTap: () {
                setState(() {
                  text = "Orders";
                });
              }),
          ListTile(
              leading: Icon(Icons.star),
              onTap: () {
                setState(() {
                  text = "Account";
                });
              }),
        ])
      ],
    );
  }
}
