import 'package:e_commerce/helper_services/custom_loader.dart';
import 'package:e_commerce/helper_widgets/custom_button.dart';
import 'package:e_commerce/helper_widgets/custom_text_fild.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../configs/color.dart';
import '../../../configs/text_style.dart';
import '../../../model/order_objection_model.dart';
import '../../../provider/order_objection_provider.dart';
import '../../../service/create_objection_service.dart';
import '../../../service/order_objection_service.dart';

class ObjectionScreen extends StatefulWidget {
  final int orderId;


  ObjectionScreen({required this.orderId,});

  @override
  State<ObjectionScreen> createState() => _ObjectionScreenState();
}

class _ObjectionScreenState extends State<ObjectionScreen> {

  _getObjectionHandler() async {
    CustomLoader.showLoader(context: context);
    await OrderObjectionService().getObjection(context: context, orderId: widget.orderId);
    CustomLoader.hideLoader(context);
    setState(() {

    });
  }



  int ?itemId;
  _createObjectionHandler(List<ObjectionOrderLines>?objections) async {
    CustomLoader.showLoader(context: context);
    await CreateObjectionService().createObjection(context: context,
        orderId: widget.orderId,
        objDetails: _objDetailsCont.text, orderItems: objections!,

    );
    CustomLoader.hideLoader(context);
  }

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _getObjectionHandler();
    });
    super.initState();
  }

  TextEditingController _objDetailsCont = TextEditingController();

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
          title: Text("Order Objection", style: barStyle,),
          elevation: 0.0,
          backgroundColor: whiteColor,
          flexibleSpace: Container(
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
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
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
                  SizedBox(height: 10.0,),

              Consumer<OrderObjectionProvider>(builder: (context,obj,_){
                return obj.orderObjection!=null?
                Column(
                  children: [
                    ListView.builder(
                        itemCount: obj.orderObjection!.orderLines!.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        primary: false,
                        itemBuilder: (BuildContext, index) {

                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Expanded(child: Text(
                                  "${obj.orderObjection!.orderLines![index]
                                      .item!.name}")),
                              Expanded(child: Text(
                                  "${obj.orderObjection!.orderLines![index]
                                      .totalAmount}")),
                              Expanded(child: Text(
                                  "${obj.orderObjection!.orderLines![index].quantity}")),

                              Expanded(
                                child: Container(
                                  height: 20.0,
                                  width: 30.0,

                                  child: TextField(
                          keyboardType:TextInputType.number,
                                    // initialValue: widget.expectedQuantity!,
                                    onChanged: (value){
                                      obj.orderObjection!.orderLines![index].receivedQuantity=int.parse(value);
                                    },

                                    // initialValue: "${obj.orderObjection!.orderLines![index].quantity}",


                                    decoration: InputDecoration(

                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                    CustomButton(
                      text: "Create",
                      onTap: (){
                        _createObjectionHandler(
                          obj.orderObjection!.orderLines!
                        );
                      },
                    )
                  ],
                ) : Container(
                  child: Text("No Objection Against this order"),
                );
              }),
                  SizedBox(height: 10.0,),
                  CustomTextField(
                    headerText: "Comment",
                    controller: _objDetailsCont,
                  ),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
