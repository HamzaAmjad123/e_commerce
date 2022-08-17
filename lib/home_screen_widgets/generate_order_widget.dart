
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class GenerateOrderWidget extends StatefulWidget {
  const GenerateOrderWidget({Key? key}) : super(key: key);

  @override
  State<GenerateOrderWidget> createState() => _GenerateOrderWidgetState();
}

class _GenerateOrderWidgetState extends State<GenerateOrderWidget> {
  String date = DateTime.now().toString();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

          Lottie.asset("assets/images/dashboard.json"),
        SizedBox(height: 15.0,),
        Lottie.asset("assets/images/dashboard2.json")

      ],
    );
  }
}
