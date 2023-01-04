import 'package:e_commerce/configs/color.dart';
import 'package:e_commerce/configs/text_style.dart';
import 'package:e_commerce/helper_services/custom_loader.dart';
import 'package:e_commerce/helper_services/navigation_services.dart';
import 'package:e_commerce/provider/order_list_provider.dart';
import 'package:e_commerce/provider/user_data_provider.dart';
import 'package:e_commerce/utils/functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../configs/ui.dart';
import '../../../model/order_list_model.dart';
import '../../../service/order_list_service.dart';
import '../home/custom_drawer.dart';
import 'order_details_screen.dart';
import 'order_log_screen.dart';

class PreviousOrdersScreen extends StatefulWidget {
  const PreviousOrdersScreen({Key? key}) : super(key: key);

  @override
  State<PreviousOrdersScreen> createState() => _PreviousOrdersScreenState();
}

class _PreviousOrdersScreenState extends State<PreviousOrdersScreen> {
  _getOrderList() async {
  int tenantId=await getUserId();
  print("new id");
  print(tenantId);
    CustomLoader.showLoader(context: context);
    await OrderListService().getOrderList(skip: 0, take: 1000, tenatId: tenantId, context: context,searchText: _searchCont.text??"",fromDate: "",toDate: "");
    CustomLoader.hideLoader(context);
    setState(() {});
  }


  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getOrderList();
    });
    super.initState();
  }
TextEditingController _searchCont=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        leading: Builder(builder: (context)=>IconButton(onPressed: (){
          Scaffold.of(context).openDrawer();
        },
            icon: Icon(Icons.menu))),
        title: Text(
          "Order List",
          style: barStyle,
        ),
        elevation: 0,
        backgroundColor: bgColor,
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () {
      return    _getOrderList();
        },
        child: SingleChildScrollView(
          physics:AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              Stack(
               alignment: Alignment.topCenter,
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height*0.13,
                    decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        )
                    ),),
                  Container(
                    height: MediaQuery.of(context).size.height*0.10,
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    // decoration: BoxDecoration(
                    //   color: Colors.white,
                    // ),
                    child: TextField(
                      controller: _searchCont,
                      onSubmitted: (value){
                        _getOrderList();
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
                          suffixIcon: Icon(
                            Icons.search,
                            color: bgColor,
                          )),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Consumer<OrderListProvider>(builder: (context, orders, _) {
                return ListView.builder(
                    physics:NeverScrollableScrollPhysics(),
                    itemCount: orders.orderList!.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext, index) {
                      return OrderListWidget(
                        order: orders.orderList![index],
                      );
                    });
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderListWidget extends StatelessWidget {
  OrderList order;

  OrderListWidget({required this.order});

  @override
  Widget build(BuildContext context) {
    String date = order.date!;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20.0),
      margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 12.0),
      decoration: Ui.getBoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("PKR"+"${order.totalAmount}",style: TextStyle(color: bgColor,fontWeight: FontWeight.w600,fontSize: 14.0),),
              SizedBox(height: 10,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap:(){
                        NavigationServices.goNextAndKeepHistory(
                            context: context,
                            widget: OrderDetailsScreen(id: order.orderId!));
                      },
                      child: Container(
                        height: 35,
                        width: 60,
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
                            Icon(Icons.remove_red_eye,color: bgColor,size: 18,),

                            Text("view",style: TextStyle(fontSize: 12,color: bgColor),)
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap:(){
                        NavigationServices.goNextAndKeepHistory(
                            context: context,
                            widget: OrderLogScreen(order: order,));
                      } ,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        height: 35,
                        width: 65,
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
                            Icon(Icons.location_on,color: bgColor,size: 18,),
                            Text("Track",style: TextStyle(fontSize: 12,color: bgColor),)
                          ],
                        ),
                      ),
                    ),
                  ]),
            ],
          ),
          SizedBox(width: 5,),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("ORDER"+" "+"ID"+"${order.orderNo}",style: normalStyle,),
              SizedBox(height: 8,),
              Text("26,Oct,2022 3:00 Pm",style: normalStyle,),
              SizedBox(height: 8,),
              Text("Deliverd on 21 dec",style: rsStyle),
            ],
          )
        ],
      ),
    );
  }
}
