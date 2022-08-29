import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../configs/api_urls.dart';
import '../../helper_services/custom_post_request_service.dart';
import '../../model/rider_models/rider_order_model.dart';
import '../../provider/Rider_providers/rider_orders_provider.dart';

class RiderOrdersService{
  Future getRiderOrderList({required int skip,required int take,required BuildContext context})async{
    try{
      Map _body={"skip":skip,"take":take};

      var res=await PostRequestService().httpPostRequest(url: riderApprovedOrdersurl, body: _body, context: context);
      if(res !=null){
        print("respppoonnnseeeeeee");
        print(res);
        List<RiderOdersModel> approvedOrders=(res).map<RiderOdersModel>((m )=> RiderOdersModel.fromJson(m)).toList();
        Provider.of<RiderApprovesOrdersProvider>(context,listen: false).updateRiderApprovedOrders(
          newList: approvedOrders,
        );
        return true;
      }
      else{
        return false;
      }
    }
    catch(err){
      print("Exception in Rider ApprovedOrders Service $err");
      return  false;
    }
  }
}