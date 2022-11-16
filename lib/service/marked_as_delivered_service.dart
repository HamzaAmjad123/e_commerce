
import 'package:e_commerce/helper_services/custom_post_request_service.dart';
import 'package:flutter/material.dart';

import '../configs/api_urls.dart';

class MarkAsDeliveredService{
  Future markAsDelivered({required BuildContext context,required int orderId})async{
    try{
      Map _body={"orderId":orderId};
      var res=await PostRequestService().httpPostRequest(url: markAsDeliveredUrl, body: _body, context: context);
      if(res!=null){
        print("Order is Delivered");
        return true;

      }
      else{
        return  null;
      }
      
    }
        catch(err){
      print("Exception in Mark As Delivered Service $err");
      return null;
        }
  }
}