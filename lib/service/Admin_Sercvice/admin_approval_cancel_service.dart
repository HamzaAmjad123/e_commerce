

import 'dart:math';

import 'package:e_commerce/helper_services/custom_post_request_service.dart';
import 'package:flutter/cupertino.dart';

import '../../configs/api_urls.dart';

class ApprovalOrCancelService{
  Future getApproval({required BuildContext context,required int orderId,required int status})async{
    Map _body={"orderId":orderId,"status":status};
    try{
      var res=await PostRequestService().httpPostRequest(url: approvalOrCancelUrl, body: _body, context: context);
      if(res!=null){
        print("Action Perform Successfully");
        return true;
      }
      else{
        return null;
      }
    }
        catch(err){
      print("Exception in admin approval or cancel service $err");
      return null;
        }
  }

}