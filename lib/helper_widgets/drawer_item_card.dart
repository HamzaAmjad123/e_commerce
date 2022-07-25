import 'package:flutter/material.dart';


class DrawerItemCard extends StatelessWidget {
  const DrawerItemCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.home),
      title: Text("Asad"),

    );
  }
}
