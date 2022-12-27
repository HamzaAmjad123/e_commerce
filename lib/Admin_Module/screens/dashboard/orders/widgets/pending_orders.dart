import 'package:flutter/material.dart';

import '../../../../../configs/color.dart';
import '../../../../helper_widget/custom_button.dart';

class PendingOrders extends StatefulWidget {
  const PendingOrders({super.key});

  @override
  State<PendingOrders> createState() => _PendingOrdersState();
}

class _PendingOrdersState extends State<PendingOrders> {
  final List _listdata3 = [
    {"productName": "Mobile", "Qty": "8", "Uprice": "240.0", "Price": "230.0"},
    {"productName": "Vivo", "Qty": "8", "Uprice": "240.0", "Price": "230.0"},
  ];

  final List<Map<String, dynamic>> _listdata4 = [
    {
      "OrderNO": "0114",
      "Amount": "2088",
      "Total": "37654",
      "Recieved": "43508",
      "dealer": "Dealer",
      "PhoneNumber": "(03249797364)",
      "date": "Dec 19, 2022, 11:28:10 AM"
    },
    {
      "OrderNO": "0114",
      "Amount": "2088",
      "Total": "37654",
      "Recieved": "43508",
      "dealer": "Dealer",
      "PhoneNumber": "(03249797364)",
      "date": "Dec 19, 2022, 11:28:10 AM"
    },
    {
      "OrderNO": "0114",
      "Amount": "2088",
      "Total": "37654",
      "Recieved": "43508",
      "dealer": "Dealer",
      "PhoneNumber": "(03249797364)",
      "date": "Dec 19, 2022, 11:28:10 AM"
    },
    {
      "OrderNO": "0114",
      "Amount": "2088",
      "Total": "37654",
      "Recieved": "43508",
      "dealer": "Dealer",
      "PhoneNumber": "(03249797364)",
      "date": "Dec 19, 2022, 11:28:10 AM"
    },
  ];
  bool isChecked = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: _listdata4.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            const Text('Order# '),
                            Text(_listdata4[index]["OrderNO"] ?? "Computer",
                                style: const TextStyle(fontSize: 14)),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomButton(
                          onTapEdit: () {},
                          onTapView: () {},
                          textView: 'View',
                          textEdit: 'Edit',
                          textApproval: 'Approcal or Cancel',
                          editOrder: isChecked,
                          pendingOrders: isChecked,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(_listdata4[index]["dealer"] ?? "",
                                style: const TextStyle(fontSize: 14)),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                                _listdata4[index]["PhoneNumber"] ??
                                    "(03XXXXXXXX)",
                                style: const TextStyle(fontSize: 14)),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                const Text('Amount: '),
                                Text(_listdata4[index]["Amount"] ?? "1234574",
                                    style: const TextStyle(fontSize: 14)),
                              ],
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Row(
                              children: [
                                const Text('Total: '),
                                Text(_listdata4[index]["Total"] ?? "",
                                    style: const TextStyle(fontSize: 14)),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(_listdata4[index]["date"] ?? "123",
                                style: const TextStyle(fontSize: 14)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  height: 22,
                  width: 60,
                  decoration: const BoxDecoration(
                      color: silverColor,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10))),
                  child: Center(
                    child: isChecked == true
                        ? Text(
                            'Approved',
                            style: TextStyle(color: whiteColor, fontSize: 12),
                          )
                        : Text(
                            'Pending',
                            style: TextStyle(color: whiteColor, fontSize: 12),
                          ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
