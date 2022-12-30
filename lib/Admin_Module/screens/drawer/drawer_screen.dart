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
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          DrawerLinkWidget(
            icon: Icons.logout,
            isLogout: true,
            text: "Logout",
            onTap: () async {
              SharedPreferences pref=await SharedPreferences.getInstance();
              pref.clear();
              // await LocalStorageServices().saveUser(false);
              NavigationServices.goNextAndDoNotKeepHistory(
                  context: context, widget: LoginScreen());
            },
          ),
        ])
      ],
    );
  }
}
