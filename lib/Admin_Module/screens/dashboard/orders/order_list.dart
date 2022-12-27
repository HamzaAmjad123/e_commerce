
import 'package:flutter/material.dart';

import '../../../../configs/color.dart';

class OrdersList extends StatefulWidget {
  const OrdersList({super.key});

  @override
  State<OrdersList> createState() => _OrdersListState();
}

class _OrdersListState extends State<OrdersList>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 105),
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: whiteColor,
        height: 422,
        child: TabBar(
          tabs: const [
            Text('Orders', style: TextStyle(color: blackColor)),
            Text('Pending Orders', style: TextStyle(color: blackColor))
          ],
        ),
      ),
    );
  }
}
