

import 'package:e_commerce/configs/api_urls.dart';
import 'package:e_commerce/helper_services/custom_post_request_service.dart';
import 'package:e_commerce/helper_services/custom_snackbar.dart';
import 'package:flutter/cupertino.dart';

class DeliveredOrderService{
  Future deliverOrder({required BuildContext context,required int orderId,required String shipmentDetails,required List<int> reciptPath})async{

    try{
      Map _body={"orderId":orderId,"shipmentDetail":shipmentDetails,"cargoReciptImage":reciptPath};
      var  res=await PostRequestService().httpPostRequest(url: deliveredOrderUrl, body: _body, context: context);
      if(res!=null){
        print("Order Is Delivered Successfully");
        CustomSnackBar.showSnackBar(context: context, message: "Order Is Delivered Successfully");
        Navigator.pop(context);
        return true;
      }
      else{
        return null;
      }
    }
        catch(err){
      print("Exception in Delivered Order Service $err");
      return null;
        }
}
}