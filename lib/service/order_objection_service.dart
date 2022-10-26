

 import 'package:e_commerce/helper_services/custom_post_request_service.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../configs/api_urls.dart';
import '../model/order_objection_model.dart';
import '../provider/order_objection_provider.dart';

class OrderObjectionService{
  Future getObjection({required BuildContext context,required int orderId})async{
    try{
      Map _body={"id":orderId};
      var res=await PostRequestService().httpPostRequest(url: getOrerDetailsUrl, body: _body, context: context);
      if(res!=null){
        print("Order Id $orderId");
        OrderObjectionModel orderObjection=OrderObjectionModel.fromJson(res);
        Provider.of<OrderObjectionProvider>(context,listen: false).updateObjection(
          newObjection: orderObjection
        );
        return true;
      }
      else{
        return false;
      }

    }

        catch(err){
      print("Exception in Order Objection Sercice $err");
      return null;
        }
  }
 }