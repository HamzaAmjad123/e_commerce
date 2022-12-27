import 'package:flutter/material.dart';

import '../../../../../configs/color.dart';
import '../../../../helper_widget/custom_button.dart';

class OrderWidget extends StatefulWidget {
  const OrderWidget({super.key});

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  // final List _listdata3 = [
  //   {"productName": "Mobile", "Qty": "8", "Uprice": "240.0", "Price": "230.0"},
  //   {"productName": "Vivo", "Qty": "8", "Uprice": "240.0", "Price": "230.0"},
  // ];

  final List<Map<String, dynamic>> _listdata4 = [
    {
      "TotalAmount": "PKR348.0",
      "id": "50000",
      "order_no": "Oder ID 0010",
      "PhoneNumber": "(03244847427)",
      "date": "22 Dec 2022, 4:00 PM",
      "delivery": "Delivered "
    },
    {
      "TotalAmount": "PKR348.0",
      "id": "60000",
      "order_no": "Oder ID 0210",
      "PhoneNumber": "(03244847427)",
      "date": "25 Dec 2022, 5:00 PM",
      "delivery": "Delivered "
    },
    {
      "TotalAmount": "PKR348.0",
      "id": "70000",
      "order_no": "Oder ID 0010",
      "PhoneNumber": "(03244847427)",
      "date": "27 Dec 2022, 6:00 PM",
      "delivery": "Delivered"
    },
    {
      "TotalAmount": "PKR358.0",
      "id": "80000",
      "order_no": "Oder ID 0210",
      "PhoneNumber": "(03244847427)",
      "date": "29 Dec 2022, 7:00 PM",
      "delivery": "Delivered "
    },
    {
      "TotalAmount": "PKR238.0",
      "id": "80000",
      "order_no": "Oder ID 0210",
      "PhoneNumber": "(03244847427)",
      "date": "29 Dec 2022, 7:00 PM",
      "delivery": "Delivered"
    },
    {
      "TotalAmount": "PKR344.0",
      "id": "80000",
      "order_no": "Oder ID 0210",
      "PhoneNumber": "(03244847427)",
      "date": "29 Dec 2022, 7:00 PM",
      "delivery": "Delivered "
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
      physics: const AlwaysScrollableScrollPhysics(),
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
                Padding(
                  padding: const EdgeInsets.only(left: 3),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.asset('assets/images/flower.jpg',
                            width: 42, height: 42, fit: BoxFit.fill),
                      ),
                      // Container(
                      //   height: 45,
                      //   width: 45,
                      //   decoration: BoxDecoration(
                      //     color: const Color(0xff7c94b6),
                      //     image: const DecorationImage(
                      //       image: AssetImage('assets/images/flower.jpg'),
                      //       fit: BoxFit.cover,
                      //     ),
                      //     borderRadius: BorderRadius.circular(5),
                      //   ),
                      // )
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(_listdata4[index]["TotalAmount"] ?? "240.0",
                        style: const TextStyle(fontSize: 14)),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      onTapView: () {},
                      textView: 'View',
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
                        Text(_listdata4[index]["order_no"] ?? "",
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
                    Text(_listdata4[index]["date"] ?? "",
                        style: const TextStyle(fontSize: 12)),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Text('Status: '),
                        Text(_listdata4[index]["delivery"] ?? "",
                            style: const TextStyle(
                                fontSize: 11, color: bgColor)),
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
