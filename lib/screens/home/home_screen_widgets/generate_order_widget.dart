
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class DashBoardWidget extends StatefulWidget {
  const DashBoardWidget({Key? key}) : super(key: key);

  @override
  State<DashBoardWidget> createState() => _DashBoardWidgetState();
}

class _DashBoardWidgetState extends State<DashBoardWidget> {
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
