import 'package:e_commerce/configs/api_urls.dart';
import 'package:e_commerce/helper_services/custom_post_request_service.dart';
import 'package:flutter/cupertino.dart';

class CreateObjectionService {
  Future createObjection(
      {required BuildContext context,
      required int orderId,
      required String objDetails,
      required int orderObjId,
      required int expectedQnt,
      required String receivedQnt,
      required int itemId}) async {
    try {
      Map _body={"orderId":orderId,"orderObjectionDetail":objDetails,"orderObjectionId":orderObjId,"expectedQuantity":expectedQnt,"receivedQuantity":receivedQnt,"itemId":itemId};
      var res=await PostRequestService().httpPostRequest(url: createObjUrl, body: _body, context: context);
      if(res!=null){
        print("Order Id $orderId");
        print("EXPECTED QNT ${expectedQnt}");
        print("Item Id $itemId");
        print("Objection Created Successfully");
        return true;
      }
      else{
        print("Obj exception");
        return null;
      }
    }
    catch (err) {
      print("Exception in Create Objection Sercvice $err");
      return null;
    }
  }
}
