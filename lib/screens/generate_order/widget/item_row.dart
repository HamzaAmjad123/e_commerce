import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../configs/color.dart';
import '../../../model/items_model.dart';

class GenerateOrderWidget extends StatelessWidget {
  ItemsList item;
  final Function(String)? onCange;
  final String? totalPrice;
  final Function()? onTap;
  TextEditingController qtyController;

  GenerateOrderWidget(
      {required this.item,
        required this.qtyController,
        this.onCange,
        this.totalPrice, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(/*horizontal: 10.0,*/ vertical: 12.0),
        width: double.infinity,
        child: Wrap(
          children: [
            Row(
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
                Container(
                  height: 15,
                  width: 30,
                  child: TextField(
                    onChanged: onCange,
                    controller: qtyController,
                    keyboardType: TextInputType.numberWithOptions(),

                    // maxLines: 1,
                    // maxLength: 4,
                    textInputAction: TextInputAction.done,
                    obscureText: false,
                    // controller: qtyController[index],
                    decoration: InputDecoration(hintText: "0",
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
            Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                icon: Icon(Icons.shopping_cart,color: bgColor,),
                onPressed: onTap,
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.black,
                    )),

              ],
            ),

          ],
        ),
      ),
    );
  }
}