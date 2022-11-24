import 'package:e_commerce/helper_services/custom_loader.dart';
import 'package:e_commerce/service/marked_as_delivered_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../configs/color.dart';
import '../../../../configs/text_style.dart';
import '../../../../configs/ui.dart';
import '../../../../helper_services/custom_loader.dart';
import '../../../../helper_services/custom_loader.dart';
import '../../../../helper_services/navigation_services.dart';
import '../../../../model/dealer_orders_model.dart';
import '../../../../provider/dealer_history_provider.dart';
import '../../../../service/dealer_history_service.dart';
import '../../../../utils/handlers.dart';
import '../../order_details/objection_screen.dart';
import '../../order_details/order_details_screen.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({Key? key}) : super(key: key);

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {

  // _orderSearchHistoryHandler()async{
  //   CustomLoader.showLoader(context: context);
  //   await DealerHistoryService().getDelaerHistory(skip: 0, take: 1000,searchText: _searchCont.text??"",toDate: "",formDate: "", context: context);
  //   CustomLoader.hideLoader(context);
  // }

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      orderSearchHistoryHandler(context, _searchCont.text ?? "");
    });
    super.initState();
  }

  TextEditingController _searchCont = TextEditingController();
  bool enableSearch=false;
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.13,
                decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    )
                ),),
              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.10,
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                // decoration: BoxDecoration(
                //   color: Colors.white,
                // ),
                child: TextField(
                  controller: _searchCont,
                  onSubmitted: (value) {

                    orderSearchHistoryHandler(context, _searchCont.text ?? "");
                    enableSearch=true;
                    setState(() {

                    });

                  },
                  decoration: InputDecoration(

                      fillColor: whiteColor,
                      filled: true,
                      hintText: "Search",
                      contentPadding:
                      EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(color: bgColor, width: 1.3)),
                      suffixIcon: IconButton(
                        onPressed: (){
                          enableSearch?orderSearchHistoryHandler(context,""):orderSearchHistoryHandler(context, _searchCont.text ?? "");

                          enableSearch=!enableSearch;
                          setState(() {

                          });
                        },
                        icon:Icon(
                          enableSearch?Icons.close:Icons.search,
                          color: bgColor,

                        )
                      )),
                ),
              ),
            ],
          ),


          Padding(
            padding: const EdgeInsets.only(top: 15.0,bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                    onTap: (){
                      selectedIndex=0;
                      setState(() {

                      });
                    },
                    child: Text("Shipped Orders",style: TextStyle(color: selectedIndex==0?bgColor:blackColor,fontSize: selectedIndex==0?16.0:14.0,fontWeight: selectedIndex==0?FontWeight.bold:FontWeight.normal),)),
                InkWell(
                    onTap: (){
                      selectedIndex=1;
                      setState(() {

                      });
                    },
                    child: InkWell(child: Text("Pending Orders",style: TextStyle(color: selectedIndex==1?bgColor:blackColor,fontSize: selectedIndex==1?16.0:14.0,fontWeight: selectedIndex==1?FontWeight.bold:FontWeight.normal),),))]),
          ),
          Consumer<DealerHistoryProvider>(builder: (context, orders, _) {
            return
              selectedIndex==0?
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: orders.history!.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (BuildContext, index) {
                  return orders.history![index].status==4?OrderHistoryWidget(
                    order: orders.history![index],
                  ):SizedBox();
                }):
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: orders.history!.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext, index) {
                    return orders.history![index].status!=4?OrderHistoryWidget(
                      order: orders.history![index],
                    ):SizedBox();
                  });

          }),

            ],
          )

    );
  }

}

class OrderHistoryWidget extends StatefulWidget {
  OrderHistory order;

  OrderHistoryWidget({required this.order});


  @override
  State<OrderHistoryWidget> createState() => _OrderHistoryWidgetState();
}

class _OrderHistoryWidgetState extends State<OrderHistoryWidget> {
  _markAsDeliveredHandler() async {
    CustomLoader.showLoader(context: context);
    await MarkAsDeliveredService().markAsDelivered(
        context: context, orderId: widget.order.orderId!);
    CustomLoader.hideLoader(context);
  }

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
              Text("PKR" + "${widget.order.totalAmount}", style: TextStyle(
                  color: bgColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.0),),
              SizedBox(height: 10,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        NavigationServices.goNextAndKeepHistory(
                            context: context,
                            widget: OrderDetailsScreen(
                                id: widget.order.orderId!));
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
                              Icons.remove_red_eye, color: bgColor, size: 18,),
                            SizedBox(
                              width: widget.order.status == 4 ? 0.0 : 10.0,
                            ),
                            Text("view", style: TextStyle(fontSize: widget.order
                                .status == 4 ? 12.0 : 16.0,
                                color: bgColor,
                                fontWeight: widget.order.status == 4
                                    ? FontWeight.normal
                                    : FontWeight.w500),)
                          ],
                        ),
                      ),
                    ),
                    widget.order.status == 4 ? InkWell(

                      onTap: () {
                        buildShowObjectionDialog(context);
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal:

                        5),
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
                            Icon(Icons.location_on, color: bgColor, size: 18,),
                            Text("Action", style: TextStyle(
                                fontSize: 14, color: bgColor),)
                          ],
                        ),
                      ),
                    ) : SizedBox(),
                  ]),
            ],
          ),
          SizedBox(width: widget.order.status == 4 ? 5.0 : 25.0,),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("ORDER" + " " + "No" + " " + "${widget.order.orderNo}",
                style: normalStyle,),
              SizedBox(height: 8,),
              Text("26,Oct,2022 3:00 Pm", style: normalStyle,),
              Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.3,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 8.0),
                  padding: EdgeInsets.symmetric(vertical: 2.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Status :", style: subtitleStyle,),
                      SizedBox(width: widget.order.status == 7 ? 0 : 5,),
                      Expanded(
                        child: Text(widget.order.status == 1
                            ? "Pending"
                            : widget.order.status == 2
                            ? "Approved"
                            : widget.order.status == 3
                            ? "Processing"
                            : widget.order.status == 4
                            ? "Shipped"
                            : widget.order.status == 5
                            ? "Delivered" :
                        widget.order.status == 6
                            ? "Cancel"
                            : widget.order.status == 7
                            ? "Ready To Shippment"
                            : "",
                          overflow: TextOverflow.ellipsis,
                          style: widget.order.status == 7
                              ? statusStyle
                              : rsStyle,),
                      )
                    ],)),

            ],
          )
        ],
      ),
    );;
  }

  buildShowObjectionDialog(BuildContext context) async {
    return showDialog(context: context, builder: (context) {
      return Dialog(
        child: Container(
          height: 150.0,
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
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(Icons.close),
                      ))),
              // Text("Mark As Delivered"),
              TextButton(onPressed: () async {
                await _markAsDeliveredHandler();
                await orderSearchHistoryHandler(context, "");
                Navigator.pop(context);
                setState(() {});
              }, child: Text("Mark As Delivered")),
              TextButton(onPressed: () {
                NavigationServices.goNextAndKeepHistory(
                    context: context,
                    widget: ObjectionScreen(

                      orderId: widget.order.orderId!,


                    ));
              }, child: Text("Create Objection")),

            ],
          ),
        ),
      );
    });
  }
}