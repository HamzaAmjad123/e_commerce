import 'package:e_commerce/helper_services/custom_post_request_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../configs/api_urls.dart';
import '../../model/admin_models/pending_orders_model.dart';
import '../../provider/admin_provider/pending_orders_provider.dart';

class PendingOrdersService{
  Future getPendingOrders({required BuildContext context,required int dealerId,required String fromDate,required String toDate,required int skip,required int take})async{

    try{
      Map _body={"dealerId":dealerId,"fromDate":fromDate,"toDate":toDate,"skip":skip,"take":take};
      var res=await PostRequestService().httpPostRequest(url: admiPenOrderUrl, body: _body, context: context);
      if(res!=null){
        PendingOrdersListModel pendOrders=PendingOrdersListModel.fromJson(res);
       Provider.of<AdminPendingOrdersProvider>(context,listen: false).updatePendingOrders(
         newOrders: pendOrders.result
       );
       return true;
      }
      else{
        return null;
      }
    }
        catch(err){
      print("Exception in Admin Pending Order Service $err");
      return null;
        }

  }
}