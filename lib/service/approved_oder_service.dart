
import 'dart:math';

import 'package:e_commerce/configs/api_urls.dart';
import 'package:e_commerce/helper_services/custom_post_request_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../model/approved_order_model.dart';
import '../provider/approved_order_provider.dart';

class  ApprovedOrderService{
  Future getApprovedOrder({required BuildContext context,required String searchText,required int skip,required int take})async{
    try{
      Map _body={"searchText":searchText,"skip":skip,"take":take};
      var res=await PostRequestService().httpPostRequest(url: approvedOrderUrl, body: _body, context: context);
      if(res!=null){
        ApprovedOrderModel approvedOrder=ApprovedOrderModel.fromJson(res);
        Provider.of<ApprovedOrderProvider>(context,listen: false).updateApprovedOrder(
          newOrder: approvedOrder.result
        );
        return true;
      }
      else{
        return null;
      }
    }
        catch(err){
      print("Exception in approved order service $err");
      return  null;
        }
  }
}