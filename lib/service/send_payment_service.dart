import 'package:e_commerce/helper_services/custom_post_request_service.dart';
import 'package:flutter/cupertino.dart';

import '../configs/api_urls.dart';

class SendPaymentService {
  Future sendPayment(
      {required BuildContext context,
      required String total,
      required int receivedType,
      required String details,
      required int tenatId,
      required List<int> image,
      required String receiverName}) async {
      try{
          Map _body={"total":total,"receivedType":receivedType,"amountReceivedDetail":details,"tenantId":tenatId,"images":image,"receiverDetail":receiverName};

          var res=await PostRequestService().httpPostRequest(url: sendPaymentUrl, body: _body, context: context);
          if(res !=null){
              print("Payment send successfully");
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
