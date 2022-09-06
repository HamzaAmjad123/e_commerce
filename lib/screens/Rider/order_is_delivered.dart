import 'dart:convert';
import 'dart:io';
import 'package:e_commerce/helper_services/custom_loader.dart';
import 'package:e_commerce/helper_services/custom_snackbar.dart';
import 'package:e_commerce/model/rider_models/rider_order_model.dart';
import 'package:e_commerce/model/user_model.dart';
import 'package:e_commerce/service/rider_services/delivered_order_service.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:signature/signature.dart';
import '../../configs/color.dart';
import '../../utils/functions.dart';
import '../../utils/images.dart';

class OrderIsDelivered extends StatefulWidget {
  final RiderOdersModel? order;
  final int orderId;

  OrderIsDelivered({this.order, required this.orderId});

  @override
  State<OrderIsDelivered> createState() => _OrderIsDeliveredState();
}

class _OrderIsDeliveredState extends State<OrderIsDelivered> {
  final box = GetStorage();
  String? month;
  int? day;
  var time = "";
  UserModel? usermodels;
  File? imageFile;
  PickedFile? recipetImage;
  bool _show = false;
  String? convertImage;
  SignatureController _dealerSignCont = SignatureController();
  SignatureController _riderSignCont = SignatureController();

  @override
  void initState() {
    usermodels = UserModel.fromJson(box.read('user'));
    getFormatedDate(DateTime.now().toString());
    // TODO: implement initState
    super.initState();
  }

  _deliveredOrderHandler() async {
    CustomLoader.showLoader(context: context);
    await DeliveredOrderService().deliverOrder(
        context: context,
        orderId: widget.orderId,
        dealerSign: _dealerSignCont.toString(),
        riderSign: _riderSignCont.toString());

    print("Daler ${_dealerSignCont.toString()}");
    print("Rider ${_riderSignCont.toString()}");
    print("Order Id ${widget.orderId}");
    CustomLoader.hideLoader(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text("Order Delivery"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          _deliveredOrderHandler();
          setState(() {});
          CustomSnackBar.showSnackBar(
              context: context, message: "Order Deliver Succesfully");
        },
        child: Container(
          height: 50,
          decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              )),
          child: Center(
              child: Text(
            "Order Delivery Done",
            style: TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
          )),
        ),
      ),
      bottomSheet: _showBottomSheet(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Flexible(
                    child: ListTile(
                      leading: Container(
                        height: 80,
                        width: 60,
                        child: usermodels!.imageUrl == ""
                            ? Image.asset(
                                "assets/images/place_holder.png",
                                fit: BoxFit.fill,
                              )
                            : Image.network(
                                usermodels!.imageUrl!,
                                fit: BoxFit.cover,
                              ),
                      ),
                      title: Text(
                        usermodels!.name ?? "UserName",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      ),
                      subtitle: Text(usermodels!.name ?? "ebg:abc@gmail.com"),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      leading: Container(
                          height: 80,
                          width: 60,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("${day}" + " " + month!),
                              Text(time),
                            ],
                          )),
                      title: Text(
                        "Order Id: ${widget.order!.orderId}",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 14),
                      ),
                      subtitle: Text(
                          "${Methods().getFormatedDate(widget.order!.date)}"),
                    ),
                  ),
                ],
              ),
              // Container(
              //     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             Text(
              //               "Dealer Signature",
              //               style: TextStyle(
              //                   color: Colors.black,
              //                   fontWeight: FontWeight.w600,
              //                   fontSize: 14),
              //             ),
              //             TextButton(
              //               child: Text(
              //                 "Clear Signature",
              //                 style: TextStyle(
              //                     color: bgColor,
              //                     fontWeight: FontWeight.w600,
              //                     fontSize: 14),
              //               ),
              //               onPressed: () {
              //                 _dealerSignCont.clear();
              //               },
              //             ),
              //
              //             // CustomButton(
              //             //   text: "Redo",
              //             //   onTap: () {
              //             //     _dealerSignCont.clear();
              //             //   },
              //             // ),
              //           ],
              //         ),
              //         SizedBox(
              //           height: 5.0,
              //         ),
              //         Signature(
              //           controller: _dealerSignCont,
              //           height: 150.0,
              //           backgroundColor: Colors.black12,
              //         ),
              //       ],
              //     )),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Rider Signature",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 14.0),
                          ),
                          TextButton(
                            child: Text(
                              "Clear Signature",
                              style: TextStyle(
                                  color: bgColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                            ),
                            onPressed: () {
                              _riderSignCont.clear();
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Signature(
                        controller: _riderSignCont,
                        height: 150,
                        backgroundColor: Colors.black12,
                      ),
                    ],
                  )),
              Container(
                height: 100,
                width: 100,
                child: /*convertImage==null?Text("No Image"):*/Image.memory(base64Decode(Images.image64),height: 100,width: 100,),
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 90,
                        width: 130,
                        child: recipetImage != null
                            ? Image.file(
                                File(recipetImage!.path),
                                fit: BoxFit.cover,
                              )
                            : Icon(
                                Icons.camera_alt_sharp,
                                size: 80,
                                color: Colors.grey,
                              ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                _show = true;
                                setState(() {});
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.grey,
                              ),
                              child: Text("Take Picture")),
                          SizedBox(
                            height: 5,
                          ),
                          ElevatedButton(
                              onPressed: () async {
                                print(recipetImage!.path);
                                print(_riderSignCont.toString());
                                final bytes = await File(recipetImage!.path).readAsBytesSync();
                                // String base64Image =  "data:image/png;base64,"+base64Encode(bytes);
                               // String photoBase64 = base64Encode( File(recipetImage!.path).readAsBytesSync());
                                String photoBase64 = base64Encode(bytes);
                                print(photoBase64);
                                convertImage=photoBase64;
                                setState(() {

                                });
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.grey,
                              ),
                              child: Text("show path")),
                        ],
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  getFormatedDate(_date) {
    DateTime dates = DateTime.parse(_date);
    print("hsadhdsa");
    print(dates);
    month = DateFormat('MMMM').format(dates).substring(0, 3);
    day = dates.day;
    time = DateFormat('hh:mm a').format(dates);
  }

  getRecipetImage(ImageSource source) async {
    recipetImage =
        await ImagePicker().getImage(
          source: source, imageQuality: 50, maxHeight: 150.0,
          maxWidth: 150.0,
        );
    if (recipetImage != null) {
      setState(() {
        imageFile = File(recipetImage!.path);
      });
    }
  }

  Widget _showBottomSheet() {
    if (_show) {
      return BottomSheet(
        onClosing: () {},
        builder: (context) {
          return Container(
              height: 120,
              width: double.infinity,
              color: Colors.grey.shade200,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        _show = false;
                        setState(() {});
                        getRecipetImage(ImageSource.gallery);
                        // setState(() {});
                      },
                      label: Text(
                        "Choose From Gallery",
                        style: TextStyle(color: bgColor),
                      ),
                      icon: Icon(
                        Icons.photo,
                        color: Colors.black,
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                    TextButton.icon(
                      onPressed: () {
                        _show = false;
                        setState(() {});
                        getRecipetImage(ImageSource.camera);
                        // setState(() {});
                      },
                      label:
                          Text("Open Camera", style: TextStyle(color: bgColor)),
                      icon: Icon(Icons.camera_alt_sharp, color: Colors.black),
                    ),
                  ],
                ),
              ));
        },
      );
    } else {
      print(_show);
      return Text("");
    }
  }
}
