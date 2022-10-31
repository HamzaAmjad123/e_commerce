import 'dart:convert';

import 'package:e_commerce/configs/api_urls.dart';
import 'package:e_commerce/helper_services/custom_post_request_service.dart';
import 'package:flutter/cupertino.dart';

import '../model/order_objection_model.dart';

class CreateObjectionService {
  Future createObjection({
    required BuildContext context,
    required int orderId,
    required String objDetails,
    required List<ObjectionOrderLines> orderItems,
  }) async {
    try {
      // Map _body = {
      //   "orderId": orderId,
      //   "orderObjectionDetail": objDetails,
      //   "orderObjectionId": orderObjId,
      //   "expectedQuantity": expectedQnt,
      //   "receivedQuantity": receivedQnt,
      //   "itemId": itemId
      // };
      Map _body = {
        "orderId": orderId,
        "orderObjectionDetail": objDetails,
        "ordersItems":orderItems.map((v) => v.toJson()).toList()

      };
      print("Bodyyyyy ${json.encode(_body)}");
      var res = await PostRequestService1()
          .httpPostRequest(url: createObjUrl, body: _body, context: context);
      if (res != null) {

        print("Objection Created Successfully");
        return true;
      } else {
        print("Obj exception");
        return null;
      }
    } catch (err) {
      print("Exception in Create Objection Sercvice $err");
      return null;
    }
  }
}
