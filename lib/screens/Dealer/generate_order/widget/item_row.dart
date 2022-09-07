import 'package:e_commerce/configs/color.dart';
import 'package:e_commerce/configs/text_style.dart';
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
    return
        Card(
          elevation: 10.0,
          margin: EdgeInsets.symmetric(horizontal: 9.0,vertical: 4.0),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0)
              )
          ),
          shadowColor: bgColor,
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
                padding: EdgeInsets.only(top: 10.0,left: 18.0,right: 10.0),
                child: Column(
                  children: [
                    Image.asset("assets/images/book.jpg",height: MediaQuery.of(context).size.height/5,fit: BoxFit.cover,),
                    Divider(
                      thickness: 2.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text("Title",style: titleStyle,),
                        Text(item.name!,style: titleStyle,),
                      ],
                    ),
                    SizedBox(height: 1.0,),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     // Text("Discount",style: titleStyle,),
                    //     Text("${item.unitDiscountPercentage}%"),
                    //   ],
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text("U-Price",style: titleStyle,),
                        Text("${item.unitPrice}PKR"),
                        InkWell(
                            onTap: onTap,
                            child: Icon(Icons.add_shopping_cart,color: Colors.green,))
                      ],
                    ),
                  ],
                ),
              ),


              // Padding(
              //   padding: const EdgeInsets.only(bottom: 3.0),
              //   child: Align(
              //     alignment: Alignment.bottomRight,
              //     child: InkWell(
              //         onTap: onTap,
              //         child: Icon(Icons.add_shopping_cart,color: Colors.green,)),
              //
              //
              //   ),
              // ),
        ]),

        // Positioned( //<-- SEE HERE
        //   right: 0,
        //   left: 330.0,
        //   top: 0,
        //   bottom:170.0 ,
        //   child: IconButton(
        //     icon: Icon(Icons.shopping_cart,color: bgColor,),
        //     onPressed: onTap,
        //   ),),

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