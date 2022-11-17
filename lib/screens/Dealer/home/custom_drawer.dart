
import 'package:e_commerce/configs/api_urls.dart';
import 'package:e_commerce/configs/color.dart';
import 'package:e_commerce/configs/text_style.dart';
import 'package:e_commerce/helper_services/navigation_services.dart';
import 'package:e_commerce/provider/user_data_provider.dart';
import 'package:e_commerce/screens/Dealer/home/dashboard_screen.dart';
import 'package:e_commerce/screens/Auth/login_screen.dart';
import 'package:e_commerce/screens/Dealer/home/dashboard_screens/approved_orders.dart';
import 'package:e_commerce/screens/Dealer/payment/send_amount_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import '../../../helper_widgets/drawer_item_card.dart';
import '../../../model/user_model.dart';
import '../../../service/local_storage_service.dart';
import '../../Rider/widget/approved_widget.dart';
import '../../Rider/widget/history_widget.dart';
import '../generate_order/generate_order_screen.dart';
import '../order_details/pending_orders_screen.dart';

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
    String url=Provider.of<UserDataProvider>(context,listen: false).user!.tenant!.logoUrl??"";
    UserModel usermodels = UserModel.fromJson(box.read('user'));
    return Drawer(
      child:
      ListView(children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 55,
                width: 70,
                margin: EdgeInsets.only(top: 10),
                child: url.isEmpty?Image.asset("image/logo.png",fit: BoxFit.fill,):Image.network("$baseUrl"+url,fit: BoxFit.fill,),
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
                Navigator.pop(context);
                NavigationServices.goNextAndDoNotKeepHistory(
                    context: context,
                    widget: DashBoardScreen(
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
                Navigator.pop(context);
                NavigationServices.goNextAndKeepHistory(
                    context: context, widget: GenerateOrderScreen());
                setState(() {});
              },
            ),
            DrawerLinkWidget(
              icon: Icons.assignment_outlined,
              text: "Pending Orders",
              onTap: () {
                Navigator.pop(context);
                NavigationServices.goNextAndKeepHistory(
                    context: context, widget: PreviousOrdersScreen());
                setState(() {});
              },
            ),
            DrawerLinkWidget(
              icon: Icons.account_balance_wallet_outlined,
              text: "Send Cash",
              onTap: () {
                if(role=="Dealer"){
                  Navigator.pop(context);
                  NavigationServices.goNextAndKeepHistory(context: context, widget: SendPaymentScreen());
                }else{
                  print("noithing");
                }
              },
            ),
          ],
        ):Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DrawerLinkWidget(
              icon: Icons.fastfood_rounded,
              text: "Approved Order",
              onTap: () {
                Navigator.pop(context);
                NavigationServices.goNextAndKeepHistory(
                    context: context, widget: RiderApprovedOrderScreen(
                  isShow: false,
                ));
                setState(() {});
              },
            ),
            DrawerLinkWidget(
              icon: Icons.fastfood_rounded,
              text: "Order History",
              onTap: () {
                Navigator.pop(context);
                NavigationServices.goNextAndKeepHistory(
                    context: context, widget: RiderHistoryScreen(
                  isShow: false,
                ));
                setState(() {});
              },
            ),
          ],
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
            Navigator.pop(context);
            await box.remove('user');
            // await LocalStorageServices().saveUser(false);
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
