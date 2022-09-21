import 'dart:io';
import 'package:e_commerce/configs/color.dart';
import 'package:e_commerce/helper_services/custom_loader.dart';
import 'package:e_commerce/helper_services/custom_snackbar.dart';
import 'package:e_commerce/service/send_payment_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../configs/text_style.dart';
import '../../../helper_widgets/custom_button.dart';
import '../../../helper_widgets/custom_text_fild.dart';

class SendPaymentScreen extends StatefulWidget {
  const SendPaymentScreen({Key? key}) : super(key: key);

  @override
  State<SendPaymentScreen> createState() => _SendPaymentScreenState();
}

class _SendPaymentScreenState extends State<SendPaymentScreen> {
  TextEditingController _amountCont = TextEditingController();
  FocusNode amountFocus = new FocusNode();
  TextEditingController _nameCont = TextEditingController();
  TextEditingController _detailsCont=TextEditingController();
  FocusNode nameFocus = new FocusNode();
  int? selectedAmount;
  // List<int> amountList = [
  //   1,
  //   10,
  // ];
  List amountList=[
    {
      "id":1,
      "name":"cash"
    },
    {
      "id":10,
      "name":"other"
    }
  ];

  File? imageFile;
  PickedFile? amountImage;
  bool _show = false;
  List<int> Bytes=[];


  _sendPaymentHandler()async{
    CustomLoader.showLoader(context: context);
    await SendPaymentService().sendPayment(context: context, total: _amountCont.text, receivedType: selectedAmount!, details: _detailsCont.text, tenatId: 0, image: Bytes, receiverName: _nameCont.text);
    CustomLoader.hideLoader(context);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: bgColor,
          title: Text("Send Amount"),
        ),
        bottomSheet: _showBottomSheet(),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 12.0),
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(12.0)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Total Amount", style: cashStyle),
                            Text("50,000", style: rsStyle),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                CustomTextField(
                  headerText: "Enter Amount",
                  shape: true,
                  hintText: "Enter Amount",
                  controller: _amountCont,
                  focusNode: amountFocus,
                  inputType: TextInputType.number,
                  // onChange: (val){
                  //   _amountCont.text=val;
                  // },
                ),
                Text(
                  "Select Amount Type",
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  height: 45.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                          color: selectedAmount==null
                              ? lightBlackColor
                              : bgColor,
                          width: 1.5)
                  ),
                  child: DropdownButton(
                      isExpanded: true,
                      underline: SizedBox(),
                      hint: Text("Select Amount"),
                      // value: selectedAmount,
                      value:selectedAmount,
                      items: amountList.map((item) {
                        return DropdownMenuItem(
                          value: item["id"],
                          child: Text(item["name"]),
                        );
                      }).toList(),
                      onChanged: (value) {
                        // print("sfnfasnsdfn $selectedAmount");
                        selectedAmount=value as int?;
                        print("Asad $selectedAmount");
                        setState(() {});
                      }),
                ),
                CustomTextField(
                  shape: true,
                  headerText: "Enter Reciver Name",
                  hintText: "Enter Reciver",
                  controller: _nameCont,
                  focusNode: nameFocus,
                  inputType: TextInputType.text,
                  // onChange: (value){
                  //   _nameCont.text=value;
                  // },
                ),
                CustomTextField(
                  shape: true,
                  headerText: "Enter Details",
                  hintText: "Details",
                  controller: _detailsCont,
                  // focusNode: nameFocus,
                  inputType: TextInputType.text,

                ),
                Center(
                  child: Container(

                    height: 90,
                    width: 130,
                    child: amountImage != null
                        ? Image.file(
                      File(amountImage!.path),
                      fit: BoxFit.cover,
                    ) : Icon(
                      Icons.camera_alt_sharp,
                      size: 80,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Center(
                  child: CustomButton(
                    height: 40,
                    text: "Take Picture",
                    buttonColor: lightBlackColor,
                    onTap: (){
                      _show = true;
                      setState(() {});
                    },
                  ),
                ),
                CustomButton(
                  text: "Submit",
                  verticalMargin: 12.0,
                  width:double.infinity,
                  horizontalMargin: 20.0,
                  onTap: () async{
                    setState(() {});
                    if(validation()){
                      await _convertImageIntoBytes();
                      await _sendPaymentHandler();
                    }
                  },
                ),
              ],
            ),
          ),
        ));
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
                              getImage(ImageSource.gallery);
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
                          getImage(ImageSource.camera);
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
  getImage(ImageSource source) async {
   amountImage =
    await ImagePicker().getImage(
      source: source,
    );
    if (amountImage != null) {
      setState(() {
        imageFile = File(amountImage!.path);
      });
    }
  }

  _convertImageIntoBytes()async{
    Bytes=await File(amountImage!.path).readAsBytesSync();
    setState(() {});
  }

  validation(){
    if(_amountCont.text.isEmpty){
      CustomSnackBar.failedSnackBar(context: context, message: "Please Enter amount");
      amountFocus.requestFocus();
      return  false;
    }else if(_nameCont.text.isEmpty){
      CustomSnackBar.failedSnackBar(context: context, message: "Please Enter Reciver Name");
      nameFocus.requestFocus();
      return  false;
    }
    else if(selectedAmount==""){
      CustomSnackBar.failedSnackBar(context: context, message: "Select Amount Type");
      return  false;
    } else if(amountImage==null) {
      CustomSnackBar.failedSnackBar(
          context: context, message: "Please add Image");
      return false;
    }
    else{
      return true;
    }
  }


}
