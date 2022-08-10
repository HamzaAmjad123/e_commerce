import 'package:e_commerce/configs/text_style.dart';
import 'package:e_commerce/helper_services/custom_loader.dart';
import 'package:e_commerce/provider/order_list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/order_list_model.dart';
import '../service/order_list_service.dart';

class OrderListScreen extends StatefulWidget {
  const OrderListScreen({Key? key}) : super(key: key);

  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {


  _getOrderList()async{
    CustomLoader.showLoader(context: context);
   await OrderListService().getOrderList(skip: 0, take: 1000, tenatId: 0, context: context);
    CustomLoader.hideLoader(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getOrderList();
    });
    setState(() {

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order List",style: barStyle,),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<OrderListProvider>(builder: (context,orders,_){
              return ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                  itemCount: orders.orderList!.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext,index){
                return OrderListWidget(
                  order:  orders.orderList![index],

                );
              });
            }),
          ],
        ),
      ),
    );
  }
}


class OrderListWidget extends StatelessWidget {
  OrderList order;

  OrderListWidget({required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 10.0,
      margin: EdgeInsets.symmetric(horizontal: 12.0,vertical: 12.0),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Text("Order Id: ${order.orderId}",style: orderStyle,)),
         ListTile(
           leading:Text(order.dealer!.name == null? "Name":order.dealer!.name!),

           trailing:Container(
             padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 8.0),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(12.0),
                 border: Border.all(
                   color: order.status==1?Colors.red:Colors.green
                 )
               ),
               child: Text(order.status==1? "Pending":order.status==2?"Approved":order.status==3?"Processing":order.status==4?"On Way":order.status==5?"Deliver":"")),

         )

        ],
      ) ,
    );
  }
}
