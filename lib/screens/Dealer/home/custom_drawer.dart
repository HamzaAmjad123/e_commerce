/*
 * File name: custom_drawer.dart
 * Last modified: 2022.02.11 at 02:22:41
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2022
 */
import 'package:e_commerce/configs/color.dart';
import 'package:e_commerce/configs/text_style.dart';
import 'package:e_commerce/helper_services/navigation_services.dart';
import 'package:e_commerce/provider/user_data_provider.dart';
import 'package:e_commerce/screens/Dealer/home/home_screen.dart';
import 'package:e_commerce/screens/Dealer/order/order_list_screen.dart';
import 'package:e_commerce/screens/Auth/login_screen.dart';
import 'package:e_commerce/screens/Dealer/payment/send_amount_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import '../../../helper_widgets/drawer_item_card.dart';
import '../../../model/user_model.dart';
import '../generate_order/generate_order_screen.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    String role=Provider.of<UserDataProvider>(context, listen: false).user!.userRoles![0];
    UserModel usermodels = UserModel.fromJson(box.read('user'));
    String name=usermodels.name![0];

    return Drawer(
      child: ListView(children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: CircleAvatar(
                  maxRadius: 30,
                  backgroundColor: bgColor,
                  child: Center(
                    child: Text(usermodels.name![0],style: barStyle),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(usermodels.name!, style: titleStyle),
              SizedBox(height: 3),
              Text(usermodels.email!, style: oderNoStyle),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.black,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Text("0 B",style: cashStyle,),
              //     SizedBox(width: 5,),
              //     Text("of 20 GB used",style: oderNoStyle,),
              //   ],
              // ),
              // Divider(
              //   color: Colors.black,
              // ),
            ],
          ),
        ),
        role=="Dealer"?Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            DrawerLinkWidget(
              icon: Icons.home_outlined,
              text: "Home",
              onTap: () {
                Navigator.of(context);
                NavigationServices.goNextAndDoNotKeepHistory(
                    context: context,
                    widget: HomeScreen(
                        tenatId:
                        Provider.of<UserDataProvider>(context, listen: false)
                            .user!
                            .user!
                            .tenantId!));
                setState(() {});
              },
            ),
            DrawerLinkWidget(
              icon: Icons.folder_special_outlined,
              text: " Generate Order",
              onTap: () {
                Navigator.of(context);
                NavigationServices.goNextAndKeepHistory(
                    context: context, widget: GenerateOrderScreen());
                setState(() {});
              },
            ),
            DrawerLinkWidget(
              icon: Icons.assignment_outlined,
              text: "Pending Orders",
              onTap: () {
                NavigationServices.goNextAndKeepHistory(
                    context: context, widget: OrderListScreen());
                setState(() {});
              },
            ),
          ],
        ):Container(),
        DrawerLinkWidget(
          icon: Icons.account_balance_wallet_outlined,
          text: "Send Cash",
          onTap: () {
            role=="Dealer"?
                NavigationServices.goNextAndKeepHistory(context: context, widget: SendPaymentScreen()):
                print("noithing");

          },
        ),
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
            Navigator.of(context);
            await box.remove('user');
            NavigationServices.goNextAndDoNotKeepHistory(
                context: context, widget: LoginScreen());
          },
        ),
      ]),

      // } else {
      //   return SizedBox(height: 0);
      // }

      // if (Get.find<SettingsService>().setting.value.enableVersion)
      //   ListTile(
      //     dense: true,
      //     title: Text(
      //       "Version".tr + " " + Get.find<SettingsService>().setting.value.appVersion,
      //       style: Get.textTheme.caption,
      //     ),
      //     trailing: Icon(
      //       Icons.remove,
      //       color: Get.theme.focusColor.withOpacity(0.3),
      //     ),
      //   )
    );
  }
}
