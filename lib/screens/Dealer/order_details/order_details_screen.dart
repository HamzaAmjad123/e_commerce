import 'package:e_commerce/configs/color.dart';
import 'package:e_commerce/provider/order_getDeatils_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../configs/text_style.dart';
import '../../../configs/ui.dart';
import '../../../helper_services/custom_loader.dart';
import '../../../service/order_view_service.dart';
import '../../../utils/functions.dart';

class OrderDetailsScreen extends StatefulWidget {
  final int id;

  OrderDetailsScreen({required this.id});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getOrderDetails();
    });
    setState(() {});
    super.initState();
  }
  @override
  void dispose() {
    // Never called
    print("Disposing first route");
    super.dispose();
  }


  void getOrderDetails() async {
    CustomLoader.showLoader(context: context);
    await OrderViewService().getOrderDetails(context: context, id: widget.id);
    CustomLoader.hideLoader(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          iconTheme: IconThemeData(color: whiteColor),
          centerTitle: true,
          title: Text(
            "Order Details",
            style: barStyle,
          ),
          elevation: 0.0,
          backgroundColor: whiteColor,
          flexibleSpace: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                )),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10), topLeft: Radius.circular(10)),
        ),
        child: Consumer<OrderDetailsProvider>(builder: (context, order, _) {
          return order.orderDetails != null
              ? Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Total Price",
                        style: titleStyle,
                      ),
                      Text(
                        "PkR:" + "  " + "${order.orderDetails!.totalAmount}",
                        style: rsStyle,
                      ),
                    ],
                  ),
                )
              : Container();
        }),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<OrderDetailsProvider>(builder: (context, order, _) {
              // String date=order.orderDetails!.date!;
              return order.orderDetails != null
                  ? Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 0.0),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 11.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "OrderDate:" +
                                "  " +
                                Methods().getDate(order.orderDetails!.date!),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),SizedBox(height: 10,),
                          order.orderDetails!.orderLines!.length == 0
                              ? Center(
                                  child: Text("No Data Availbles"),
                                )
                              :Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                  decoration:Ui.getBoxDecoration(),
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Text("Product",style: subtitleStyle,),
                                                flex: 2,
                                              ),
                                              Expanded(
                                                child: Text("Qty.",style: subtitleStyle,),
                                              ),
                                              Expanded(
                                                child: Text("U-Price",style: subtitleStyle,),
                                              ),
                                              // Expanded(
                                              //   child: Text("Dealer",style: subtitleStyle,),
                                              // ),
                                              Expanded(
                                                child: Text("Price",style: subtitleStyle,),
                                              ),
                                            ]
                                        ),
                                        Divider(
                                          color: bgColor,
                                          thickness: 2,
                                        ),
                                        ListView.builder(
                                            shrinkWrap: true,
                                            primary: false,
                                            itemCount:
                                            order.orderDetails!.orderLines!.length,
                                            itemBuilder: (context, index) {
                                              return Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child:Row(
                                                      children: [
                                                        Text(order
                                                            .orderDetails!
                                                            .orderLines![
                                                        index]
                                                            .item!
                                                            .name!.length>8?
                                                          order
                                                              .orderDetails!
                                                              .orderLines![
                                                          index]
                                                              .item!
                                                              .name!.substring(0,9):order
                                                            .orderDetails!
                                                            .orderLines![
                                                        index]
                                                            .item!
                                                            .name!,
                                                          style: prizeStyle,
                                                          overflow: TextOverflow.ellipsis,),
                                                        SizedBox(width: 3,),
                                                        Text("("+order
                                                            .orderDetails!
                                                            .orderLines![
                                                        index]
                                                            .item!
                                                            .series!.name!.substring(0,3)+")",
                                                        style: rsStyle,)
                                                      ],
                                                    ),
                                                    flex: 2,
                                                  ),

                                                  Expanded(
                                                    child: Text(
                                                        "${order.orderDetails!.orderLines![index].quantity}",
                                                        style: prizeStyle),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                        "${order.orderDetails!.orderLines![index].item!.unitPrice}",
                                                        style: prizeStyle),
                                                  ),
                                                  // Expanded(
                                                  //   child: Text(
                                                  //       "${order.orderDetails!.dealer!.name}",
                                                  //       style: prizeStyle),
                                                  // ),
                                                  //yhhhhhhhha sy start hy
                                                  Expanded(
                                                    child: Text(
                                                        "${order.orderDetails!.orderLines![index].totalAmount}",
                                                        style: prizeStyle),
                                                  ),
                                                ],
                                              );
                                            }),
                                      ]))
                        ],
                      ))
                  : Container();
            }),
          ],
        ),
      ),
    );
  }
}

// ListView.builder(
// shrinkWrap: true,
// primary: false,
// itemCount:
// order.orderDetails!.orderLines!.length,
// itemBuilder: (context, index) {
// return Card(
// shape: RoundedRectangleBorder(
// borderRadius:
// BorderRadius.circular(12.0)),
// margin:
// EdgeInsets.symmetric(vertical: 10.0),
// color: whiteColor,
// elevation: 10.0,
// child: Container(
// alignment: Alignment.center,
// height:
// MediaQuery.of(context).size.height /
// 8.0,
// padding: EdgeInsets.only(
// left: 15.0,
// top: 10.0,
// bottom: 10.0),
// child: Column(
// mainAxisAlignment:
// MainAxisAlignment.center,
// crossAxisAlignment:
// CrossAxisAlignment.center,
// children: [
// Row(
// mainAxisAlignment:
// MainAxisAlignment
//     .spaceBetween,
// crossAxisAlignment:
// CrossAxisAlignment.start,
// children: [
// Expanded(
// child: Column(
// mainAxisAlignment:
// MainAxisAlignment.start,
// crossAxisAlignment:
// CrossAxisAlignment
//     .start,
// children: [
// Text(
// "Product",
// style: subtitleStyle,
// ),
// Text(
// order
//     .orderDetails!
//     .orderLines![
// index]
//     .item!
//     .name!,
// style: prizeStyle),
// ],
// ),
// ),
// Container(
// margin: EdgeInsets.symmetric(
// horizontal: 8.0,
// vertical: 12.0),
// alignment: Alignment.center,
// height: MediaQuery.of(context)
//     .size
//     .height /
// 18.0,
// width: 1.0,
// color: blackColor,
// ),
// Expanded(
// child: Column(
// mainAxisAlignment:
// MainAxisAlignment.start,
// crossAxisAlignment:
// CrossAxisAlignment
//     .start,
// children: [
// Text(
// "Qty.",
// style: subtitleStyle,
// ),
// Text(
// "${order.orderDetails!.orderLines![index].quantity}",
// style: prizeStyle),
// ],
// ),
// ),
// Container(
// margin: EdgeInsets.symmetric(
// horizontal: 8.0,
// vertical: 12.0),
// alignment: Alignment.center,
// height: MediaQuery.of(context)
//     .size
//     .height /
// 18.0,
// width: 1.0,
// color: blackColor,
// ),
// Expanded(
// child: Column(
// mainAxisAlignment:
// MainAxisAlignment.start,
// crossAxisAlignment:
// CrossAxisAlignment
//     .start,
// children: [
// Text(
// "U-Price",
// style: subtitleStyle,
// ),
// Text(
// "${order.orderDetails!.orderLines![index].item!.unitPrice}",
// style: prizeStyle),
// ],
// ),
// ),
// Container(
// margin: EdgeInsets.symmetric(
// horizontal: 8.0,
// vertical: 12.0),
// alignment: Alignment.center,
// height: MediaQuery.of(context)
//     .size
//     .height /
// 18.0,
// width: 1.0,
// color: blackColor,
// ),
// Expanded(
// child: Column(
// mainAxisAlignment:
// MainAxisAlignment.start,
// crossAxisAlignment:
// CrossAxisAlignment
//     .start,
// children: [
// Text(
// "Dealer",
// style: subtitleStyle,
// ),
// Text(
// "${order.orderDetails!.dealer!.name}",
// style: prizeStyle),
// ],
// ),
// ),
// Container(
// margin: EdgeInsets.symmetric(
// horizontal: 8.0,
// vertical: 12.0),
// alignment: Alignment.center,
// height: MediaQuery.of(context)
//     .size
//     .height /
// 18.0,
// width: 1.0,
// color: blackColor,
// ),
// Expanded(
// child: Column(
// mainAxisAlignment:
// MainAxisAlignment.start,
// crossAxisAlignment:
// CrossAxisAlignment
//     .start,
// children: [
// Text(
// "Price",
// style: subtitleStyle,
// ),
// Text(
// "${order.orderDetails!.orderLines![index].totalAmount}",
// style: prizeStyle)
// ],
// ),
// ),
// ],
// ),
// ],
// ),
// ),
// );
// }),
