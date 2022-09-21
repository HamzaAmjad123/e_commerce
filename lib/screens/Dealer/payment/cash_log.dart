
import 'package:e_commerce/screens/Dealer/payment/widget/cash_log_card.dart';
import 'package:flutter/material.dart';

import '../../../configs/color.dart';

class CashLogScreen extends StatefulWidget {
  const CashLogScreen({Key? key}) : super(key: key);

  @override
  State<CashLogScreen> createState() => _CashLogScreenState();
}

class _CashLogScreenState extends State<CashLogScreen> {
   getCashLogDetails() async{
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text("Cash Log Screen"),
      ),
      body: RefreshIndicator(
        onRefresh: (){
        return getCashLogDetails();
        },
        child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
          child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              primary: false,
              itemCount: 2,
              itemBuilder: (context,index){
                return CashLogCard();
              }),
        ),
      ),
    );
  }


}

