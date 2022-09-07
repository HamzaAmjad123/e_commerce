import 'package:e_commerce/provider/order_log_provider.dart';
import 'package:e_commerce/service/order_log_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../configs/color.dart';
import '../../../configs/color.dart';
import '../../../configs/text_style.dart';
import '../../../helper_services/custom_loader.dart';
import '../../../model/order_log_model.dart';

class OrderLogScreen extends StatefulWidget {
  final int status;
  final int id;
  final double totalAmount;

  OrderLogScreen({required this.id,required this.status,required  this.totalAmount});

  @override
  State<OrderLogScreen> createState() => _OrderLogScreenState();
}

class _OrderLogScreenState extends State<OrderLogScreen> {
  getOrderLog() async {
    CustomLoader.showLoader(context: context);
    await OrderLogService().getOrderLog(context: context, id: widget.id);
    CustomLoader.hideLoader(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getOrderLog();
    });
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: bgColor,
          title: Text(
            "OrderDetails",
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Consumer<OrderLogProvider>(builder: (context, order, _) {
                return order.orderLog != null
                    ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.check_circle_rounded,size: 30.0,color: getColor(1)),
                        Expanded(
                          child: Container(
                            height: 1.0,
                            color: blackColor,
                            margin: EdgeInsets.only(top: 12.0),
                          ),
                        ),
                        Icon(Icons.check_circle_rounded,size: 30.0,color:  getColor(3)),
                        Expanded(
                          child: Container(
                            height: 1.0,
                            margin: EdgeInsets.only(top: 12.0),
                            color: blackColor,
                          ),
                        ),
                        Icon(Icons.check_circle_rounded,size: 30.0,color:  getColor(4)),
                        Expanded(
                          child: Container(
                            height: 1.5,
                            margin: EdgeInsets.only(top: 12.0),
                            color: blackColor,
                          ),
                        ),
                        Icon(Icons.check_circle_rounded,size: 30.0,color:  getColor(5)),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Approved",style: statusStyle),
                          Text("Processing",style: statusStyle,),
                          Text("Shipment",style: statusStyle,),
                          Text("Delivered",style: statusStyle,)
                        ],
                      ),
                    ),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: order.orderLog!.length,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext, index) {
                          return OrderLogWidget(
                            orderlog: order.orderLog![index],
                            totalAmount: widget.totalAmount.toString(),
                          );
                        }),
                  ],
                )
                    : Container();
              }),
            ],
          ),
        ));
  }

  getColor(int x) {
    if(widget.status==x)
      {
        return Colors.red;
      }
    else if(x<widget.status){
      return Color(0xFF1cbcb3);
    }
    else{
      return Colors.black12;
    }
  }

}

class OrderLogWidget extends StatelessWidget {
  OrderLogModel orderlog;
  String? totalAmount;

  OrderLogWidget({required this.orderlog,this.totalAmount});

  @override
  Widget build(BuildContext context) {
    String date = orderlog.createdDate!;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            padding: EdgeInsets.only(bottom: 10, left: 15, right: 15, top: 10),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "OrderNO:" + "  " + "${orderlog.orderId}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(totalAmount!,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    orderlog.description!,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 14),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Date: ${getFormatedDate(date)}",
                      style: TextStyle(height: 1.4),
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 8.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                                color: orderlog.status == 1
                                    ? Colors.red
                                    : Colors.green)),
                        child: Text(orderlog.status == 1
                            ? "Pending"
                            : orderlog.status == 2
                                ? "Approved"
                                : orderlog.status == 3
                                    ? "Processing"
                                    : orderlog.status == 4
                                        ? "On Way"
                                        : orderlog.status == 5
                                            ? "Deliver"
                                            : "")),
                  ],
                ),
              ],
            )),
      ],
    );
  }

  getFormatedDate(_date) {
    var inputFormat = DateFormat('yyyy-MM-dd');
    var inputDate = inputFormat.parse(_date);
    var outputFormat = DateFormat('dd/MM/yyyy');
    return outputFormat.format(inputDate);
  }
}
