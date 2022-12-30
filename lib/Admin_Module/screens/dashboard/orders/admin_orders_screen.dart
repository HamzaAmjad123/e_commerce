
import 'package:e_commerce/Admin_Module/screens/dashboard/orders/widgets/approved_order_widget.dart';
import 'package:e_commerce/Admin_Module/screens/dashboard/orders/widgets/pending_order_widget.dart';
import 'package:e_commerce/provider/admin_provider/approved_order_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../configs/text_style.dart';
import '../../../../helper_services/custom_loader.dart';
import '../../../../helper_widgets/custom_orders_widgets.dart';
import '../../../../provider/admin_provider/pending_orders_provider.dart';
import '../../../../service/Admin_Sercvice/approved_order_service.dart';
import '../../../../service/Admin_Sercvice/pending_order_service.dart';
import '../../../../utils/handlers.dart';


class OrdersList extends StatefulWidget {
  const OrdersList({Key? key}) : super(key: key);

  @override
  State<OrdersList> createState() => _OrdersListState();
}

class _OrdersListState extends State<OrdersList> {
  int selectedIndex=0;


  _approvedOrderHandler()async{
    CustomLoader.showLoader(context: context);
    await ApprovedOrdersService().getApprovedOrders(context: context, dealerId: 0, fromDate: "", toDate: "", skip: 0, take: 1000);
    CustomLoader.hideLoader(context);
  }
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      AdminPendingOrderHandler(context);
      _approvedOrderHandler();
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
                          orderText: "Approved Orders",
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
                    Consumer<AdminApprovedOrdersProvider>(builder: (context,order,_){
                      return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: order.approvedOrders!.length,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext, index) {
                            return  ApprovedOrderWidget(
                              order: order.approvedOrders![index],
                            );
                          });
                    },),
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


