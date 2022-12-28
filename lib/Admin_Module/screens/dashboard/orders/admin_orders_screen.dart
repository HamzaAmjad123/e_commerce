
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../configs/api_urls.dart';
import '../../../../configs/color.dart';
import '../../../../configs/text_style.dart';
import '../../../../configs/ui.dart';
import '../../../../helper_services/custom_loader.dart';
import '../../../../helper_services/navigation_services.dart';
import '../../../../helper_widgets/custom_orders_widgets.dart';
import '../../../../model/admin_models/pending_orders_model.dart';
import '../../../../provider/admin_provider/pending_orders_provider.dart';
import '../../../../screens/Dealer/order_details/objection_screen.dart';
import '../../../../screens/Dealer/order_details/order_details_screen.dart';
import '../../../../service/Admin_Sercvice/pending_order_service.dart';
import '../../../../utils/functions.dart';

class OrdersList extends StatefulWidget {
  const OrdersList({Key? key}) : super(key: key);

  @override
  State<OrdersList> createState() => _OrdersListState();
}

class _OrdersListState extends State<OrdersList> {
  int selectedIndex=0;

  _pendingOrderHandler()async{
    CustomLoader.showLoader(context: context);
    await PendingOrdersService().getPendingOrders(context: context, dealerId: 0, fromDate: "", toDate: "", skip: 0, take: 1000);
    CustomLoader.hideLoader(context);
  }
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _pendingOrderHandler();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     return Card(
        margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 10.0),
                    child: Text(
                      "Orders",
                      style: ordersStyle,
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomOrderWidget(
                          orderText: "Orders",
                          color: selectedIndex == 0 ? true : false,
                          onTap: () {
                            selectedIndex = 0;
                            setState(() {});
                          },
                        ),
                        CustomOrderWidget(
                          orderText: "Pending Orders",
                          color: selectedIndex == 1 ? true : false,
                          onTap: () {
                            selectedIndex = 1;
                            setState(() {});
                          },
                        ),

                      ]),
                  Container(
                    height: 1.0,
                    width: double.infinity,
                    color: Colors.black26,
                    margin: EdgeInsets.only(bottom: 15.0),
                  ),
                  if(selectedIndex==0)
                    Text("In Progress"),
                if(selectedIndex==1)

                  Consumer<AdminPendingOrdersProvider>(builder: (context,order,_){
                    return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: order.pendingOrders!.length,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext, index) {
                          return  PendingOrderWidget(
                            order: order.pendingOrders![index],
                          );
                        });
                  },),

                ])));
  }
}

class PendingOrderWidget extends StatefulWidget {
  PendingOrdersList order;

  PendingOrderWidget({required this.order});

  @override
  State<PendingOrderWidget> createState() => _PendingOrderWidgetState();
}

class _PendingOrderWidgetState extends State<PendingOrderWidget> {
  // _markAsDeliveredHandler() async {
  //   CustomLoader.showLoader(context: context);
  //   await MarkAsDeliveredService()
  //       .markAsDelivered(context: context, orderId: widget.order.orderId!);
  //   CustomLoader.hideLoader(context);
  // }

  @override
  Widget build(BuildContext context) {
    String date = widget.order.date!;
    return Container(
      padding: const EdgeInsets.only(left: 10, top: 12.0, bottom: 12),
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
              Text(
                "PKR" + "${widget.order.totalAmount}",
                style: const TextStyle(
                    color: bgColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.0),
              ),
              SizedBox(
                height: 10,
              ),
              widget.order.status == 4
                  ? Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                      onTap: () {
                        showImageDialog(
                            context: context,
                            url:
                            "$baseUrl${widget.order.cargoReciptImage}");
                      },
                      child: Image.network(
                        "$baseUrl${widget.order.cargoReciptImage}",
                        height: 40.0,
                        width: 40.0,
                        fit: BoxFit.fill,
                      )),
                  InkWell(
                    onTap: () {
                      buildShowObjectionDialog(context);
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
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
                          Icon(
                            Icons.settings,
                            color: bgColor,
                            size: 18,
                          ),
                          Text(
                            "Action",
                            style:
                            TextStyle(fontSize: 14, color: bgColor),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
                  : GestureDetector(
                onTap: () {
                  NavigationServices.goNextAndKeepHistory(
                      context: context,
                      widget:
                      OrderDetailsScreen(id: widget.order.orderId!));
                },
                child: Container(
                  height: 35,
                  width: widget.order.status == 4 ? 60.0 : 100.0,
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: bgColor),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: widget.order.status == 4
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.remove_red_eye,
                        color: bgColor,
                        size: 18,
                      ),
                      SizedBox(
                        width: widget.order.status == 4 ? 0.0 : 10.0,
                      ),
                      Text(
                        "view",
                        style: TextStyle(
                            fontSize:
                            widget.order.status == 4 ? 12.0 : 16.0,
                            color: bgColor,
                            fontWeight: widget.order.status == 4
                                ? FontWeight.normal
                                : FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: widget.order.status == 4 ? 5.0 : 25.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "ORDER" + " " + "No" + " " + "${widget.order.orderNo}",
                style: normalStyle,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "26,Oct,2022 3:00 Pm",
                style: normalStyle,
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 8.0),
                  padding: EdgeInsets.symmetric(vertical: 2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Status :",
                        style: subtitleStyle,
                      ),
                      SizedBox(
                        width: widget.order.status == 7 ? 0 : 5,
                      ),
                      Expanded(
                        child: Text(
                          widget.order.status == 1
                              ? "Pending"
                              : widget.order.status == 2
                              ? "Approved"
                              : widget.order.status == 3
                              ? "Processing"
                              : widget.order.status == 4
                              ? "Shipped"
                              : widget.order.status == 5
                              ? "Delivered"
                              : widget.order.status == 6
                              ? "Cancel"
                              : widget.order.status == 7
                              ? "Ready To Shippment"
                              : "",
                          overflow: TextOverflow.ellipsis,
                          style:
                          widget.order.status == 7 ? statusStyle : rsStyle,
                        ),
                      )
                    ],
                  )),
            ],
          )
        ],
      ),
    );
    ;
  }

  buildShowObjectionDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              height: 250.0,
              width: 50.0,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Icon(Icons.close),
                          ))),
                  // Text("Mark As Delivered"),
                  TextButton(
                      onPressed: () async {
                        NavigationServices.goNextAndKeepHistory(
                            context: context,
                            widget:
                            OrderDetailsScreen(id: widget.order.orderId!));
                      },
                      child: Text("View")),
                  TextButton(
                      onPressed: () async {
                        // await _markAsDeliveredHandler();
                        // await orderSearchHistoryHandler(context, "");
                        Navigator.pop(context);
                        setState(() {});
                      },
                      child: Text("Mark As Delivered")),
                  TextButton(
                      onPressed: () {
                        NavigationServices.goNextAndKeepHistory(
                            context: context,
                            widget: ObjectionScreen(
                              orderId: widget.order.orderId!,
                            ));
                      },
                      child: Text("Create Objection")),
                ],
              ),
            ),
          );
        });
  }
}