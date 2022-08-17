import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../configs/color.dart';
import '../configs/text_style.dart';
import '../helper_services/custom_loader.dart';
import '../helper_services/navigation_services.dart';
import '../model/order_list_model.dart';
import '../provider/order_list_provider.dart';
import '../provider/user_data_provider.dart';
import '../screens/order/order_details_screen.dart';
import '../screens/order/order_log_screen.dart';
import '../service/order_list_service.dart';

class PendingOrderWidget extends StatefulWidget {
  const PendingOrderWidget({Key? key}) : super(key: key);

  @override
  State<PendingOrderWidget> createState() => _PendingOrderWidgetState();
}

class _PendingOrderWidgetState extends State<PendingOrderWidget> {


  _getOrderList()async{
    CustomLoader.showLoader(context: context);
    await OrderListService().getOrderList(skip: 0, take: 1000, tenatId: Provider.of<UserDataProvider>(context,listen: false).user!.tenantId!, context: context);
    print("Teanat Id ${Provider.of<UserDataProvider>(context,listen: false).user!.tenantId!}");
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
    return  Column(
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
        );
  }
}


class OrderListWidget extends StatelessWidget {
  OrderList order;

  OrderListWidget({required this.order});


  @override
  Widget build(BuildContext context) {
    String date=order.date!;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 10.0,
      margin: EdgeInsets.symmetric(horizontal: 12.0,vertical: 12.0),
      child:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Text("Order No: ${order.orderNo}",style: orderStyle,)),
            Divider(
              color: Colors.black38,
            ),
            ListTile(
              leading:Text("Date: ${getFormatedDate(date)}",style: TextStyle(height: 1.4),),

              trailing:Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                          color: order.status==1?Colors.red:Colors.green
                      )
                  ),
                  child: Text(order.status==1? "Pending":order.status==2?"Approved":order.status==3?"Processing":order.status==4?"On Way":order.status==5?"Deliver":"")),

            ),

            Text("Amount ${order.totalAmount}",style: orderStyle,),
            Divider(
              color: Colors.black38,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // order.status==1?
                  // ElevatedButton.icon(
                  //     style: ElevatedButton.styleFrom(
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(12.0),
                  //       ),
                  //       primary: bgColor
                  //     ),
                  //     onPressed: (){}, icon: Icon(Icons.edit,size: 20.0,), label: Text("Edit"))
                  //     :
                  Container(),
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          primary: bgColor
                      ),
                      onPressed: (){
                        NavigationServices.goNextAndKeepHistory(context: context, widget: OrderDetailsScreen(id: order.orderId!));
                      }, icon: Icon(Icons.remove_red_eye,size: 20.0,), label: Text("View")),
                  // ElevatedButton.icon(
                  //     style: ElevatedButton.styleFrom(
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(12.0),
                  //         ),
                  //         primary: bgColor
                  //     ),
                  //     onPressed: (){
                  //       NavigationServices.goNextAndKeepHistory(context: context, widget: OrderLogScreen(id: order.orderId!));
                  //     }, icon: Icon(Icons.check_circle_rounded,size: 20.0,), label: Text("Status"))
                ]),


          ],
        ),
      ) ,
    );
  }
  getFormatedDate(_date) {
    var inputFormat = DateFormat('yyyy-MM-dd');
    var inputDate = inputFormat.parse(_date);
    var outputFormat = DateFormat('dd/MM/yyyy');
    return outputFormat.format(inputDate);
  }
}