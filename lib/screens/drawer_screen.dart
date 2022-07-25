import 'package:e_commerce/configs/color.dart';
import 'package:e_commerce/helper_widgets/drawer_item_card.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: whiteColor,
      width: MediaQuery.of(context).size.width/1.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DrawerItemCard(

          )
        ],
      ),
    );
  }
}
