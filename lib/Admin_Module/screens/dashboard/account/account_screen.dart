import 'package:e_commerce/configs/color.dart';
import 'package:flutter/material.dart';

import '../../../helper_widget/custom_button.dart';

class Ledger extends StatefulWidget {
  const Ledger({super.key});

  @override
  State<Ledger> createState() => _LedgerState();
}

class _LedgerState extends State<Ledger> {
  final List _listdata3 = [
    {"productName": "Mobile", "Qty": "8", "Uprice": "240.0", "Price": "230.0"},
    {"productName": "Vivo", "Qty": "8", "Uprice": "240.0", "Price": "230.0"},
  ];

  final List<Map<String, dynamic>> _listdata4 = [
    {
      "TotalAmount": "PKR348.0",
      "id": "50000",
      "order_no": "Oder ID 0010",
      "PhoneNumber": "(03244847427)",
      "Remaining": "-33453",
      "Total": "34566 ",
      "Recieved": "565 ",
    },
    {
      "TotalAmount": "PKR348.0",
      "Dealer": "admin",
      "order_no": "Oder ID 0210",
      "PhoneNumber": "(03244847427)",
      "Remaining": "-33453",
      "Total": "3456 ",
      "Recieved": "4322 ",
    },
    {
      "TotalAmount": "PKR348.0",
      "Dealer": "Book Land",
      "order_no": "Oder ID 0010",
      "Remaining": "-33453",
      "PhoneNumber": "(03244847427)",
      "Total": "563 ",
      "Recieved": "45789 ",
    },
    {
      "TotalAmount": "PKR358.0",
      "Dealer": "Admin",
      "order_no": "Oder ID 0210",
      "PhoneNumber": "(03244847427)",
      "Remaining": "-33453",
      "Total": "4454 ",
      "Recieved": "4454 ",
    },
    {
      "TotalAmount": "PKR238.0",
      "Dealer": "Book Land",
      "order_no": "Oder ID 0210",
      "PhoneNumber": "(03244847427)",
      "Remaining": "-33453",
      "Total": "4454 ",
      "Recieved": "4454 ",
    },
    {
      "TotalAmount": "PKR344.0",
      "Dealer": "Book Land",
      "order_no": "Oder ID 0210",
      "PhoneNumber": "(03244847427)",
      "Remaining": "-33453",
      "Total": "4454 ",
      "Recieved": "4454 ",
    },
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: _listdata4.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
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
                // Column(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Container(
                //       height: 60,
                //       width: 60,
                //       decoration: BoxDecoration(
                //         color: const Color(0xff7c94b6),
                //         image: const DecorationImage(
                //           image: AssetImage('assets/images/flower.jpg'),
                //           fit: BoxFit.cover,
                //         ),
                //         border: Border.all(
                //           width: 1,
                //         ),
                //         borderRadius: BorderRadius.circular(10),
                //       ),
                //     )
                //   ],
                // ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_listdata4[index]["Dealer"] ?? "Dealer Name",
                        style: const TextStyle(fontSize: 14)),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      onTapView: () {

                      },
                    ),
                  ],
                ),
                // Column(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Text(_listdata4[index]["id"].toString()),
                //     const SizedBox(
                //       height: 10,
                //     ),
                //     Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //       children: [
                //         SizedBox(
                //           width: 60.0,
                //           height: 25.0,
                //           child: InkWell(
                //             onTap: () {
                //               Navigator.push(
                //                 context,
                //                 MaterialPageRoute(
                //                   builder: (context) => ViewOrders(
                //                     listdata: [
                //                       _listdata3[index]['productName'],
                //                       _listdata3[index]['Qty'],
                //                       _listdata3[index]['Uprice'],
                //                       _listdata3[index]['Price'],
                //                     ],
                //                     date: _listdata4[index]['date'],
                //                   ),
                //                 ),
                //               );
                //             },
                //             child: const CustomButton(
                //               colorContain: whiteColor,
                //               icon: Icons.remove_red_eye,
                //               text: 'View',
                //               iconColor: primaryColor,
                //             ),
                //           ),
                //         ),
                //         const SizedBox(
                //           width: 4,
                //         ),
                //         SizedBox(
                //           width: 60.0,
                //           height: 25.0,
                //           child: InkWell(
                //             onTap: () {
                //               Navigator.push(
                //                 context,
                //                 MaterialPageRoute(
                //                   builder: (context) => TrackOrders(
                //                     selectIndex: index,
                //                   ),
                //                 ),
                //               );
                //             },
                //             child: const CustomButton(
                //               colorContain: whiteColor,
                //               icon: Icons.map,
                //               text: 'Track',
                //               iconColor: primaryColor,
                //             ),
                //           ),
                //         ),
                //       ],
                //     )
                //   ],
                // ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(_listdata4[index]["order_no"] ?? "or no",
                            style: const TextStyle(fontSize: 14)),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(_listdata4[index]["PhoneNumber"] ?? "(03xxxxxx)",
                            style: const TextStyle(fontSize: 14)),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text('Total: '),
                        Text(_listdata4[index]["Total"] ?? "31413",
                            style: const TextStyle(
                                fontSize: 14, color: bgColor)),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text('Recieved: '),
                        Text(_listdata4[index]["Recieved"] ?? "43567",
                            style: const TextStyle(
                                fontSize: 14, color: bgColor)),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text('Remaining Amount: '),
                        Text(_listdata4[index]["Remaining"] ?? "43567",
                            style: const TextStyle(
                                fontSize: 14, color: bgColor)),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
