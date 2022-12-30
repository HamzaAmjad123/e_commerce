import 'package:e_commerce/model/admin_models/approved_order_model.dart';
import 'package:flutter/material.dart';
import '../../../../../configs/color.dart';
import '../../../../../configs/text_style.dart';
import '../../../../../configs/ui.dart';
import '../../../../../helper_services/navigation_services.dart';
import '../../../../../screens/Dealer/order_details/order_details_screen.dart';
import 'order_log.dart';

class ApprovedOrderWidget extends StatefulWidget {
  ApprovedOrders order;
   ApprovedOrderWidget({required this.order});

  @override
  State<ApprovedOrderWidget> createState() => _ApprovedOrderWidgetState();
}

class _ApprovedOrderWidgetState extends State<ApprovedOrderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20.0),
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
      decoration: Ui.getBoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("PKR"+"${widget.order.totalAmount}",style: TextStyle(color: bgColor,fontWeight: FontWeight.w600,fontSize: 14.0),),
              SizedBox(height: 10,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap:(){
                        NavigationServices.goNextAndKeepHistory(
                            context: context,
                            widget: OrderDetailsScreen(id: widget.order.orderId!));
                      },
                      child: Container(
                        height: 35,
                        width: 60,
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
                            Icon(Icons.remove_red_eye,color: bgColor,size: 18,),

                            Text("view",style: TextStyle(fontSize: 12,color: bgColor),)
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap:(){

                        NavigationServices.goNextAndKeepHistory(
                            context: context,
                            widget: AdminOrderLogScreen(order: widget.order,));
                      } ,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        height: 35,
                        width: 65,
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
                            Text("Track",style: TextStyle(fontSize: 12,color: bgColor),)
                          ],
                        ),
                      ),
                    ),
                  ]),
            ],
          ),
          SizedBox(width: 5,),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("ORDER"+" "+"ID"+"${widget.order.orderNo}",style: normalStyle,),
              SizedBox(height: 8,),
              Text("26,Oct,2022 3:00 Pm",style: normalStyle,),
              SizedBox(height: 8,),
              Text("Deliverd on 21 dec",style: rsStyle),
            ],
          )
        ],
      ),
    );
  }
}
