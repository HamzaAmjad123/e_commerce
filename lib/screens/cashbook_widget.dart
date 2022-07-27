import 'package:e_commerce/configs/color.dart';
import 'package:e_commerce/configs/text_style.dart';
import 'package:e_commerce/helper_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../helper_services/navigation_services.dart';
import 'generate_order_screen.dart';

class CashbookWidget extends StatefulWidget {
  const CashbookWidget({Key? key}) : super(key: key);

  @override
  State<CashbookWidget> createState() => _CashbookWidgetState();
}

class _CashbookWidgetState extends State<CashbookWidget> {
  String date = DateTime.now().toString();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 6.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.0,vertical: 12.0
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12.0)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("RS 0",style: rsStyle),
                      Text("Cash in hand",style: cashStyle)
                    ],
                  ),
                ),
              ),

              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.0,vertical: 12.0
                  ),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12.0)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("RS 0",style: rsStyle,),
                      Text("Cash in hand",style: cashStyle,)
                    ],
                  ),

                ),
              ),

            ],
          ),
          SizedBox(height: 15.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width:80.0,
                  height: 15.0,
                  child: Text(date)),
              Text("Cash Out"),
              Text("Cash In")
            ],
          ),

          Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 15.0,bottom: 12.0),
              child: Lottie.asset("assets/images/check.json",height: MediaQuery.of(context).size.height /2.9)),
          // Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: CustomButton(

              textColor: whiteColor,
              height: 45.0,
              text: "Generate Order",
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              buttonColor: bgColor,
              horizontalMargin: 12.0,
              verticalMargin: 5.0,
              onTap: (){
                NavigationServices.goNextAndKeepHistory(context: context, widget: GenerateOrderScreen(

                ));
                setState((){});
              },
            ),
          )
        ],
      ),
    );
  }
}
