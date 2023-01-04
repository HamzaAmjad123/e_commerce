

import 'package:e_commerce/configs/api_urls.dart';
import 'package:e_commerce/configs/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../configs/color.dart';
import '../../../../model/items_cart_model.dart';

class CartDrawerWidget extends StatelessWidget {
  bool isFirst;
  final CartModel? cartModel;
  final Function()? subTap;
  final Function()? addTap;
  final Function()? deleteTap;
  final Function()? iconTap;
  final Function()? textTap;
  final Function(String)? onChange;
  final Function(String)? onSubmit;
   final TextEditingController? cont;
  final FocusNode? focus;
  bool show;
  CartDrawerWidget({this.cartModel, this.subTap, this.addTap, this.deleteTap,this.isFirst=false,this.show=false,this.textTap,
    this.cont, this.onChange, this.onSubmit, this.focus, this.iconTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: isFirst?20:10,left: 10,right: 10),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey),
        // color: Colors.grey[200]
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment:  MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Theme.of(context).primaryColor.withOpacity(.20),width: 1)
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: cartModel!.image!.isEmpty?Image.asset("assets/image/placeholder.png",fit: BoxFit.fill, height: 60, width: 60)
                    :Image.network("${baseUrl}${cartModel!.image}",fit: BoxFit.fill, height: 60, width: 60),
        // :Image.network('https://pos.impliessolutions.com/${cartModel!.image}',fit: BoxFit.fill, height: 60, width: 60)
                ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(cartModel!.name, maxLines: 1, overflow: TextOverflow.ellipsis,
                                  style: subtitleStyle),
                              Text(" "+"(${cartModel!.serires})", maxLines: 1, overflow: TextOverflow.ellipsis,
                                  style: rsStyle),
                            ],
                          )
                        ),
                        InkWell(
                          onTap: deleteTap,
                          child: Icon(
                            Icons.delete,
                            color: Colors.red,
                            size: 25,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                            children: [
                              Text("${cartModel!.discount.toString()}"+"%",maxLines: 1,overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  ),
                              ),
                              SizedBox(width: 10),
                              Text("Price:",style: subtitleStyle,),
                              Text(cartModel!.unitprice.toString(),
                                  maxLines: 1,overflow: TextOverflow.ellipsis,
                                  style: rsStyle
                              ),
                            ],
                        ),
                        Text(getTotal(),
                        style: rsStyle,)
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       SizedBox(),
                        show?Container(
                          height: 40,
                          width: 200,
                          child: TextField(

                            controller: cont,

                            textInputAction: TextInputAction.done,
                            focusNode: focus,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              LengthLimitingTextInputFormatter(8)
                            ],
                            onChanged: onChange,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 0.0),
                              filled: true,
                              fillColor: Colors.white,
                              suffixIcon: IconButton(
                                icon: Icon(Icons.done_outline,color: bgColor,),
                                onPressed: iconTap,
                              ),
                              hintText: "Enter Qty",
                              hintStyle: TextStyle(color: Colors.grey),
                              labelStyle: TextStyle(color: Colors.grey[600],fontWeight: FontWeight.w400),
                              enabledBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                BorderSide(color: Colors.grey,width: 1.2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: BorderSide(color:  Colors.grey, width: 1.8)),
                              ),
                          ),
                        )
                        :cartModel!.qty.toString().length>2?GestureDetector(
                          onTap: textTap,
                          child:Container(
                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: bgColor
                            ),
                            child:  Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Qty",style: titleStyle,),
                                SizedBox(width: 10,),
                                Text(cartModel!.qty.toString(),style: subtitleWhite,)
                              ],
                            ),
                          )
                        ):Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 20.0),
                              child: InkWell(
                                onTap: cartModel!.qty>1?subTap:(){},
                                child: Icon(
                                  Icons.remove_circle,
                                  color:cartModel!.qty > 1
                                      ? bgColor
                                      : Colors.grey,
                                  size: 30,
                                ),
                              )
                            ),
                            GestureDetector(
                              onTap: textTap,
                              child: Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  // border: Border.all(color: Colors.black,width: 2),
                                  color: bgColor
                                ),
                                child: Center(child: Text(cartModel!.qty.toString(),style: barStyle,)),
                              ),
                            ),


                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child:InkWell(
                                onTap: addTap,
                                child: Icon(
                                 Icons.add_circle,
                                  color:  bgColor,
                                  size: 30,
                                ),
                              )
                            ),
                          ],
                        )
                      ],),

                  ],
                ),
              ),
            ),
          ]),
    );
  }

  String getTotal() {
    double offPrice=(cartModel!.unitprice/100)*cartModel!.discount;
    double total=(cartModel!.unitprice-offPrice)* cartModel!.qty;
    return total.toString();
  }
}