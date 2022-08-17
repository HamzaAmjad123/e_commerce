import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return
      Center(
        child: Container(
            width: double.infinity,
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 15.0,bottom: 12.0),
            child: Lottie.asset("assets/images/temp.json",height: MediaQuery.of(context).size.height /3.9)
    ),);
  }
}

