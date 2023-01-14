import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../helper_services/navigation_services.dart';
import '../../../helper_widgets/drawer_item_card.dart';
import '../../../screens/Auth/login_screen.dart';

class AdminDrawer extends StatefulWidget {
  const AdminDrawer({super.key});

  @override
  _AdminDrawerState createState() => _AdminDrawerState();
}

class _AdminDrawerState extends State<AdminDrawer> {
  String text = "Initial Text";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        Column(children: <Widget>[
          ListTile(
            title:Text("Stock") ,
              leading: Icon(Icons.home),
              onTap: () {
                setState(() {
                  text = "Stock";
                });
              }),
          ListTile(
            title: Text("Orders"),
              leading: Icon(Icons.save),
              onTap: () {
                setState(() {
                  text = "Orders";
                });
              }),
          ListTile(
            title: Text('Account'),
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
