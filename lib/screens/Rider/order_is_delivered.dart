import 'dart:io';
import 'dart:typed_data';
import 'package:e_commerce/helper_services/custom_loader.dart';
import 'package:e_commerce/helper_widgets/custom_text_fild.dart';
import 'package:e_commerce/model/rider_models/rider_order_model.dart';
import 'package:e_commerce/model/user_model.dart';
import 'package:e_commerce/service/rider_services/delivered_order_service.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import '../../configs/color.dart';
import 'dart:ui' as ui;

import '../../configs/text_style.dart';
import '../../helper_widgets/custom_button.dart';

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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: AppBar(
          leading: Padding(
            padding: const EdgeInsets.symmetric(vertical:15.0,horizontal: 22.0),
            child: Icon(Icons.arrow_back_sharp,color: whiteColor,),
          ),
          centerTitle: true,
          title: Text("Delivery Details",style: barStyle,),
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
        bottomNavigationBar: Container(
          height: kTextTabBarHeight*0.9,
          margin: EdgeInsets.symmetric(vertical: 8.0,horizontal: 12.0),
          child:  CustomButton(
            text: "Delivery Completed",
            fontSize: 18.0,
            width:double.infinity,
            horizontalMargin: 25.0,
            onTap: () async{
              await _convertRcepitIntoBytes();
              await _deliveredOrderHandler();
              setState(() {

              });
            },
          ),
        ),
      bottomSheet: _showBottomSheet(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [



            Center(
              child: Card(
                color: whiteColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                elevation: 8.0,
                margin: EdgeInsets.symmetric(vertical: 15.0),
                child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height/7.5,
                  width: MediaQuery.of(context).size.width/1.5,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Order No :", style:creditStyle),
                      SizedBox(width: 12.0,),
                      Text(widget.orderNo,style: cashStyle,),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Card(
                color: whiteColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                elevation: 8.0,
                margin: EdgeInsets.only(bottom: 15.0),
                child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height/7.5,
                  width: MediaQuery.of(context).size.width/1.5,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("No Of Bags :", style:creditStyle),
                      SizedBox(width: 12.0,),
                      Text(widget.noOfBags.toString(),style: cashStyle,),
                    ],
                  ),
                ),
              ),
            ),

            CustomTextField(
              labelText: "Other Details",
              shape: true,
              controller: _detailsCont,
              focusNode: _detailsFocus,
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 6.0,top: 8.8,bottom: 8.0,left:5.0),
                  padding: EdgeInsets.symmetric(vertical: 4.0,horizontal: 4.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: lightBlackColor),
                      borderRadius: BorderRadius.circular(8.0)
                  ),
                  child: recipetImage != null
                      ? Image.file(
                          File(recipetImage!.path),
                    height: 100.0,
                    width: 150.0,
                    fit: BoxFit.fill,
                        )
                      : Icon(
                          Icons.camera_alt_sharp,

                          color: blackColor,
                        ),
                ),
                TextButton(onPressed: (){
                  _show = true;
                  setState(() {});
                }, child: Text("Add Photo",style: photoStyle,))
              ],
            ),
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
