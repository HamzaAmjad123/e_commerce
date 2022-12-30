

import 'package:e_commerce/model/admin_models/approved_order_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../configs/api_urls.dart';
import '../../helper_services/custom_post_request_service.dart';
import '../../provider/admin_provider/approved_order_provider.dart';

class ApprovedOrdersService{
  Future getApprovedOrders({required BuildContext context,required int dealerId,required String fromDate,required String toDate,required int skip,required int take})async{

    try{
      Map _body={"dealerId":dealerId,"fromDate":fromDate,"toDate":toDate,"skip":skip,"take":take};
      var res=await PostRequestService().httpPostRequest(url: admiApprovOrderUrl, body: _body, context: context);
      if(res!=null){
        ApprovedOrderModel approvedOrder=ApprovedOrderModel.fromJson(res);
        Provider.of<AdminApprovedOrdersProvider>(context,listen: false).updateApprovedOrders(
          newOrders: approvedOrder.approvedOrders
        );
        return true;
      }
      else{
        return null;
      }
    }
    catch(err){
      print("Exception in Admin Approved Order Service $err");
      return null;
    }

  }
}