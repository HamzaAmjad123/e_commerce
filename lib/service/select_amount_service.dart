

import 'package:e_commerce/configs/api_urls.dart';
import 'package:e_commerce/helper_services/custom_post_request_service.dart';
import 'package:e_commerce/provider/select_amount_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../model/select_amount_model.dart';

class SelectAmountService{
  Future selectAmount({required BuildContext context})async{
    try{
      Map _body={};
      var res=await PostRequestService().httpPostRequest(url: selectAmountUrl, body:_body , context: context);
      if(res!=null){
        SelectAmountModel selectAmount=SelectAmountModel.fromJson(res);
        Provider.of<SelectAmountProvider>(context,listen: false).updateAmount(newAmount: selectAmount.result);
        return true;
      }
      else{
        return null;
      }
    }
        catch(err){
      print("Exception in Select Amount Service $err");
      return null;
        }
  }
}