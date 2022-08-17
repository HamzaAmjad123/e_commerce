import 'package:e_commerce/configs/color.dart';
import 'package:e_commerce/helper_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../../../configs/text_style.dart';
import '../../../helper_services/navigation_services.dart';
import '../../../provider/cash_book_provider.dart';
import '../../generate_order/generate_order_screen.dart';


class CashInHandWidget extends StatefulWidget {
  const CashInHandWidget({Key? key}) : super(key: key);

  @override
  State<CashInHandWidget> createState() => _CashInHandWidgetState();
}

class _CashInHandWidgetState extends State<CashInHandWidget> {
  String date = DateTime.now().toString();
  @override
  Widget build(BuildContext context) {
     return Consumer<CashBookProvider>(builder: (context,cash,_){
      return
        cash.cashBook != null ?
        Padding(
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
                         Text(cash.cashBook!.result!.totalAmount.toString(),style: rsStyle),
                         Text("Total Amount",style: cashStyle)
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
                         Text(cash.cashBook!.result!.totalReceived.toString(),style: rsStyle,),
                         Text("Total Recieved",style: cashStyle,),

                       ],
                     ),

                   ),
                 ),


               ],
             ),
             SizedBox(height: 5.0,),

         Container(
           width: double.infinity,
           child: ElevatedButton.icon(
               style: ElevatedButton.styleFrom(
                 primary:  Colors.grey[200],
               ),
               onPressed: (){

               }, icon: Icon(Icons.calendar_today,color: blackColor,), label: Text("Previous Order",style: TextStyle(color: blackColor,fontSize: 14.0,fontWeight: FontWeight.w500),)),
         ),
             // Center(
             //   child: Container(
             //     height: 65,
             //     margin: EdgeInsets.symmetric(horizontal: 5.0),
             //     padding: EdgeInsets.symmetric(
             //         horizontal: 12.0,vertical: 12.0
             //     ),
             //     decoration: BoxDecoration(
             //         color: Colors.grey[200],
             //         borderRadius: BorderRadius.circular(12.0)
             //     ),
             //     child: Column(
             //       mainAxisAlignment: MainAxisAlignment.center,
             //       crossAxisAlignment: CrossAxisAlignment.center,
             //       children: [
             //         Text("RS 0",style: rsStyle,),
             //         Text("Remaining Balance",style: cashStyle,)
             //       ],
             //     ),
             //   ),
             // ),

             SizedBox(height: 10.0,),

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
                   NavigationServices.goNextAndKeepHistory(context: context, widget: GenerateOrderScreen());
                   setState((){});
                 },
               ),
             ),
           ],
         ),
       ):Container(
          height: 300.0,
          width: 400.0,
          color: Colors.red,

        );
     });
  }
}
