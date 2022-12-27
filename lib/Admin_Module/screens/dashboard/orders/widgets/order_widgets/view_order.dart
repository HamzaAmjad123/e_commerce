import 'package:flutter/material.dart';

import '../../../../../../configs/color.dart';

class ViewOrders extends StatefulWidget {
  const ViewOrders({super.key, required this.date, required this.listdata});
  final String date;
  final List listdata;
  @override
  State<ViewOrders> createState() => _ViewOrdersState();
}

class _ViewOrdersState extends State<ViewOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        elevation: 0,
        backgroundColor: whiteColor,
        title: const Text('Order Details'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(28),
                  bottomRight: Radius.circular(28))),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text(
              widget.date,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 25),
              width: double.infinity,
              decoration: BoxDecoration(
                color: whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Column(
                  children: [
                    const OrderDetailWidget(
                      productText: 'Product',
                      qtyText: 'Qty.',
                      uPrice: 'U-Price',
                      price: 'Price',
                    ),
                    const Divider(
                      height: 10,
                      thickness: 2,
                      indent: 8,
                      endIndent: 8,
                      color: bgColor,
                    ),
                    ListView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      primary: false,
                      itemCount: widget.listdata.length,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.listdata[index],
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderDetailWidget extends StatelessWidget {
  const OrderDetailWidget(
      {super.key,
      this.productText = '',
      this.qtyText = '',
      this.uPrice = '',
      this.price = ''});
  final String productText;
  final String qtyText;
  final String uPrice;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Title(
                  color: bgColor,
                  child: Text(
                    productText,
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: blackColor),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      qtyText,
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: blackColor),
                    ),
                    const SizedBox(
                      width: 23,
                    ),
                    Text(
                      uPrice,
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: blackColor),
                    ),
                    const SizedBox(
                      width: 23,
                    ),
                    Text(
                      price,
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: blackColor),
                    ),
                    const SizedBox(
                      width: 23,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
