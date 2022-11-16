import 'package:e_commerce/provider/Rider_providers/rider_history_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../configs/color.dart';
import '../../../configs/text_style.dart';
import '../../../helper_services/navigation_services.dart';
import '../../../model/rider_models/rider_order_model.dart';
import '../../../utils/functions.dart';
import '../../Dealer/order_details/order_details_screen.dart';

class RiderHistoryScreen extends StatefulWidget {
  final bool isShow;
  RiderHistoryScreen({ this.isShow=true});

  @override
  State<RiderHistoryScreen> createState() => _RiderHistoryScreenState();
}

class _RiderHistoryScreenState extends State<RiderHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return widget.isShow==true?RiderHistory()
        : Scaffold(
        appBar: AppBar(
          backgroundColor: bgColor,
          title: Text(
            "Rider screen",
            style: TextStyle(color: Colors.white),
          ),

        ),
      body: RiderHistory(),
    );
  }
}

class RiderHistory extends StatefulWidget {
  const RiderHistory({Key? key}) : super(key: key);

  @override
  State<RiderHistory> createState() => _RiderHistoryState();
}

class _RiderHistoryState extends State<RiderHistory> {
  @override
  Widget build(BuildContext context) {
    return Consumer<RiderHistoryProvider>(builder: (context,history,_){
      return  ListView.builder(
          itemCount: history.historyList!.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          primary: false,
          itemBuilder: (BuildContext,index){
            return RiderHistoryWidget(orderHistory:history.historyList![index] );
          });
    });
  }
}



class RiderHistoryWidget extends StatelessWidget {
  RiderOrdersModel orderHistory;

  RiderHistoryWidget({required this.orderHistory});

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
                  "Order No: ${orderHistory.orderNo}",
                  style: orderStyle,
                )),
            Divider(
              color: Colors.black38,
            ),
            ListTile(
              leading:orderHistory.cargoReciptImage==null?Container(
                height: 45.0,width: 45.0,
                child: Image.asset("assets/images/book.jpg"),

              ):Container(
                height: 45.0,
                width: 45.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        getImageAddress(
                      orderHistory.cargoReciptImage!
                    ),
                    )
                  )
                ),
               // child: Image.network("https://pos.impliessolutions.com/${orderHistory.cargoReciptImage}"),
              ),
              title: Text(
                "Date: ${Methods().getFormatedDate(orderHistory.date)}",
                style: TextStyle(height: 1.4),
              ),
              trailing: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                          color:
                          orderHistory.status == 1 ? Colors.red : Colors.green)),
                  child: Text(orderHistory.status == 1
                      ? "Pending"
                      : orderHistory.status == 2
                      ? "Approved"
                      : orderHistory.status == 3
                      ? "Processing"
                      : orderHistory.status == 4
                      ? "Shipment"
                      : orderHistory.status == 5
                      ? "Delivered":
                  orderHistory.status == 6
                      ?"Cancel"
                      : "")),
            ),
            Text(
              "Amount ${orderHistory.totalAmount}",
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
                  Container(),
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          primary: bgColor),
                      onPressed: () {
                        NavigationServices.goNextAndKeepHistory(
                            context: context,
                            widget: OrderDetailsScreen(id: orderHistory.orderId!));
                      },
                      icon: Icon(
                        Icons.remove_red_eye,
                        size: 20.0,
                      ),
                      label: Text("View")),
                ]),
          ],
        ),
      ),
    );
  }

  String getImageAddress(String cargoReciptImage) {
    print(cargoReciptImage);
    String str = cargoReciptImage;
    print(str);
    String string= "https://pos.impliessolutions.com/"+str.replaceAll("\\", "/");
     return string;
  }


}