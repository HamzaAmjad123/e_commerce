/*
 * File name: custom_drawer.dart
 * Last modified: 2022.02.11 at 02:22:41
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2022
 */

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/configs/color.dart';

import 'package:e_commerce/provider/user_data_provider.dart';
import 'package:e_commerce/screens/home/home_screen.dart';
import 'package:e_commerce/screens/Auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../helper_services/navigation_services.dart';
import '../helper_widgets/drawer_item_card.dart';
import '../utils/images.dart';


class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
              decoration: BoxDecoration(
                color: bgColor,
                // color: Theme.of(context).hintColor.withOpacity(0.1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome".tr, style: Get.textTheme.headline5!.merge(TextStyle(color: Get.theme.colorScheme.secondary))),
                  SizedBox(height: 5),
                  Text("Login account or create new one for free".tr, style: Get.textTheme.bodyText1),
                  // Wrap(
                  //   spacing: 10,
                  //   children: <Widget>[
                  //     MaterialButton(
                  //       onPressed: () {
                  //        //Loginpage navigation
                  //       },
                  //       color: Get.theme.colorScheme.secondary,
                  //       height: 40,
                  //       elevation: 0,
                  //       child: Wrap(
                  //         runAlignment: WrapAlignment.center,
                  //         crossAxisAlignment: WrapCrossAlignment.center,
                  //         spacing: 9,
                  //         children: [
                  //           Icon(Icons.exit_to_app_outlined, color: whiteColor, size: 24),
                  //           Text(
                  //             "Login",
                  //             style: Get.textTheme.subtitle1!.merge(TextStyle(color: whiteColor)),
                  //           ),
                  //         ],
                  //       ),
                  //       shape: StadiumBorder(),
                  //     ),
                  //     MaterialButton(
                  //       color: Get.theme.focusColor.withOpacity(0.2),
                  //       height: 40,
                  //       elevation: 0,
                  //       onPressed: () {
                  //       // Register page navigation
                  //       },
                  //       child: Wrap(
                  //         runAlignment: WrapAlignment.center,
                  //         crossAxisAlignment: WrapCrossAlignment.center,
                  //         spacing: 9,
                  //         children: [
                  //           Icon(Icons.person_add_outlined, color: whiteColor, size: 24),
                  //           Text(
                  //             "Register".tr,
                  //             style: Get.textTheme.subtitle1!.merge(TextStyle(color: whiteColor)),
                  //           ),
                  //         ],
                  //       ),
                  //       shape: StadiumBorder(),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: bgColor,
              ),
              accountName: Text(
                "Asad Ali",
                style: TextStyle(color: Colors.black),
              ),
              accountEmail: Text(
                "asadali110@gmail.com",
                style: TextStyle(color: Colors.black),
              ),
              currentAccountPicture: Stack(
                children: [
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(80)),
                      child: CachedNetworkImage(
                        height: 80,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        imageUrl: "https://picsum.photos/250?image=9",
                        placeholder: (context, url) => Image.asset(Images.loadingHolder,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 80,
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error_outline),
                      ),
                    ),
                  ),
                  // Positioned(
                  //   top: 0,
                  //   right: 0,
                  //   child: Get.find<AuthService>().user.value.verifiedPhone ?? false ? Icon(Icons.check_circle, color: Get.theme.colorScheme.secondary, size: 24) : SizedBox(),
                  // )
                ],
              ),
            ),
            SizedBox(height: 20),
            DrawerLinkWidget(
              icon: Icons.home_outlined,
              text: "Home",
              onTap: ()  {
                NavigationServices.goNextAndDoNotKeepHistory(context: context, widget: HomeScreen(tenatId: Provider.of<UserDataProvider>(context,listen: false).user!.tenantId!));
                setState((){});
              },
            ),
            DrawerLinkWidget(
              icon: Icons.place_outlined,
              text: "Explore Salons",
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            DrawerLinkWidget(
              icon: Icons.folder_special_outlined,
              text: "Categories",
              onTap: () {
              },
            ),
            DrawerLinkWidget(
              icon: Icons.assignment_outlined,
              text: "Bookings",
              onTap: () async {
                Get.back();

              },
            ),
            DrawerLinkWidget(
              icon: Icons.notifications_none_outlined,
              text: "Notifications",
              onTap: () {

              },
            ),
            DrawerLinkWidget(
              icon: Icons.favorite_outline,
              text: "Favorites",
              onTap: () async {

              },
            ),
            DrawerLinkWidget(
              icon: Icons.chat_outlined,
              text: "Messages",
              onTap: () async {
                Get.back();

              },
            ),
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
              text: "Wallets",
              onTap: () async {

              },
            ),
            DrawerLinkWidget(
              icon: Icons.person_outline,
              text: "Account",
              onTap: () async {
                Get.back();

              },
            ),
            DrawerLinkWidget(
              icon: Icons.settings_outlined,
              text: "Settings",
              onTap: () async {

              },
            ),
            DrawerLinkWidget(
              icon: Icons.translate_outlined,
              text: "Languages",
              onTap: () async {

              },
            ),
            DrawerLinkWidget(
              icon: Icons.brightness_6_outlined,
              text: Get.isDarkMode ? "Light Theme" : "Dark Theme",
              onTap: () async {

              },
            ),
            ListTile(
              dense: true,
              title: Text(
                "Help & Privacy",
                style: Get.textTheme.caption,
              ),
              trailing: Icon(
                Icons.remove,
                color: Get.theme.focusColor.withOpacity(0.3),
              ),
            ),
            DrawerLinkWidget(
              icon: Icons.help_outline,
              text: "Help & FAQ",
              onTap: () async {
              },
            ),
            // CustomPageDrawerLinkWidget(),

            // if (Get.find<AuthService>().isAuth) {
            DrawerLinkWidget(
              icon: Icons.delete,
              text: "Delete Account",
              onTap: () async {
                Get.back();
                // showAnimatedDialog(context, SignOutConfirmationDialog(), isFlip: true);
                // await Get.find<RootController>().changePage(0);
              },
            ),
            // } else {
            //   return SizedBox(height: 0);
            // }

            DrawerLinkWidget(
              icon: Icons.logout,
              text: "Logout",
              onTap: ()  {
                NavigationServices.goNextAndDoNotKeepHistory(context: context, widget: LoginScreen());


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

