import 'package:e_commerce/configs/api_urls.dart';
import 'package:e_commerce/helper_services/custom_post_request_service.dart';
import 'package:e_commerce/model/order_log_model.dart';
import 'package:e_commerce/provider/order_log_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class OrderLogService {
  Future getOrderLog({required BuildContext context, required int id}) async {
    try {
      Map _body = {"id": id,};

      var res = await PostRequestService().httpPostRequest(url: orderLogUrl, body: _body, context: context);
      if (res != null) {
        //to make list of order
        List<OrderLogModel> orderLog = (res).map<OrderLogModel>((m )=> OrderLogModel.fromJson(m)).toList();
        List<OrderLogModel> neworderLog= await makeNewList(orderLog);
        Provider.of<OrderLogProvider>(context, listen: false)
            .updateorderlog(neworderlog: neworderLog);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("Exception in OrderLogService $e");
      return false;
    }
  }

  Future<List<OrderLogModel>> makeNewList(List<OrderLogModel> orderLog) async{
    List<OrderLogModel> temp=[];
    orderLog.forEach((element) {
      temp.add(element);
    });
    return temp;
  }
}
