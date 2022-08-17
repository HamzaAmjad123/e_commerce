

import 'package:e_commerce/configs/api_urls.dart';
import 'package:e_commerce/helper_services/custom_post_request_service.dart';
import 'package:e_commerce/model/items_cart_model.dart';
import 'package:e_commerce/model/save_order_model.dart';
import 'package:e_commerce/provider/save_order_provider.dart';
import 'package:flutter/cupertino.dart';

import 'package:provider/provider.dart';

import '../model/save_order_model.dart';


class SaveOrderServices{
  Future<bool> SaveOrder({required BuildContext context,required List<CartModel> list})async{

    try{
      Map _body={
        "orders": list,

      };
      var res=await PostRequestService().httpPostRequest(url: saveOrderUrl, body: _body, context: context);
      if(res!=null){
        OrderSaveModel orderSave=OrderSaveModel.fromJson(res);
        Provider.of<SaveOrderProvider>(context,listen: false).updateSaveOrder(
          newMessage: orderSave.message,
          newOrderId: orderSave.order,
        );
        return true;
      }else{
        return false;
      }
    }catch(e){
      print("error in save order Service  $e");
      return false;
    }
  }
}