import 'package:e_commerce/helper_services/custom_loader.dart';
import 'package:e_commerce/screens/Dealer/order/dealer_history_screen.dart';
import 'package:e_commerce/screens/Rider/widget/approved_widget.dart';
import 'package:e_commerce/screens/Rider/widget/history_widget.dart';
import 'package:e_commerce/service/rider_services/rider_history_service.dart';
import 'package:e_commerce/service/rider_services/rider_order_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../configs/color.dart';
import '../../provider/Rider_providers/rider_orders_provider.dart';
import '../Dealer/home/custom_drawer.dart';

class RiderHome extends StatefulWidget {
  const RiderHome({Key? key}) : super(key: key);

  @override
  State<RiderHome> createState() => _RiderHomeState();
}

class _RiderHomeState extends State<RiderHome> {
  _approvedHandler() async {
    CustomLoader.showLoader(context: context);
    await RiderOrdersService().getRiderOrderList(skip: 0, take: 1000, context: context);
    await RiderHistoryService().getRiderHistoryList(skip: 0, take: 1000, context: context);
    CustomLoader.hideLoader(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _approvedHandler();
    });
    super.initState();
  }

  static List<Widget> _widgetsList = [
    RiderApprovedOrder(),
    RiderHistory(),
  ];

  int selectedIndex = 0;
  void onItemTapped(int index) {
    selectedIndex = index;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: CustomDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.fastfood_rounded),
              label: "Approved Order",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: "Order History",
            ),
          ],
          onTap: onItemTapped,
          currentIndex: selectedIndex,
          backgroundColor: bgColor,
          selectedLabelStyle:
              TextStyle(color: whiteColor, fontWeight: FontWeight.bold),
          selectedItemColor: whiteColor,
          unselectedItemColor: whiteColor,
        ),
        appBar: AppBar(
          backgroundColor: bgColor,
          title: Text(
            "Rider screen",
            style: TextStyle(color: Colors.white),
          ),
          leading: Builder(builder: (context)=>IconButton(onPressed: (){
            Scaffold.of(context).openDrawer();

          },
              icon: Icon(Icons.menu))),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _widgetsList.elementAt(selectedIndex),
              ],
            ),
          ),
        ));
  }
}
