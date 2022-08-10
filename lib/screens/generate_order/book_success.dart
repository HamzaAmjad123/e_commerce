import 'package:e_commerce/screens/generate_order/generate_order_screen.dart';
import 'package:flutter/material.dart';

import '../../configs/color.dart';

class BookSuccess extends StatefulWidget {
  String? message;
  String? orderId;
  BookSuccess({required this.message,required this.orderId});

  @override
  _BookSuccessState createState() => _BookSuccessState();
}

class _BookSuccessState extends State<BookSuccess> {
  @override
  void initState() {
    super.initState();
    new Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement<void, void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) =>  GenerateOrderScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double width;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Container(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/bookingsuccess.png',
                            height: width * 0.7,
                            width: width * 0.8,
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: width * 0.03),
                      child: Column(
                        children: [
                          Text(widget.message!,
                            style: TextStyle(fontSize: width * 0.053, color: Colors.black),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: width * 0.03),
                      child: Column(
                        children: [
                          Text("OrderId#  ${widget.orderId!}",
                            style: TextStyle(fontSize: width * 0.053, color: Colors.black),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                    // Container(
                    //   height: width * 0.12,
                    //   width: width * 0.27,
                    //   margin: EdgeInsets.only(top: width * 0.06),
                    //   child: Card(
                    //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    //     color: bgColor,
                    //     child: Column(
                    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //       children: [
                    //         Container(
                    //           child: Text("OrderId#  ${widget.orderId!}",
                    //             style: TextStyle(fontSize: width * 0.03, color: Colors.white),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}