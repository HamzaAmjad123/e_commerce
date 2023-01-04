import 'package:e_commerce/provider/user_data_provider.dart';
import 'package:e_commerce/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../configs/api_urls.dart';
import '../../../../configs/color.dart';
import '../../../../configs/text_style.dart';
import '../../../../configs/ui.dart';
import '../../../../helper_services/navigation_services.dart';
import '../../../../model/order_list_model.dart';
import '../../../../provider/approved_order_provider.dart';
import '../../../../utils/handlers.dart';
import '../../order_details/order_details_screen.dart';
import '../../order_details/order_log_screen.dart';


class ApprovedOrdersScreen extends StatefulWidget {
  const ApprovedOrdersScreen({Key? key}) : super(key: key);
  @override
  State<ApprovedOrdersScreen> createState() => _ApprovedOrdersScreenState();
}

class _ApprovedOrdersScreenState extends State<ApprovedOrdersScreen> {
  TextEditingController searchCont= TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getDealerApprovedOrderHandler(context,"","","");
    });
    super.initState();
  }
  bool searchEnable=false;
  @override
    Widget build(BuildContext context) {
      return SingleChildScrollView(

        child: Container(
          color: Colors.black12,
          child: Column(
            children: [
              // Stack(
              //   alignment: Alignment.topCenter,
              //   children: [
              //     Container(
              //       width: double.infinity,
              //       height: MediaQuery.of(context).size.height*0.13,
              //       decoration: BoxDecoration(
              //           color: bgColor,
              //           borderRadius: BorderRadius.only(
              //             bottomLeft: Radius.circular(40),
              //             bottomRight: Radius.circular(40),
              //           )
              //       ),),
              //     Container(
              //       height: MediaQuery.of(context).size.height*0.10,
              //       alignment: Alignment.bottomCenter,
              //       padding: EdgeInsets.symmetric(horizontal: 20.0),
              //       // decoration: BoxDecoration(
              //       //   color: Colors.white,
              //       // ),
              //       child: TextField(
              //         onSubmitted: (value){
              //           searchEnable=true;
              //
              //           getDealerApprovedOrderHandler(context, searchCont.text,"","");
              //
              //           setState(() {
              //
              //           });
              //
              //         },
              //         controller: searchCont,
              //         // onChanged: (value){
              //         //   searchCont.text=value;
              //         // },
              //         decoration: InputDecoration(
              //             fillColor: whiteColor,
              //             filled: true,
              //             hintText: "Search",
              //             contentPadding:
              //             EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
              //             enabledBorder: OutlineInputBorder(
              //                 borderRadius: BorderRadius.circular(12.0)),
              //             focusedBorder: OutlineInputBorder(
              //                 borderRadius: BorderRadius.circular(12.0),
              //                 borderSide: BorderSide(color: bgColor, width: 1.3)),
              //             suffixIcon: IconButton(
              //              icon: Icon(searchEnable==true?Icons.close:Icons.search,
              //                 color: bgColor,),
              //               onPressed: (){
              //                 searchEnable?searchCont.clear():searchCont;
              //                 searchEnable?  getDealerApprovedOrderHandler(context,"","",""):
              //                 getDealerApprovedOrderHandler(context, searchCont.text,"","");
              //                 searchEnable=!searchEnable;
              //
              //
              //                 setState(() {
              //
              //                 });
              //                 print("Is Show $searchEnable");
              //
              //               },
              //             )),
              //       ),
              //     ),
              //   ],
              // ),
              Consumer<ApprovedOrderProvider>(builder: (context, orders, _) {
                return orders.approvedOrder != null
                    ? ListView.builder(
                    physics:NeverScrollableScrollPhysics(),
                    itemCount: orders.approvedOrder!.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext, index) {
                      return ApprovedOrderWidget(
                        order: orders.approvedOrder![index],
                      );
                    })
                    : Container();
              }),
            ],
          ),
        ),
      );
    }
}
class ApprovedOrderWidget extends StatelessWidget {
  OrderList order;

  ApprovedOrderWidget({required this.order});

  @override
  Widget build(BuildContext context) {
    String date = order.date!;
     return Container(
       padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 12.0),
       margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 12.0),
       decoration: Ui.getBoxDecoration(),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Column(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text("PKR"+"${order.totalAmount}",style: TextStyle(color: bgColor,fontWeight: FontWeight.w600,fontSize: 14.0),),
               SizedBox(height: 10,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [

                   InkWell(
                       onTap: (){
                         showImageDialog(
                             context: context,
                             url: order.cargoReciptImage==null?"":"$baseUrl${order.cargoReciptImage}"
                         );
                       },
                       child:order.cargoReciptImage!=null?Image.network("$baseUrl${order.cargoReciptImage}",height: 40.0,width: 40.0,fit: BoxFit.fill,):
                       Image.asset("assets/image/book_placholder.jpg",height: 40.0,width: 40.0,fit: BoxFit.fill,)

                   ),
                   InkWell(

                     onTap: () {
                       showActionDialog(context);
                     },
                     child: Container(
                       margin: EdgeInsets.symmetric(horizontal:

                       5),
                       height: 35,
                       width: 85,
                       padding: EdgeInsets.all(6),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(8),
                         border: Border.all(color: bgColor),
                         color: Colors.white,
                       ),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           Icon(Icons.settings, color: bgColor, size: 18,),
                           Text("Action", style: TextStyle(
                               fontSize: 14, color: bgColor),)
                         ],
                       ),
                     ),
                   )
                 ],
               )
             ],
           ),
           SizedBox(width: order.status==4?5.0:25.0,),
           Column(
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text("ORDER"+" "+"No"+" "+"${order.orderNo}",style: normalStyle,),
               SizedBox(height: 8,),
               Text("26,Oct,2022 3:00 Pm",style: normalStyle,),
       Container(
       width: MediaQuery.of(context).size.width * 0.3,
           alignment: Alignment.center,
           margin: EdgeInsets.only(top: 8.0),
           padding: EdgeInsets.symmetric( vertical: 6.0),
           child: Row(mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text("Status :",style: subtitleStyle,),
             SizedBox(width: 5,),
             Text(order.status == 1
                 ? "Pending"
                 : order.status == 2
                 ? "Approved"
                 : order.status == 3
                 ? "Processing"
                 : order.status == 4
                 ? "Shipped"
                 : order.status == 5
                 ? "Delivered":
             order.status == 6
                 ?"Cancel"
                 : order.status==7?"Ready To Shippment":"",style: rsStyle,)
           ],)),

             ],
           )
         ],
       ),
     );;
  }
  showActionDialog(BuildContext context){
    return showDialog(context: context, builder: (context){
      return SingleChildScrollView(
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0)
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: Icon(Icons.close)),
                ),
                GestureDetector(
                  onTap:(){
                    NavigationServices.goNextAndKeepHistory(
                        context: context,
                        widget: OrderDetailsScreen(id: order.orderId!));
                  },
                  child: Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width/2,
                    margin: EdgeInsets.symmetric(vertical: 12.0),
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: bgColor),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.remove_red_eye,color: bgColor,size: 28,),

                        Text("view",style: TextStyle(fontSize: 18,color: bgColor),)
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap:(){
                    NavigationServices.goNextAndKeepHistory(
                        context: context,
                        widget: OrderLogScreen(order: order));
                  } ,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 12.0),
                    height: 40,
                    width: MediaQuery.of(context).size.width/2,
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: bgColor),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.location_on,color: bgColor,size: 28,),
                        Text("Track",style: TextStyle(fontSize: 18,color: bgColor),)
                      ],
                    ),
                  ),
                ),
              ]),
        ),
      );
    });
  }

}
// class DealerStatementWidget extends StatelessWidget {
//   List<VoucherLines> cash;
//  DealerStatementWidget({required this.cash});
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         itemCount: cash.length,
//         shrinkWrap: true,
//         scrollDirection: Axis.vertical,
//         primary: false,
//         itemBuilder: (BuildContext,index){
//       return Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//          Expanded(child: Text(cash[index].total.toString())),
//           Expanded(child: Text(cash[index].receivedType==1?"Cash":cash[index].receivedType==2?"Bank":cash[index].receivedType==3?"Jazz Cash":cash[index].receivedType.toString())),
//           Expanded(child: Text(Methods().getFormatedDate(cash[index].receivedDate!))),
//           Expanded(child: Text(cash[index].amountReceivedDetail!)),
//         ],
//       );
//     });
//   }
// }



