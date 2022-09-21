import 'package:e_commerce/configs/color.dart';
import 'package:e_commerce/configs/text_style.dart';
import 'package:e_commerce/helper_services/custom_loader.dart';
import 'package:e_commerce/helper_services/navigation_services.dart';
import 'package:e_commerce/helper_widgets/custom_text_fild.dart';
import 'package:e_commerce/provider/dealer_history_provider.dart';
import 'package:e_commerce/provider/user_data_provider.dart';
import 'package:e_commerce/utils/functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../model/dealer_orders_model.dart';
import '../../../service/dealer_history_service.dart';
import 'order_details_screen.dart';

class ApprovedOrdersScreen extends StatefulWidget {
  const ApprovedOrdersScreen({Key? key}) : super(key: key);

  @override
  State<ApprovedOrdersScreen> createState() => _ApprovedOrdersScreenState();
}

class _ApprovedOrdersScreenState extends State<ApprovedOrdersScreen> {
  _getApprovedOrder() async {
    CustomLoader.showLoader(context: context);
    await DealerHistoryService().getDelaerHistory(
        skip: 0,
        take: 1000,
        dealerid: 4,
        tenatId: Provider.of<UserDataProvider>(context, listen: false)
            .user!
            .user!
            .tenantId!,
        context: context);
    CustomLoader.hideLoader(context);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getApprovedOrder();
    });
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Approved Orders",
          style: barStyle,
        ),
        backgroundColor: bgColor,
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return   _getApprovedOrder();
        },
        child: SingleChildScrollView(
          physics:AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: 40.0,
                margin: EdgeInsets.symmetric(vertical: 15.0),
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: TextField(
                  decoration: InputDecoration(
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
                        color: blackColor,
                      )),
                ),
              ),
              Consumer<DealerHistoryProvider>(builder: (context, orders, _) {
                return orders.results != null
                    ? ListView.builder(
                    physics:NeverScrollableScrollPhysics(),
                        itemCount: orders.results!.length,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext, index) {
                          return ApprovedOrderWidget(
                            order: orders.results![index],
                          );
                        })
                    : Container();
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class ApprovedOrderWidget extends StatelessWidget {
  Result order;

  ApprovedOrderWidget({required this.order});

  @override
  Widget build(BuildContext context) {
    String date = order.date!;
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
                "Date: ${Methods().getFormatedDate(date)}",
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
                                  ? "On Way"
                                  : order.status == 5
                                      ? "Deliver"
                                      : "")),
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
                            widget: OrderDetailsScreen(id: order.orderId!));
                      },
                      icon: Icon(
                        Icons.remove_red_eye,
                        size: 20.0,
                      ),
                      label: Text("View")),
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
      ),
    );
  }

}
