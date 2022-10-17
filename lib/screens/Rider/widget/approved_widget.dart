import 'package:e_commerce/helper_services/navigation_services.dart';
import 'package:e_commerce/utils/functions.dart';
import 'package:e_commerce/utils/handlers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../configs/color.dart';
import '../../../configs/text_style.dart';
import '../../../model/rider_models/rider_order_model.dart';
import '../../../provider/Rider_providers/rider_orders_provider.dart';
import '../../Dealer/order_details/order_details_screen.dart';
import '../order_is_delivered.dart';

class RiderApprovedOrder extends StatefulWidget {
  const RiderApprovedOrder({Key? key}) : super(key: key);

  @override
  State<RiderApprovedOrder> createState() => _RiderApprovedOrderState();
}

class _RiderApprovedOrderState extends State<RiderApprovedOrder> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
      return  approvedHandler(context);
      },
      child: Consumer<RiderApprovesOrdersProvider>(
          builder: (context, approvedOrders, _) {
            return approvedOrders.riderApprovedorders!=null
                ? ListView.builder(
                physics:AlwaysScrollableScrollPhysics(),
                itemCount: approvedOrders.riderApprovedorders!.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (BuildContext, index) {
                  return RiderOrderWidget(
                      order:approvedOrders.riderApprovedorders![index]
                  );
                })
                : Container(
              child: Text("No Order Available"),
            );
          }),
    );
  }
}


class RiderOrderWidget extends StatelessWidget {
  RiderOrdersModel order;

  RiderOrderWidget({required this.order});

  @override
  Widget build(BuildContext context) {

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 10.0,
      margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: Text(
                  "Order No: ${order.orderNo}",
                  style: orderStyle,
                )),
            Divider(
              color: Colors.black38,
            ),
            ListTile(
              leading: Text(
                "Date: ${Methods().getFormatedDate(order.date)}",
                style: TextStyle(height: 1.4),
              ),
              trailing: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                          color:
                          order.status == 1 ? Colors.red : Colors.green)),
                  child: Text(order.status == 1
                      ? "Pending"
                      : order.status == 2
                      ? "Approved"
                      : order.status == 3
                      ? "Processing"
                      : order.status == 4
                      ? "Shipment"
                      : order.status == 5
                      ? "Delivered":
                      order.status == 6
                          ?"Cancel"
                      : order.status==7?"Ready To Shippment":"")),
            ),
            Text(
              "Amount ${order.totalAmount}",
              style: orderStyle,
            ),
            Divider(
              color: Colors.black38,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          primary: bgColor
                      ),
                      onPressed: (){
                        NavigationServices.goNextAndKeepHistory(
                            context: context,
                            widget: OrderDetailsScreen(id: order.orderId!));
                      }, icon: Icon(Icons.remove_red_eye,size: 20.0,), label: Text("View")),
                 order.isVerifiedByGatePassUser==false?Text("Not Approved"): ElevatedButton.icon(
                     style: ElevatedButton.styleFrom(
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(12.0),
                         ),
                         primary: bgColor),
                     onPressed: () {
                       NavigationServices.goNextAndKeepHistory(context: context, widget: OrderIsDelivered(
                         order:order,
                         orderId: order.orderId!,
                         orderNo: order.orderNo!,
                         noOfBags: order.numberOfBags!,
                       ));
                     },
                     icon: Icon(
                       Icons.check_circle_rounded,
                       size: 20.0,
                     ),
                     label: Text("Delivry"))
                ]),
          ],
        ),
      ),
    );
  }


}
