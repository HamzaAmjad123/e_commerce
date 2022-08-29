import 'package:e_commerce/model/items_cart_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../model/items_model.dart';

class GenerateOrderWidget extends StatelessWidget {
  ItemsList item;
 /* final Function(String)? onCange;*/
  // final String? totalPrice;
  final Function()? onTap;
  // TextEditingController qtyController;

  GenerateOrderWidget(
      {required this.item,
        // required this.qtyController,
        /*this.onCange,*/
        // this.totalPrice,
        this.onTap});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          elevation: 10.0,
          margin: EdgeInsets.symmetric(horizontal: 9.0,vertical: 7.0),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0)
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                      color: Color.fromRGBO(217, 210, 200, 0.51),
                      offset: Offset(6, 6),
                      blurRadius: 16,
                    ),
                    BoxShadow(
                      color: Color.fromRGBO(255, 255, 255, 0.83),
                      offset: Offset(-6, -6),
                      blurRadius: 16,
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(vertical: 18.0,horizontal: 6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.name!),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.01,
                    ),
                    Text("${item.unitDiscountPercentage}"),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    Text("${item.unitPrice}"),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.04,
                    ),
                    // Container(
                    //   height: 15,
                    //   width: 30,
                    //   child: TextField(
                    //     onChanged: onCange,
                    //     controller: qtyController,
                    //     keyboardType: TextInputType.numberWithOptions(),
                    //
                    //     // maxLines: 1,
                    //     // maxLength: 4,
                    //     textInputAction: TextInputAction.done,
                    //     obscureText: false,
                    //     // controller: qtyController[index],
                    //     decoration: InputDecoration(hintText: "0",
                    //       border: InputBorder.none,),
                    //   ),
                    // ),
                    // SizedBox(
                    //   width: MediaQuery.of(context).size.width * 0.02,
                    // ),
                    // Text(totalPrice!),
                    // Expanded(child: Text("12")),
                  ],
                ),
              ),


            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.only(top: 33.0,),
            child: IconButton(
              icon: Icon(CupertinoIcons.cart_fill_badge_plus,color: Colors.green,),
              onPressed: onTap,
            ),
          ),
        ),


        // Positioned( //<-- SEE HERE
        //   right: 0,
        //   left: 330.0,
        //   top: 0,
        //   bottom:170.0 ,
        //   child: IconButton(
        //     icon: Icon(Icons.shopping_cart,color: bgColor,),
        //     onPressed: onTap,
        //   ),),
      ],
    );

  }
}


class CreateOrderWidget extends StatelessWidget {
 CartModel item;
  final Function(String)? onCange;
  final String? totalPrice;
  final String? initialValue;

  // TextEditingController qtyController;

  CreateOrderWidget(
      {required this.item,
        // required this.qtyController,
        this.onCange,
        this.totalPrice, this.initialValue});

  var text;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          elevation: 10.0,
          margin: EdgeInsets.symmetric(horizontal: 9.0,vertical: 7.0),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0)
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                      color: Color.fromRGBO(217, 210, 200, 0.51),
                      offset: Offset(6, 6),
                      blurRadius: 16,
                    ),
                    BoxShadow(
                      color: Color.fromRGBO(255, 255, 255, 0.83),
                      offset: Offset(-6, -6),
                      blurRadius: 16,
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(vertical: 18.0,horizontal: 6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.name),
                    // SizedBox(
                    //   width: MediaQuery.of(context).size.width * 0.01,
                    // ),
                    // Text("${item.discount}"),
                    // SizedBox(
                    //   width: MediaQuery.of(context).size.width * 0.02,
                    // ),
                    // Text("${item.unitprice}"),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.04,
                    ),
                    Container(
                      height: 15,
                      width: 30,
                      child: TextFormField(
                        initialValue: initialValue,
                        onChanged: onCange,
                        // controller: qtyController,
                        keyboardType: TextInputType.numberWithOptions(),

                        // maxLines: 1,
                        // maxLength: 4,
                        textInputAction: TextInputAction.done,
                        obscureText: false,
                        // controller: qtyController[index],
                        decoration: InputDecoration(hintText: "1",
                          border: InputBorder.none,),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.02,
                    ),
                    Text(totalPrice!),
                    // Expanded(child: Text("12")),
                  ],
                ),
              ),


            ],
          ),
        ),



        // Positioned( //<-- SEE HERE
        //   right: 0,
        //   left: 330.0,
        //   top: 0,
        //   bottom:170.0 ,
        //   child: IconButton(
        //     icon: Icon(Icons.shopping_cart,color: bgColor,),
        //     onPressed: onTap,
        //   ),),
      ],
    );

  }
}