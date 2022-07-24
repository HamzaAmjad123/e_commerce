import 'package:e_commerce/configs/color.dart';
import 'package:e_commerce/configs/text_style.dart';
import 'package:e_commerce/helper_services/custom_loader.dart';
import 'package:e_commerce/helper_services/custom_snackbar.dart';
import 'package:e_commerce/helper_widgets/custom_text_fild.dart';
import 'package:e_commerce/provider/user_data_provider.dart';
import 'package:e_commerce/screens/home_screen.dart';
import 'package:e_commerce/service/login_api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/images.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50.0,
          ),
          Expanded(child: SigInWidget()),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 70.0,
                width: 40.0,
                decoration: BoxDecoration(
                    // shape: BoxShape.circle,
                    color: bgColor,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50.0),
                        bottomRight: Radius.circular(50.0)),
                    boxShadow: [
                      BoxShadow(
                        color: bgColor.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 8,
                        // offset: Offset(0, 0),
                      )
                    ]),
              ),
              Container(
                margin: EdgeInsets.only(top: 15.0, left: 13.0),
                height: 35.0,
                width: 35.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: bgColor,
                    boxShadow: [
                      BoxShadow(
                        color: bgColor.withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 7,
                        // offset: Offset(3, 3),
                      )
                    ]),
              ),
              Spacer(),
              Padding(
                padding:
                    const EdgeInsets.only(right: 15.0, top: 17.0, bottom: 15.0),
                child: InkWell(
                  onTap: (){
                    print("${Provider.of<UserDataProvider>(context,listen: false).user}");
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ),
            ],
          ),
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
  TextEditingController _userCont = TextEditingController(text: "admin");
  TextEditingController _passwordCont =
      TextEditingController(text: "admin");
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
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18.0, top: 13.0),
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w800),
                ),
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.only(top: 15.0, right: 13.0),
                height: 35.0,
                width: 35.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: bgColor,
                    boxShadow: [
                      BoxShadow(
                        color: bgColor.withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 7,
                        // offset: Offset(3, 3),
                      )
                    ]),
              ),
              Container(
                height: 70.0,
                width: 40.0,
                decoration: BoxDecoration(
                    // shape: BoxShape.circle,
                    color: bgColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.0),
                        bottomLeft: Radius.circular(50.0)),
                    boxShadow: [
                      BoxShadow(
                        color: bgColor.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 8,
                        // offset: Offset(0, 0),
                      )
                    ]),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 7.5,
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Provider.of<UserDataProvider>(context, listen: false)
                  //             .user!
                  //             .imageUrl ==
                  //         ""
                  //     ? Container(
                  //         height: 70,
                  //         width: 70,
                  //         child: Image.asset(Images.placeHolder),
                  //       )
                  //     : Provider.of<UserDataProvider>(context, listen: false)
                  //                 .user!
                  //                 .imageUrl ==
                  //             null
                  //         ? Image.asset("")
                  //         : Image.network(
                  //             Provider.of<UserDataProvider>(context,
                  //                     listen: false)
                  //                 .user!
                  //                 .imageUrl!,
                  //             height: 70.0,
                  //             width: 70.0,
                  //           ),

                  CustomTextField(
                    prefixIcon: Icons.person_outline_outlined,
                    hintText: "Username",
                    controller: _userCont,
                    focusNode: _userFocus,
                  ),
                  CustomTextField(
                    prefixIcon: Icons.key,
                    hintText: "Password",
                    inputType: TextInputType.visiblePassword,
                    obScureText: true,
                    controller: _passwordCont,
                    focusNode: _passwordFocus,
                  ),
                  SizedBox(
                    height: 10.0,
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: RadioListTile<String>(
                    activeColor: bgColor,
                    title: Text(
                      "Remember Me",
                      style: TextStyle(
                          color: blackColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 14.0),
                    ),
                    value: "1",
                    groupValue: selectedRadio,
                    onChanged: (String? val) {
                      selectedRadio = val!;
                      setState(() {});
                    }),
              ),
              Expanded(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          vertical: 11.0,
                        ),
                        primary: bgColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.0),
                                bottomLeft: Radius.circular(30.0)))),
                    onPressed: () {
                      if (_validateLogin()) {
                        _loginHandler();

                      }
                    },
                    child: Text(
                      "LOGIN",
                      style: loginStyle,
                    )),
              )
            ],
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
