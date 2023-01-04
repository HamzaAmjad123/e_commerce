import 'package:e_commerce/configs/color.dart';
import 'package:e_commerce/configs/text_style.dart';
import 'package:e_commerce/helper_services/custom_loader.dart';
import 'package:e_commerce/helper_services/navigation_services.dart';
import 'package:e_commerce/screens/Dealer/generate_order/generate_order_screen.dart';
import 'package:e_commerce/screens/Dealer/home/custom_drawer.dart';
import 'package:e_commerce/screens/Dealer/home/dashboard_screens/cash_in_hand_widget.dart';
import 'package:e_commerce/screens/Dealer/home/dashboard_screens/home_screen_widget.dart';
import 'package:e_commerce/service/cash_book_service.dart';
import 'package:e_commerce/service/categories_service.dart';
import 'package:e_commerce/service/level_services.dart';
import 'package:e_commerce/service/series_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../configs/dialogues/show_will_pop_dialog.dart';
import '../../../provider/user_data_provider.dart';
import '../../../service/order_list_service.dart';
import 'dashboard_screens/approved_orders.dart';
import 'dashboard_screens/orders_screen.dart';

class DashBoardScreen extends StatefulWidget {
  int tenatId;

  DashBoardScreen({required this.tenatId});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  _getServices() async {
    CustomLoader.showLoader(context: context);
    await CategoriesService().getCategory(
        context: context, tenantId: widget.tenatId, skip: 0, take: 1000);
    await LevelService().getLevel(context: context);
    await SeriesServices().getSeries(
        context: context, tenantid: widget.tenatId, skip: 0, take: 1000);
    CustomLoader.hideLoader(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getServices();
    });
    super.initState();
  }

  static List<Widget> _widgetsList = [
    // GenerateOrderWidget(),
    HomeScreen(),
    CashInHandWidget(),
    // ApprovedOrdersScreen(),
    OrdersScreen(),
  ];
  int? _selectedIndex = 0;

  void onitemtapped(int index) {
    _selectedIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showCupertinoModalPopup(
            context: context,
            builder: (context) {
              return showWillPopDialog(context);
            });
        return shouldPop!;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: CustomDrawer(),
        appBar: _selectedIndex == 0
            ? AppBar(
                elevation: 0,
                leading: Builder(
                    builder: (context) => IconButton(
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                        icon: Icon(Icons.menu))),
                backgroundColor: bgColor,
                title: Text(
                  "Dashboard",
                  style: barStyle,
                ),
                actions: [
                  CustomTextButton(),
                ],
                centerTitle: true,
              )
            : _selectedIndex == 1
                ? AppBar(
                    leading: Builder(
                        builder: (context) => IconButton(
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                            icon: Icon(Icons.menu))),
                    backgroundColor: bgColor,
                    elevation: 0,
                    title: Text(
                      "CashBook",
                      style: barStyle,
                    ),
                    actions: [
                      CustomTextButton(),
                    ],
                    centerTitle: true,
                  )
                : AppBar(
                    leading: Builder(
                        builder: (context) => IconButton(
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                            icon: Icon(Icons.menu))),
                    title: Text(
                      "Order List",
                      style: barStyle,
                    ),
                    elevation: 0,
                    backgroundColor: bgColor,
                    actions: [
                      CustomTextButton(),
                    ],
                    centerTitle: true,
                  ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.dashboard,
                color: whiteColor,
              ),
              label: "DashBoard",
            ),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.book), label: "Cashbook"),
            // BottomNavigationBarItem(icon: Icon(Icons.pending),label: "Pending Order"),
            // BottomNavigationBarItem(
            //     icon: Icon(Icons.money), label: "Orders History"),
            BottomNavigationBarItem(icon: Icon(Icons.money), label: "Orders"),
          ],
          onTap: onitemtapped,
          currentIndex: _selectedIndex!,
          backgroundColor: bgColor,
          selectedLabelStyle:
              TextStyle(color: whiteColor, fontWeight: FontWeight.bold),
          selectedItemColor: whiteColor,
          unselectedItemColor: whiteColor,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _widgetsList.elementAt(_selectedIndex!),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 9.0),
      child: TextButton(
        onPressed: () {
          NavigationServices.goNextAndKeepHistory(
              context: context, widget: GenerateOrderScreen());
        },
        child: Text(
          "Order Now",
          style: TextStyle(color: whiteColor),
        ),
      ),
    );
  }
}
