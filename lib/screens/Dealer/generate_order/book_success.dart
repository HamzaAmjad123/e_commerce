import 'package:flutter/material.dart';
import '../order/order_list_screen.dart';

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
    new Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement<void, void>(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) =>  OrderListScreen(),
        ),
      );
    });
  }
  void dispose(){
    //...
    super.dispose();
    //...
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