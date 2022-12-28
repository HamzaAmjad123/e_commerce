import 'package:e_commerce/Admin_Module/screens/dashboard/stock/widgets/stock_edit.dart';
import 'package:e_commerce/screens/Dealer/home/custom_drawer.dart';
import 'package:flutter/material.dart';
import '../../../configs/color.dart';
import '../../helper_widget/custom_app_bar.dart';
import 'account/account_screen.dart';

import 'orders/admin_orders_screen.dart';
import 'orders/widgets/orders_widget.dart';
import 'orders/widgets/pending_orders.dart';
import 'stock/stock_screen.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;
  List<Widget> widgets = [
    const StockScreen(),
     OrdersList(),
    const Ledger(),
  ];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: _selectedIndex == 0? FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => StockEdit()),
          );
    },
    label: const Text('Create'),
    icon: const Icon(Icons.add),
    backgroundColor: bgColor,
    ):SizedBox(),
     drawer: CustomDrawer(),
      extendBodyBehindAppBar: true,
      appBar: _selectedIndex == 0
          ? CustomAppBar(
              title: 'Stock',
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
              leading: Builder(
                  builder: (context) => IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: const Icon(
                        Icons.menu,
                        size: 20,
                      ))),
            )
          : _selectedIndex == 1
              ? AppBar(title: Text("Orders List"),)
              : _selectedIndex == 2
                  ? CustomAppBar(
                      title: 'Accounts',
                      textStyle: const TextStyle(fontWeight: FontWeight.bold),
                      leading: IconButton(
                          onPressed: () {
                            Navigator.pop(context);

                            setState(() {});
                          },
                          icon: const Icon(
                            Icons.menu,
                            size: 20,
                          )),
                    )
                  : AppBar(),

      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(child: widgets.elementAt(_selectedIndex)),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: whiteColor,
        selectedFontSize: 16,
        currentIndex: _selectedIndex,
        selectedItemColor: bgColor,
        unselectedItemColor: Colors.black45,
        onTap: _onItemTapped,
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            label: 'Stock',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.electrical_services_sharp,
            ),
            label: " Orders",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
            ),
            label: " Account",
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    _selectedIndex = index;
    setState(() {});
  }
}
