import 'package:e_commerce/configs/color.dart';
import 'package:e_commerce/configs/text_style.dart';
import 'package:e_commerce/helper_services/custom_loader.dart';
import 'package:e_commerce/helper_services/custom_snackbar.dart';
import 'package:e_commerce/helper_services/navigation_services.dart';
import 'package:e_commerce/helper_widgets/custom_text_fild.dart';
import 'package:e_commerce/provider/user_data_provider.dart';
import 'package:e_commerce/service/login_api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Dealer/home/dashboard_screen.dart';
import '../Rider/rider_home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        alignment: Alignment.bottomCenter,
        width: MediaQuery.of(context).size.width*0.5,
        height: MediaQuery.of(context).size.height*0.15,
        child: Image.asset("assets/image/signin_bottom.png",fit: BoxFit.fill,),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: SigInWidget()),
        ],
      ),
    );
  }
}

class SigInWidget extends StatefulWidget {
  const SigInWidget({Key? key}) : super(key: key);

  @override
  State<SigInWidget> createState() => _SigInWidgetState();
}

class _SigInWidgetState extends State<SigInWidget> {
  TextEditingController _userCont = TextEditingController();
  TextEditingController _passwordCont = TextEditingController();
  FocusNode _userFocus = FocusNode();
  FocusNode _passwordFocus = FocusNode();
  String selectedRadio = '';

  _loginHandler() async {
    CustomLoader.showLoader(context: context);
    bool res = await LoginApiService().getLogin(
        context: context,
        userName: _userCont.text,
        password: _passwordCont.text);
     CustomLoader.hideLoader(context);
    if (res) {
      Provider.of<UserDataProvider>(context,listen: false).user!.userRoles![0] !="Dealer"?
      NavigationServices.goNextAndDoNotKeepHistory(context: context, widget: RiderHome(
      )):
      NavigationServices.goNextAndDoNotKeepHistory(context: context, widget: DashBoardScreen(
        tenatId:Provider.of<UserDataProvider>(context,listen: false).user!.user!.tenantId!,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width*0.7,
            height: MediaQuery.of(context).size.height*0.25,
            child: Image.asset("assets/image/signin_top.png",fit: BoxFit.fill,),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10.0,
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Image.asset("assets/image/app_logo.png",fit: BoxFit.fill,),
              ),
              Container(
                margin:EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: CustomTextField(
                  headerText: "UserName",
                  shape: true,
                  prefixIcon: Icons.person_outline_outlined,
                  hintText: "Username",
                  controller: _userCont,
                  focusNode: _userFocus,
                ),
              ),
              Container(
                margin:EdgeInsets.symmetric(horizontal: 20),
                child: CustomTextField(
                  headerText: "Password",
                  shape: true,
                  prefixIcon: Icons.key,
                  hintText: "Password",
                  inputType: TextInputType.visiblePassword,
                  obScureText: true,
                  controller: _passwordCont,
                  focusNode: _passwordFocus,
                ),
              ),
            ],
          ),
         // Container(
         //   alignment: Alignment.bottomRight,
         //    margin: EdgeInsets.symmetric(horizontal: 20),
         //    child: TextButton(child: Text("Forgot Password \?",style: TextStyle(color: bgColor,fontWeight: FontWeight.bold)),onPressed: (){},),
         //  ),

          InkWell(
            onTap: (){
              if (_validateLogin()) {
                _loginHandler();
              }
            },
            child: Center(
              child: Container(
                margin:EdgeInsets.symmetric(horizontal: 20,vertical: 20),
               padding:EdgeInsets.symmetric(vertical: 10),
                width: MediaQuery.of(context).size.width*0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: bgColor
                ),
                child: Center(child: Text("Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w800,fontSize: 16),),),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _validateLogin() {
    if (_userCont.text.isEmpty) {
      CustomSnackBar.failedSnackBar(
          context: context, message: "Enter Valid UserName");
      _userFocus.requestFocus();
      return false;
    } else if (_passwordCont.text.isEmpty) {
      CustomSnackBar.failedSnackBar(
          context: context, message: "Password must be more then 6 character");
      _passwordFocus.requestFocus();
      return false;
    } else {
      return true;
    }
  }
}
