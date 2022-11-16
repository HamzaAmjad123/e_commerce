import 'package:e_commerce/configs/api_urls.dart';
import 'package:e_commerce/configs/color.dart';
import 'package:e_commerce/configs/text_style.dart';
import 'package:e_commerce/model/items_cart_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../model/items_model.dart';

class GenerateOrderWidget extends StatelessWidget {
  Items item;
  final Function()? onTap;

  GenerateOrderWidget(
      {required this.item,
        this.onTap});

  @override
  Widget build(BuildContext context) {
    return
        Card(
          elevation: 10.0,
          margin: EdgeInsets.symmetric(horizontal: 9.0,vertical: 4.0),
          shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(8.0
             ),
            side: BorderSide(color: blackColor)
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
                child: Column(
                  children: [
                    ClipRRect(
                         // child: Image.asset("assets/images/book.jpg",height: MediaQuery.of(context).size.height/6,width: double.infinity,fit: BoxFit.fill,),

                      // child: Image.network(item.image!=null?"https://pos.impliessolutions.com/${item.image}":"assets/image/book_placholder.jpg",height: MediaQuery.of(context).size.height/6,width: double.infinity,fit: BoxFit.fill,),
                   child: item.image!=null?Image.network("$baseUrl"+"${item.image}",height: MediaQuery.of(context).size.height/6,width: double.infinity,fit: BoxFit.fill):Image.asset("assets/image/book_placholder.jpg",height: MediaQuery.of(context).size.height/6,width: double.infinity,fit: BoxFit.fill),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8.0),
                      topLeft: Radius.circular(8.0)
                    ),
                    ),
                    Container(
                      height: 2,
                      width: double.infinity,
                      color: Colors.black,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 8.0,right: 8.0,top: 6.0),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: Text(item.name!,
                            overflow: TextOverflow.ellipsis
                            ,style: subtitleStyle,)),
                          Text(item.unitPrice.toString())
                        ],
                      )
                    ),
                    InkWell(
                      onTap: onTap,
                      child: Container(
                        padding: EdgeInsets.only(left: 2.0,right: 2.0,top: 2.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Add To Cart",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                            Icon(Icons.add,color: Colors.green,),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
        ]),
    );
  }
}


class CreateOrderWidget extends StatelessWidget {
 CartModel item;
  final Function(String)? onCange;
  final String? totalPrice;
  final String? initialValue;

  CreateOrderWidget(
      {required this.item,
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