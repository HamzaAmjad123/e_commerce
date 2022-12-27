import 'package:e_commerce/screens/Dealer/home/custom_drawer.dart';
import 'package:flutter/material.dart';
import '../../../configs/color.dart';
import '../../helper_widget/custom_app_bar.dart';
import 'account/account_screen.dart';
import 'orders/order_list.dart';
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
    const OrdersList(),
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
              ? PreferredSize(
                  preferredSize:
                      const Size.fromHeight(100.0), // here the desired height
                  child: AppBar(
                    centerTitle: true,
                    title: const Text('Orders'),
                    bottom: TabBar(
                      indicatorColor: bgColor,
                      controller: _tabController,
                      tabs: const <Widget>[
                        Tab(
                          icon: Text('Orders'),
                        ),
                        Tab(
                          icon: Text('Pending Orders'),
                        ),
                      ],
                    ),
                    leading: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AdminDashboardScreen()),
                          );
                        },
                        icon: Icon(Icons.arrow_back)),
                  ),
                )
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
      body: _selectedIndex == 0
          ? SizedBox(
              height: size.height,
              width: size.width,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    widgets.elementAt(_selectedIndex),
                  ],
                ),
              ),
            )
          : _selectedIndex == 1
              ? TabBarView(
                  controller: _tabController,
                  children: const <Widget>[
                    Center(
                      child: OrderWidget(),
                    ),
                    Center(
                      child: PendingOrders(),
                    ),
                  ],
                )
              : _selectedIndex == 2
                  ? SizedBox(
                      height: size.height,
                      width: size.width,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            widgets.elementAt(_selectedIndex),
                          ],
                        ),
                      ),
                    )
                  : const SizedBox(),
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
