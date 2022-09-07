import 'package:e_commerce/configs/color.dart';
import 'package:e_commerce/provider/order_getDeatils_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../helper_services/custom_loader.dart';
import '../../../service/order_view_service.dart';

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

  void getOrderDetails() async {
    CustomLoader.showLoader(context: context);
    await OrderViewService().getOrderDetails(context: context, id: widget.id);
    CustomLoader.hideLoader(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text(
          "OrderDetails",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Consumer<OrderDetailsProvider>(builder: (context, order, _) {
              // String date=order.orderDetails!.date!;
              return order.orderDetails != null
                  ? Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0.0, 15.0),
                                blurRadius: 15.0),
                            BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0.0, -10.0),
                                blurRadius: 10.0),
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                // "OrderDate:" + order.orderDetails!.date!,
                                "2022-08-10",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "OrderNo:" + "${order.orderDetails!.orderNo}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Divider(
                            height: 1,
                            thickness: 1,
                            color: bgColor,
                          ),
                          Center(
                              child: Text(
                            "Dealer Name: " + order.orderDetails!.dealer!.name!,
                          )),
                          Text(
                            "Items",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                          order.orderDetails!.orderLines!.length == 0
                              ? Center(
                                  child: Text("No Data Availbles"),
                                )
                              : ListView.builder(
                                  shrinkWrap: true,
                                  primary: false,
                                  itemCount:
                                      order.orderDetails!.orderLines!.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            order.orderDetails!
                                                .orderLines![index].item!.name!,
                                          ),
                                          Text(
                                              "${order.orderDetails!.orderLines![index].item!.unitPrice}"),
                                          Text(
                                              "${order.orderDetails!.orderLines![index].descountPrice}"),
                                          Text(
                                              "${order.orderDetails!.orderLines![index].quantity}"),
                                          Text(
                                              "${order.orderDetails!.orderLines![index].totalAmount}")
                                        ],
                                      ),
                                    );
                                  }),
                          Divider(
                            height: 1,
                            thickness: 1,
                            color: bgColor,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "ToTal Price:",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "${order.orderDetails!.totalAmount}",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  : Container();
            }),
          ],
        ),
      ),
    );
  }

  // getFormatedDate(_date) {
  //   var inputFormat = DateFormat('yyyy-MM-dd');
  //   var inputDate = inputFormat.parse(_date);
  //   var outputFormat = DateFormat('dd/MM/yyyy');
  //   return outputFormat.format(inputDate);
  // }
}
