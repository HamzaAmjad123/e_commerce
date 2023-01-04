import 'package:e_commerce/provider/order_log_provider.dart';
import 'package:e_commerce/service/order_log_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../configs/color.dart';
import '../../../configs/text_style.dart';
import '../../../helper_services/custom_loader.dart';
import '../../../model/order_list_model.dart';
import '../../../model/order_log_model.dart';
import '../../../utils/functions.dart';

class OrderLogScreen extends StatefulWidget {
  final OrderList order;

  OrderLogScreen({required this.order});

  @override
  State<OrderLogScreen> createState() => _OrderLogScreenState();
}

class _OrderLogScreenState extends State<OrderLogScreen> {
  List<int> statusList=[];
  getOrderLog() async {
    CustomLoader.showLoader(context: context);
    print("order");
    print(widget.order);
    await OrderLogService()
        .getOrderLog(context: context, id: widget.order.orderId!);
    List<OrderLogModel>? list=Provider.of<OrderLogProvider>(context,listen: false).orderLog;
    await makeList(list);
    CustomLoader.hideLoader(context);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getOrderLog();
    });
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
        body: RefreshIndicator(
          onRefresh: () {
            return getOrderLog();
          },
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.13,
                      decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          )),
                    ),
                    Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(
                            top: 60, bottom: 20, left: 50, right: 50),
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 12.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color(0xFFffffff),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 15.0, // soften the shadow
                              spreadRadius: 5.0, //extend the shadow
                              offset: Offset(
                                3.0, // Move to right 5  horizontally
                                3.0, // Move to bottom 5 Vertically
                              ),
                            )
                          ],
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                "PKR" + "${widget.order.totalAmount!}",
                                style: TextStyle(
                                    color: bgColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.0),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "ORDER" +
                                    " " +
                                    "ID" +
                                    "${widget.order.orderId!}",
                                style: normalStyle,
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
                Consumer<OrderLogProvider>(builder: (context, order, _) {
                  return order.orderLog != null
                      ? ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.check_circle_rounded, size: 30.0,color: getColor(index+1)),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(getText(index),
                                      style: statusStyle,
                                    ),
                                    Text(Methods().getDate(order.orderLog![0].createdDate),
                                        style: statusStyle),
                                  ],
                                )
                              ],
                            ),
                            index==5?SizedBox():Container(
                              margin: EdgeInsets.only(left:MediaQuery.of(context).size.width * 0.32),
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: 2,
                              color: Colors.black12,
                            ),

                          ],
                        );
                      })
                      : Container();
                }),
              ],
            ),
          ),
        ));
  }

  String getText(int index) {
    return index==0?"Pending"
        :index==1?"Approved"
        :index==2?"Processing"
        :index==3?"On Way"
        :index==4?"Delivered"
    :"Cancelled";
  }

  makeList(List<OrderLogModel>? list) {
    list!.forEach((element) {
      statusList.add(element.status!);
    });
  }

  getColor(int i) {
    bool checker=false;
    for(int j=0;j<statusList.length;j++){
      if(statusList[j]==i){
        checker=true;
      }
    }
    if(checker){
     return bgColor;
    }else{
      return Colors.black38;
    }
  }
}

