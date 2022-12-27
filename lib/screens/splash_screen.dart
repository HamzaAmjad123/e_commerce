

import 'dart:async';
import 'dart:convert';

import 'package:e_commerce/Admin_Module/screens/dashboard/dashboard_screen.dart';
import 'package:e_commerce/model/user_model.dart';
import 'package:e_commerce/screens/Dealer/home/dashboard_screen.dart';
import 'package:e_commerce/screens/Dealer/home/dashboard_screens/home_screen_widget.dart';
import 'package:e_commerce/screens/Rider/rider_home.dart';
import 'package:e_commerce/service/local_storage_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../helper_services/navigation_services.dart';
import 'Auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkLogin();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset("assets/image/splash_logo.png"),
      ),
    );
  }


  checkLogin()async{

    var str=await LocalStorageServices().getUser();
   if(str!=null){
     print("str  $str");
      UserResponseModel user=await UserResponseModel.fromJson(jsonDecode(str));
      user.userRoles![0]=="Dealer"?
     // print("Tenat Id ${user.user!.tenantId!}");
     // print("Name ${user.user!.userName}");
     Timer(Duration(seconds: 3), () =>
         NavigationServices.goNextAndDoNotKeepHistory(context: context, widget: DashBoardScreen(tenatId: user.user!.tenantId!))

     ):
      user.userRoles![0]=="Rider"?
      // print("Tenat Id ${user.user!.tenantId!}");
      // print("Name ${user.user!.userName}");
      Timer(Duration(seconds: 3), () =>
          NavigationServices.goNextAndDoNotKeepHistory(context: context, widget: RiderHome())

      ): Timer(Duration(seconds: 3), () =>
          NavigationServices.goNextAndDoNotKeepHistory(context: context, widget: AdminDashboardScreen())

      );
   }
   else{
     Timer(Duration(seconds: 3), () =>
         NavigationServices.goNextAndDoNotKeepHistory(context: context, widget: LoginScreen())
     );
   }
  }
}

