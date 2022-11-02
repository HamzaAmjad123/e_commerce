

import 'dart:async';

import 'package:e_commerce/screens/Dealer/home/dashboard_screen.dart';
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
    super.initState();
    Timer(Duration(seconds: 3), () =>
        NavigationServices.goNextAndDoNotKeepHistory(context: context, widget: LoginScreen())
    );
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

   // checkLogin() async{
   //  // if( LocalStorageServices().getUser()!=null){
   //  //   print("pehla if");
   //  //   if( LocalStorageServices().getUser()== false){
   //  //     print("2sra if");
   //  //     print("User Not Login");
   //      Timer(Duration(seconds: 3), () =>
   //          NavigationServices.goNextAndDoNotKeepHistory(context: context, widget: LoginScreen())
   //      );
   //  //   }
   //  //   else{
   //  //     print(LocalStorageServices().getUser()!=null);
   //  //     print("Home Screen");
   //  //     Timer(Duration(seconds: 3), () =>
   //  //         NavigationServices.goNextAndDoNotKeepHistory(context: context, widget:DashBoardScreen(tenatId: 1) )
   //  //     );
   //  //   }
   //  // }else{
   //    NavigationServices.goNextAndDoNotKeepHistory(context: context, widget: LoginScreen());
   //    print("motorway");
   //   // TODO: implement initState
   // }
}

