import 'package:e_commerce/Admin_Module/screens/dashboard/stock/widgets/stock_edit.dart';
import 'package:e_commerce/screens/Dealer/home/custom_drawer.dart';
import 'package:flutter/material.dart';
import '../../../configs/color.dart';
import '../../../configs/text_style.dart';
import '../../helper_widget/custom_app_bar.dart';
import 'account/account_screen.dart';
import 'orders/admin_orders_screen.dart';
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
     StockScreen(),
     OrdersList(),
     AccountsScreen(),
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
          ?AppBar(
        elevation: 0.0,
        backgroundColor: bgColor,
        title: Text("Stock List",style: barStyle,),
        centerTitle: true,
      )
          : _selectedIndex == 1
              ? AppBar(title: Text("Orders List"),)
              : _selectedIndex == 2
                  ? AppBar(
        elevation: 0.0,
        title: Text("Accounts",style: barStyle,),
        centerTitle: true,
        backgroundColor: bgColor,
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
