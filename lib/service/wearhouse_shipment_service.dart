
import 'package:e_commerce/configs/api_urls.dart';
import 'package:e_commerce/helper_services/custom_post_request_service.dart';
import 'package:flutter/cupertino.dart';

import '../model/wearhouse_shippment_model.dart';
import 'package:provider/provider.dart';

import '../provider/wearhouse_shipment_provider.dart';

class WearHouseShipmentService{
  Future getShipment({required BuildContext context,required int wearHouseId})async{
    try{
      Map _body={"id":wearHouseId};
      var res=await  PostRequestService().httpPostRequest(url: getShipmentUrl, body: _body, context: context);
      if(res!=null){
        WearHouseShipmentModel wearHouseShipment=WearHouseShipmentModel.fromJson(res);
        Provider.of<WearHouseShipmentProvider>(context,listen: false).updateShipment(
          newShipment: wearHouseShipment.result
        );
        return true;
      }
      else{
        return null;
      }
    }
        catch(err){
      print("Exception in WrarHouse Shipment Service $err");
      return  null;
        }
  }
}