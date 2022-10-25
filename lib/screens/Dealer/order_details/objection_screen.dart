import 'package:flutter/material.dart';

import '../../../configs/color.dart';
import '../../../configs/text_style.dart';
class ObjectionScreen extends StatefulWidget {


  @override
  State<ObjectionScreen> createState() => _ObjectionScreenState();
}

class _ObjectionScreenState extends State<ObjectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          iconTheme: IconThemeData(
              color: whiteColor
          ),
          centerTitle: true,
          title: Text("Order Objection",style: barStyle,),
          elevation: 0.0,
          backgroundColor: whiteColor,
          flexibleSpace:  Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                )),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),

            ),

            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: Text("Item",)),
                      Expanded(child: Text("Price"),),
                      Expanded(child: Text("Expt.Qnt")),
                      Expanded(child: Text("Rec.Qnt")),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Expanded(child: Text("${"widget.itemName"}")),
                      Expanded(child: Text("${"widget.price"}")),
                      Expanded(child: Text("${"widget.recQnt"}")),
                      Expanded(
                        child: Container(
                          height: 20.0,
                          width: 30.0,

                          child: TextFormField(
                            initialValue: "widget.exptQnt",
                            decoration: InputDecoration(

                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
