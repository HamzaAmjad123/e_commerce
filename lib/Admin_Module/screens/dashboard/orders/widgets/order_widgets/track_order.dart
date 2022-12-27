import 'package:e_commerce/configs/color.dart';
import 'package:flutter/material.dart';

class TrackOrders extends StatefulWidget {
  const TrackOrders({super.key, this.selectIndex});
  final int? selectIndex;
  @override
  State<TrackOrders> createState() => _TrackOrdersState();
}

class _TrackOrdersState extends State<TrackOrders> {
  final List<Map<String, dynamic>> _orderDetailList = [
    {
      "Title": "Pending",
      "Subtitle": "22 Dec 2022, 4:00 PM",
    },
    {
      "Title": "Approved",
      "Subtitle": "22 Dec 2022, 4:00 PM",
    },
    {
      "Title": "Processing",
      "Subtitle": "22 Dec 2022, 4:00 PM",
    },
    {
      "Title": "On Way",
      "Subtitle": "22 Dec 2022, 4:00 PM",
    },
    {
      "Title": "Delivered",
      "Subtitle": "22 Dec 2022, 4:00 PM",
    },
    {
      "Title": "Cancelled",
      "Subtitle": "22 Dec 2022, 4:00 PM",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: bgColor,
        title: const Text('Track Details'),
        centerTitle: true,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Container(
              height: 50,
              decoration: const BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
            ),
            Positioned(
              top: 20,
              left: 40,
              right: 40,
              child: Container(
                width: 300,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const <Widget>[
                    Text(
                      'PKR720.0',
                      style: TextStyle(color: bgColor, fontSize: 16),
                    ),
                    Text(
                      'ORDER ID168',
                      style: TextStyle(color: blackColor, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
            ListView.builder(
              itemExtent: 65.0,
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.fromLTRB(15, 100, 0, 0),
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: _orderDetailList.length,
              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: widget.selectIndex == index
                                  ? bgColor
                                  : index <
                                          int.parse(
                                              widget.selectIndex.toString())
                                      ? bgColor
                                      : silverColor),
                          child: widget.selectIndex == index
                              ? const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                )
                              : index < int.parse(widget.selectIndex.toString())
                                  ? const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                    )
                                  : const Icon(
                                      Icons.check,
                                      color: whiteColor,
                                    ),
                        ),
                        index < _orderDetailList.length - 1
                            ? Container(
                                margin: EdgeInsets.only(top: 10),
                                height: 30,
                                width: 2,
                                decoration:
                                    const BoxDecoration(color: silverColor),
                              )
                            : SizedBox()
                      ],
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_orderDetailList[index]["Title"] ?? "Pending",
                            style: const TextStyle(fontSize: 14)),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(_orderDetailList[index]["Subtitle"] ?? "Pending",
                            style: const TextStyle(fontSize: 14))
                      ],
                    ),
                  ],
                );
                //   leading: widget.selectIndex == index
                //       ? const Icon(
                //           Icons.check_box,
                //           color: primaryColor,
                //         )
                //       : index < int.parse(widget.selectIndex.toString())
                //           ? const Icon(
                //               Icons.check_box,
                //               color: primaryColor,
                //             )
                //           : const Icon(
                //               Icons.check_box,
                //             ),
                //   title: Text(_orderDetailList[index]["Title"] ?? "Pending",
                //       style: const TextStyle(fontSize: 14)),
                //   subtitle: Text(
                //       _orderDetailList[index]["Subtitle"] ?? "Pending",
                //       style: const TextStyle(fontSize: 14)),
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}
