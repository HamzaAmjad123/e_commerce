
import 'package:e_commerce/helper_services/custom_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../configs/color.dart';
import '../../../../configs/text_style.dart';
import '../../../../configs/ui.dart';
import '../../../../helper_services/custom_loader.dart';
import '../../../../helper_services/custom_loader.dart';
import '../../../../helper_services/navigation_services.dart';
import '../../../../model/dealer_orders_model.dart';
import '../../../../provider/dealer_history_provider.dart';
import '../../../../service/dealer_history_service.dart';
import '../../order_details/objection_screen.dart';
import '../../order_details/order_details_screen.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({Key? key}) : super(key: key);

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  
  _orderHistoryHandler()async{
    CustomLoader.showLoader(context: context);
    await DealerHistoryService().getDelaerHistory(skip: 0, take: 1000, tenatId: 1, dealerid: 4, context: context);
    CustomLoader.hideLoader(context);
  }
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _orderHistoryHandler();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height*0.13,
                decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    )
                ),),
              Container(
                height: MediaQuery.of(context).size.height*0.10,
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                // decoration: BoxDecoration(
                //   color: Colors.white,
                // ),
                child: TextField(
                  onSubmitted: (value){

                  },
                  decoration: InputDecoration(
                      fillColor: whiteColor,
                      filled: true,
                      hintText: "Search",
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(color: bgColor, width: 1.3)),
                      suffixIcon: Icon(
                        Icons.search,
                        color: bgColor,
                      )),
                ),
              ),
            ],
          ),

          Consumer<DealerHistoryProvider>(builder: (context, orders, _) {
            return orders.history != null
                ? ListView.builder(
                physics:NeverScrollableScrollPhysics(),
                itemCount: orders.history!.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (BuildContext, index) {
                  return OrderHistoryWidget(
                    order: orders.history![index],
                  );
                })
                : Container();
          }),
        ],
      ),
    );
  }
}

class OrderHistoryWidget extends StatelessWidget {
  OrderHistory order;

  OrderHistoryWidget({required this.order});

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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap:(){
                        NavigationServices.goNextAndKeepHistory(
                            context: context,
                            widget: OrderDetailsScreen(id: order.orderId!));
                      },
                      child: Container(
                        height: 35,

                        width: order.status==4?60.0:100.0,
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: bgColor),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: order.status==4?MainAxisAlignment.spaceBetween:MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.remove_red_eye,color: bgColor,size: 18,),
                            SizedBox(
                              width: order.status==4?0.0:10.0,
                            ),
                            Text("view",style: TextStyle(fontSize: order.status==4?12.0:16.0,color: bgColor,fontWeight: order.status==4?FontWeight.normal:FontWeight.w500),)
                          ],
                        ),
                      ),
                    ),
                    order.status==4?   InkWell(

                      onTap:(){
                        NavigationServices.goNextAndKeepHistory(
                            context: context,
                            widget:ObjectionScreen(

                            ));
                      } ,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        height: 35,
                        width:85,
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
                            Icon(Icons.location_on,color: bgColor,size: 18,),
                            Text("Objection",style: TextStyle(fontSize: 12,color: bgColor),)
                          ],
                        ),
                      ),
                    ):SizedBox(),
                  ]),
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

}