import 'package:e_commerce/provider/order_log_provider.dart';
import 'package:e_commerce/service/order_log_services.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../configs/color.dart';
import '../../helper_services/custom_loader.dart';
import '../../model/order_log.dart';

class OrderLogScreen extends StatefulWidget {
 final  int id;

  OrderLogScreen({required this.id});

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
          title: Text("OrderDetails",style: TextStyle(color: Colors.white),),
          leading: IconButton(
            icon: Icon(Icons.arrow_back,color: Colors.white,),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          children: [
            Consumer<OrderLogProvider>(builder: (context, order, _){
            return order.orderLog !=null?  ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: order.orderLog!.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (BuildContext,index){
                  return OrderLogWidget(
                    orderlog: order.orderLog![index],
                  );
                }):Container();
            }),
          ],
        ));
  }
}

class OrderLogWidget extends StatelessWidget {
  OrderLog orderlog;
   OrderLogWidget({required this.orderlog});

  @override
  Widget build(BuildContext context) {
    String date=orderlog.createdDate!;
    return Container(
      height: 110,
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      padding: EdgeInsets.only(bottom: 1,left: 15,right: 15),
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
          SizedBox(height: 10,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "OrderNO:" + "  "+"0013",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                // "OrderDate:" + order.orderDetails!.date!,
                "Total Amount:" + "  "+"872.0",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),

            ],),
          SizedBox(height: 10,),
         Center(child:  Text(orderlog.description!,style: TextStyle(color: Colors.black,fontWeight:FontWeight.w800,fontSize: 14),),),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Date: ${getFormatedDate(date)}",style: TextStyle(height: 1.4),),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                          color: orderlog.status==1?Colors.red:Colors.green
                      )
                  ),
                  child: Text(orderlog.status==1? "Pending":orderlog.status==2?"Approved":orderlog.status==3?"Processing":orderlog.status==4?"On Way":orderlog.status==5?"Deliver":"")),
            ],
          )
        ],
        ));
  }
  getFormatedDate(_date) {
    var inputFormat = DateFormat('yyyy-MM-dd');
    var inputDate = inputFormat.parse(_date);
    var outputFormat = DateFormat('dd/MM/yyyy');
    return outputFormat.format(inputDate);
  }
}

