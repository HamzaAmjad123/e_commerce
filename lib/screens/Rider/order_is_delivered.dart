import 'dart:io';
import 'dart:typed_data';
import 'package:e_commerce/helper_services/custom_loader.dart';
import 'package:e_commerce/helper_services/custom_snackbar.dart';
import 'package:e_commerce/helper_widgets/custom_text_fild.dart';
import 'package:e_commerce/model/rider_models/rider_order_model.dart';
import 'package:e_commerce/model/user_model.dart';
import 'package:e_commerce/service/rider_services/delivered_order_service.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import '../../configs/color.dart';
import 'dart:ui' as ui;

import '../../configs/text_style.dart';

class OrderIsDelivered extends StatefulWidget {
  final RiderOrdersModel? order;
  final int orderId;
  final   String orderNo;
  final int noOfBags;

  OrderIsDelivered({this.order, required this.orderId, required this.orderNo, required this.noOfBags});

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

  TextEditingController _detailsCont=TextEditingController();
  FocusNode _detailsFocus=FocusNode();
  @override
  void initState() {
    usermodels = UserModel.fromJson(box.read('user'));
    // TODO: implement initState
    super.initState();
  }

  _deliveredOrderHandler() async {
    CustomLoader.showLoader(context: context);
    await DeliveredOrderService().deliverOrder(
        context: context,
      orderId: widget.orderId,
      reciptPath: recepitBytes,
      shipmentDetails:_detailsCont.text

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
          // if(_validateSignatures()){
          //  await _convertDealerImage();
          //  await _convertRiderImage();
           await _convertRcepitIntoBytes();
          await _deliveredOrderHandler();
          // }
            setState(() {});
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
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            //
            //
            //             TextButton(
            //               child: Text(
            //                 "Clear Signature",
            //                 style: TextStyle(
            //                     color: bgColor,
            //                     fontWeight: FontWeight.w600,
            //                     fontSize: 14),
            //               ),
            //               onPressed: () {
            //                 _dealerSignature.currentState!.clear();
            //                 _isDealer=null;
            //                 setState(() {
            //
            //                 });
            //               },
            //             ),
            //           ],
            //         ),
            //
            //         Container(
            //           child: SfSignaturePad(
            //             key: _dealerSignature,
            //             backgroundColor: Colors.grey[200],
            //             onDrawStart: () {
            //               print("ststtsstsss");
            //               _isDealer="start";
            //         return false;
            //         },
            //           ),
            //           height: 120,
            //           width: 300,
            //         ),
            //       ],
            //     )),
            // Container(
            //     padding: EdgeInsets.symmetric(horizontal: 20),
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.start,
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             Text(
            //               "Rider Signature",
            //               style: TextStyle(
            //                   color: Colors.black,
            //                   fontWeight: FontWeight.w600,
            //                   fontSize: 14.0),
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
            //
            //                 _riderSignature.currentState!.clear();
            //                 _isRider=null;
            //                 setState(() {
            //
            //                 });
            //               },
            //
            //             ),
            //           ],
            //         ),
            //         Container(
            //           child: SfSignaturePad(
            //             key: _riderSignature,
            //             backgroundColor: Colors.grey[200],
            //             onDrawStart: () {
            //               _isRider="start";
            //               return false;
            //             },
            //           ),
            //           height: 120,
            //           width: 300,
            //         ),
            //         SizedBox(
            //           height: 5.0,
            //         ),
            //
            //       ],
            //     )),

           RichText(

               text: TextSpan(

                   text: "Order No: ",
                   style: titleStyle,
           children: [
             TextSpan(
               text: "${widget.orderNo}",style:oderNoStyle
             ),
           ])),    RichText(

               text: TextSpan(

                   text: "No Of Bags: ",
                   style: titleStyle,
           children: [
             TextSpan(
               text: "${widget.noOfBags}",style:oderNoStyle
             ),
           ])),
            SizedBox(height: 15.0,),
            CustomTextField(
              headerText: "Details",
              shape: true,
              controller: _detailsCont,
              focusNode: _detailsFocus,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: (){
                        _show=false;
                        setState(() {});
                      },
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                            color: Colors.red,
                            child: Icon(Icons.clear,color: Colors.white,)),
                      ),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              _show = false;
                              setState(() {});
                              getRecipetImage(ImageSource.gallery);
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 10,
                                  vertical: 10),
                              padding: EdgeInsets.symmetric(horizontal: 20,
                                  vertical: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: bgColor,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.image, color: Colors.white,
                                    size: 40,),
                                  Text("Gallery",
                                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),)
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10,bottom: 10),
                          height: 70,
                          width: 2,
                          color: Colors.black54,
                        ),
                        Expanded(child:   InkWell(
                          onTap: () {
                            _show = false;
                            setState(() {});
                            getRecipetImage(ImageSource.camera);
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10,
                                vertical: 10),
                            padding: EdgeInsets.symmetric(horizontal: 20,
                                vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: bgColor,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.camera_alt_sharp, color: Colors.white,
                                  size: 40,),
                                Text("Camera",
                                  style: TextStyle(color: Colors.white),)
                              ],
                            ),
                          ),
                        ),)
                      ],)
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
  // _validateSignatures(){
  //   if(_isDealer==null){
  //    CustomSnackBar.failedSnackBar(context: context, message: "Dealer Signature can't be empty");
  //     return false;
  //   }
  //   else if(_isRider==null){
  //    CustomSnackBar.failedSnackBar(context: context, message: "Rider Signature can't be empty");
  //     return false;
  //   }
  //   else if(recipetImage==null){
  //     CustomSnackBar.failedSnackBar(context: context, message: "Please Add Recipet Picture");
  //     return false;
  //   }
  //   else{
  //     return true;
  //   }
  // }

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
  // getFormatedDate(_date) {
  //   DateTime dates = DateTime.parse(_date);
  //   print(dates);
  //   month = DateFormat('MMMM').format(dates).substring(0, 3);
  //   day = dates.day;
  //   time = DateFormat('hh:mm a').format(dates);
  // }
}
