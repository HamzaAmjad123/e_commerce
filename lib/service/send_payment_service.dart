import 'package:e_commerce/helper_services/custom_loader.dart';
import 'package:e_commerce/helper_services/custom_post_request_service.dart';
import 'package:e_commerce/helper_services/custom_snackbar.dart';
import 'package:flutter/cupertino.dart';

import '../configs/api_urls.dart';

class SendPaymentService {
  Future sendPayment(
      {required BuildContext context,
      required String total,
      required int receivedType,
      required String details,
      required List<int> image,
      required String receiverName}) async {
      try{

          Map _body={"total":total,"paymentMethodId":receivedType,"amountReceivedDetail":details,"images":image,"receiverDetail":receiverName,"voucherId":0};
          print(_body);
          var res=await PostRequestService().httpPostRequest(url: sendPaymentUrl, body: _body, context: context);
          if(res !=null){
              print("Payment send successfully");
              CustomSnackBar.showSnackBar(context: context, message: "Payment send successfully");
              return true;
          }
          else{
              print("Invalid");
              return null;
          }

      }
          catch(err){
          print("exception in send amount service $err");
          return null;
          }
  }
}
