/*
 * File name: custom_drawer.dart
 * Last modified: 2022.02.11 at 02:22:41
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2022
 */
import 'package:e_commerce/configs/color.dart';
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

    return Drawer(
      child: ListView(children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 100,
          color: bgColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text("Welcome".tr, style: Get.textTheme.bodyText1),
              // SizedBox(height: 5),
              // Text("The Best Service Providing App".tr, style: Get.textTheme.bodyText1),
              SizedBox(
                height: 15,
              ),
              Text(usermodels.name!, style: TextStyle(color: Colors.white)),
              SizedBox(height: 3),
              Text(usermodels.email!, style: TextStyle(color: Colors.white)),
            ],
          ),
        ),

        // Container(
        //   padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        //   decoration: BoxDecoration(
        //     color: bgColor,
        //     // color: Theme.of(context).hintColor.withOpacity(0.1),
        //   ),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Text("Welcome".tr, style: Get.textTheme.headline5!.merge(TextStyle(color: Get.theme.colorScheme.secondary))),
        //       SizedBox(height: 5),
        //       Text("Login account or create new one for free".tr, style: Get.textTheme.bodyText1),
        //       // Wrap(
        //       //   spacing: 10,
        //       //   children: <Widget>[
        //       //     MaterialButton(
        //       //       onPressed: () {
        //       //        //Loginpage navigation
        //       //       },
        //       //       color: Get.theme.colorScheme.secondary,
        //       //       height: 40,
        //       //       elevation: 0,
        //       //       child: Wrap(
        //       //         runAlignment: WrapAlignment.center,
        //       //         crossAxisAlignment: WrapCrossAlignment.center,
        //       //         spacing: 9,
        //       //         children: [
        //       //           Icon(Icons.exit_to_app_outlined, color: whiteColor, size: 24),
        //       //           Text(
        //       //             "Login",
        //       //             style: Get.textTheme.subtitle1!.merge(TextStyle(color: whiteColor)),
        //       //           ),
        //       //         ],
        //       //       ),
        //       //       shape: StadiumBorder(),
        //       //     ),
        //       //     MaterialButton(
        //       //       color: Get.theme.focusColor.withOpacity(0.2),
        //       //       height: 40,
        //       //       elevation: 0,
        //       //       onPressed: () {
        //       //       // Register page navigation
        //       //       },
        //       //       child: Wrap(
        //       //         runAlignment: WrapAlignment.center,
        //       //         crossAxisAlignment: WrapCrossAlignment.center,
        //       //         spacing: 9,
        //       //         children: [
        //       //           Icon(Icons.person_add_outlined, color: whiteColor, size: 24),
        //       //           Text(
        //       //             "Register".tr,
        //       //             style: Get.textTheme.subtitle1!.merge(TextStyle(color: whiteColor)),
        //       //           ),
        //       //         ],
        //       //       ),
        //       //       shape: StadiumBorder(),
        //       //     ),
        //       //   ],
        //       // ),
        //     ],
        //   ),
        // ),
        // UserAccountsDrawerHeader(
        //   decoration: BoxDecoration(
        //     color: bgColor,
        //   ),
        //   accountName: Text(
        //     usermodels.name!,
        //     style: TextStyle(color: Colors.black),
        //   ),
        //   accountEmail: Text(
        //     usermodels.email!,
        //     style: TextStyle(color: Colors.black),
        //   ),
        //   currentAccountPicture: Stack(
        //     children: [
        //       SizedBox(
        //         width: 80,
        //         height: 80,
        //         child: ClipRRect(
        //           borderRadius: BorderRadius.all(Radius.circular(80)),
        //           child: usermodels.imageUrl==""?Image.asset(Images.placeHolder,
        //             fit: BoxFit.cover,
        //             width: double.infinity,
        //             height: 80,
        //           ):Image.network(usermodels.imageUrl!,height: 80,
        //             width: double.infinity,
        //             fit: BoxFit.cover,)
        //           // CachedNetworkImage(
        //           //   height: 80,
        //           //   width: double.infinity,
        //           //   fit: BoxFit.cover,
        //           //   imageUrl: usermodels.imageUrl!,
        //           //   placeholder: (context, url) => Image.asset(Images.loadingHolder,
        //           //     fit: BoxFit.cover,
        //           //     width: double.infinity,
        //           //     height: 80,
        //           //   ),
        //           //   errorWidget: (context, url, error) => Icon(Icons.error_outline),
        //           // ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        role=="Dealer"?Column(
          children: [
            SizedBox(height: 20),
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
        ):Container(
          child: Text("Rider"),
        ),

        // DrawerLinkWidget(
        //   icon: Icons.notifications_none_outlined,
        //   text: "Notifications",
        //   onTap: () {
        //
        //   },
        // ),

        ListTile(
          dense: true,
          title: Text(
            "Application preferences".tr,
            style: Get.textTheme.caption,
          ),
          trailing: Icon(
            Icons.remove,
            color: Get.theme.focusColor.withOpacity(0.3),
          ),
        ),
        DrawerLinkWidget(
          icon: Icons.account_balance_wallet_outlined,
          text: "Payment History",
          onTap: () {
            role=="Dealer"?
                NavigationServices.goNextAndKeepHistory(context: context, widget: SendPaymentScreen()):
                print("noithing");

          },
        ),
        // DrawerLinkWidget(
        //   icon: Icons.person_outline,
        //   text: "Account",
        //   onTap: () async {
        //     Get.back();
        //
        //   },
        // ),
        // DrawerLinkWidget(
        //   icon: Icons.settings_outlined,
        //   text: "Settings",
        //   onTap: () async {
        //
        //   },
        // ),
        ListTile(
          dense: true,
          title: Text(
            "Account",
            style: Get.textTheme.caption,
          ),
          trailing: Icon(
            Icons.remove,
            color: Get.theme.focusColor.withOpacity(0.3),
          ),
        ),
        // DrawerLinkWidget(
        //   icon: Icons.help_outline,
        //   text: "Help & FAQ",
        //   onTap: () async {
        //   },
        // ),
        // CustomPageDrawerLinkWidget(),

        DrawerLinkWidget(
          icon: Icons.logout,
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
