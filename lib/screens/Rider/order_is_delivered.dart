import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:e_commerce/helper_services/custom_loader.dart';
import 'package:e_commerce/helper_services/custom_snackbar.dart';
import 'package:e_commerce/model/rider_models/rider_order_model.dart';
import 'package:e_commerce/model/user_model.dart';
import 'package:e_commerce/service/rider_services/delivered_order_service.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import '../../configs/color.dart';
import '../../helper_widgets/custom_button.dart';
import '../../utils/functions.dart';
import '../../utils/images.dart';
import 'dart:ui' as ui;

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

  List<int> recepitBytes=[];
  List<int> riderBytes=[];
  List<int> dealerBytes=[];
  String? _isDealer;
  String? _isRider;
  ui.Image? dealerImage;
  ui.Image? riderImage;
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
        dealerSign:dealerBytes,
        riderSign: riderBytes,
    deliveredImage: recepitBytes,
    );
    CustomLoader.hideLoader(context);
  }
  GlobalKey<SfSignaturePadState> _riderSignature = GlobalKey();
  GlobalKey<SfSignaturePadState> _dealerSignature = GlobalKey();
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
        onTap: ()async {

          setState(() {});
          if(_validateSignatures()){
           await _convertDealerImage();
           await _convertRiderImage();
           await _convertRcepitIntoBytes();
          await _deliveredOrderHandler();
          }
          // if(bytes==[]){
          //   CustomSnackBar.failedSnackBar(context: context, message:"Data is required");
          // }else{
          //   _deliveredOrderHandler(bytes);
            setState(() {});
          //   CustomSnackBar.showSnackBar(
          //       context: context, message: "Order Deliver Succesfully");
          // }

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row(
            //   children: [
            //     Flexible(
            //       child: ListTile(
            //         leading: Container(
            //           height: 80,
            //           width: 60,
            //           child: usermodels!.imageUrl == ""
            //               ? Image.asset(
            //                   "assets/images/place_holder.png",
            //                   fit: BoxFit.fill,
            //                 )
            //               : Image.network(
            //                   usermodels!.imageUrl!,
            //                   fit: BoxFit.cover,
            //                 ),
            //         ),
            //         title: Text(
            //           usermodels!.name ?? "UserName",
            //           style: TextStyle(
            //               color: Colors.black,
            //               fontWeight: FontWeight.w600,
            //               fontSize: 14),
            //         ),
            //         subtitle: Text(usermodels!.name ?? "ebg:abc@gmail.com"),
            //       ),
            //     ),
            //     Expanded(
            //       child: ListTile(
            //         leading: Container(
            //             height: 80,
            //             width: 60,
            //             child: Column(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               crossAxisAlignment: CrossAxisAlignment.center,
            //               children: [
            //                 Text("${day}" + " " + month!),
            //                 Text(time),
            //               ],
            //             )),
            //         title: Text(
            //           "Order Id: ${widget.order!.orderId}",
            //           style: TextStyle(
            //               color: Colors.black,
            //               fontWeight: FontWeight.w600,
            //               fontSize: 14),
            //         ),
            //         subtitle: Text(
            //             "${Methods().getFormatedDate(widget.order!.date)}"),
            //       ),
            //     ),
            //   ],
            // ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Dealer Signature",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 14),
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
                            _dealerSignature.currentState!.clear();
                            _isDealer=null;
                            setState(() {

                            });
                          },
                        ),
                      ],
                    ),

                    Container(
                      child: SfSignaturePad(
                        key: _dealerSignature,
                        backgroundColor: Colors.grey[200],
                        onDrawStart: () {
                          print("ststtsstsss");
                          _isDealer="start";
                    return false;
                    },
                      ),
                      height: 120,
                      width: 300,
                    ),
                  ],
                )),
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

                            _riderSignature.currentState!.clear();
                            _isRider=null;
                            setState(() {

                            });
                          },

                        ),
                      ],
                    ),
                    Container(
                      child: SfSignaturePad(
                        key: _riderSignature,
                        backgroundColor: Colors.grey[200],
                        onDrawStart: () {
                          _isRider="start";
                          return false;
                        },
                      ),
                      height: 120,
                      width: 300,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),

                  ],
                )),

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
                    ElevatedButton(
                        onPressed: () {
                          _show = true;
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey,
                        ),
                        child: Text("Take Picture"))
                  ],
                )),
          ],
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
          source: source,
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
  _validateSignatures(){
    print('Asad1111');
    print(_isDealer);

    if(_isDealer==null){
      print('Asad');
     CustomSnackBar.failedSnackBar(context: context, message: "Dealer Signature can't be empty");
     print('Asad');
      return false;
    }
    else if(_isRider==null){
      print('Asad');
     CustomSnackBar.failedSnackBar(context: context, message: "Rider Signature can't be empty");
     print('Asad');
      return false;
    }
    else if(recipetImage==null){
      print('Asad');
      CustomSnackBar.failedSnackBar(context: context, message: "Please Add Recipet Picture");
      print('Asad');
      return false;
    }
    else{
      return true;
    }
  }

  _convertDealerImage()async{
   dealerImage =
        await _dealerSignature.currentState!.toImage();
   //Convert to image
    ByteData? byte=await dealerImage!.toByteData(format: ui.ImageByteFormat.png);
    //Image to bytes
    var pngBytes=byte!.buffer.asUint8List();
    dealerBytes=pngBytes;
    // var base64=base64Encode(pngBytes);
    setState(() {});
  }
  _convertRiderImage()async{
    riderImage=await _riderSignature.currentState!.toImage();
    ByteData? byte=await  riderImage!.toByteData(format: ui.ImageByteFormat.png);
    var pngBytes=byte!.buffer.asUint8List();
    riderBytes=pngBytes;
    setState(() {
    });
  }
  _convertRcepitIntoBytes()async{
    recepitBytes=await File(recipetImage!.path).readAsBytesSync();
   setState(() {

   });
  }
}
