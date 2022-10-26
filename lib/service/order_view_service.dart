import 'package:e_commerce/configs/api_urls.dart';
import 'package:e_commerce/helper_services/custom_post_request_service.dart';
import 'package:e_commerce/model/order_deatils_model.dart';
import 'package:e_commerce/model/order_log_model.dart';
import 'package:e_commerce/provider/order_getDeatils_provider.dart';
import 'package:e_commerce/provider/order_log_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class OrderViewService {
  Future getOrderDetails({required BuildContext context, required int id}) async {
    try {
      Map _body = {"id": id,};

      var res = await PostRequestService().httpPostRequest(url: getOrerDetailsUrl, body: _body, context: context);
      if (res != null) {
        OrderDetailsModel orderDeatils=OrderDetailsModel.fromJson(res);
        print(res);
        Provider.of<OrderDetailsProvider>(context,listen: false).updateOrderDetails(
          newOrderDetails:  orderDeatils,
        );
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("Exception in OrderViewService $e");
      return false;
    }
  }
}
