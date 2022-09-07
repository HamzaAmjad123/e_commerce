import 'package:e_commerce/configs/color.dart';
import 'package:e_commerce/configs/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [


          Card(
            color: bgColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
            elevation: 10.0,
            margin: EdgeInsets.symmetric(horizontal: 15.0,),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Icon(CupertinoIcons.book,size: 30.0,),
                      Text("English",style: titleStyle,),
                    ],
                  ),
                  SizedBox(height: 4.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/icons/pkr_icon.png",height: 30.0,width: 30.0,fit: BoxFit.cover,),
                        SizedBox(width: 30.0,),
                        Text("150 Rs",style: titleStyle,),
                      ],
                    ),
                    SizedBox(height: 4.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/icons/discount_icon.png",height: 30.0,width: 30.0,fit: BoxFit.cover,),
                        SizedBox(width: 30.0,),
                        Text("150 Rs",style: titleStyle,),
                      ],
                    ),
                  ],
                )
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  //     Image.asset("assets/icons/discount_icon.png",height: 30.0,width: 30.0,fit: BoxFit.cover,),
                  //     Text("150 Rs"),
                  //   ],
                  // ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
