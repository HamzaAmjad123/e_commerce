import 'package:e_commerce/provider/dealer_history_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../configs/api_urls.dart';
import '../helper_services/custom_post_request_service.dart';
import '../model/dealer_orders_model.dart';
import '../model/order_list_model.dart';

class DealerHistoryService{
  Future getDelaerHistory({required int skip,required int take,required BuildContext context,required String formDate,required String toDate,required String searchText})async{
    try{
      Map _body={"skip":skip,"take":take,"fromDate":formDate,"toDate":toDate,"searchText":searchText};

      var res=await PostRequestService().httpPostRequest(url: getDealerHistoryUrl, body: _body, context: context);
      if(res !=null){
        DealerOrdersModel dealerHistoryModel=DealerOrdersModel.fromJson(res);
        Provider.of<DealerHistoryProvider>(context,listen: false).updateApprovedOrders(
          newlist: dealerHistoryModel.result,
        );
        return true;
      }
      else{
        return false;
      }
    }
    catch(err){
      print("Exception in DealerHsitory Service $err");
      return  false;
    }
  }
}