import 'package:e_commerce/provider/Rider_providers/rider_history_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../configs/api_urls.dart';
import '../../helper_services/custom_post_request_service.dart';
import '../../model/rider_models/rider_order_model.dart';

class RiderHistoryService{
  Future getRiderHistoryList({required int skip,required int take,required BuildContext context})async{
    try{
      Map _body={"skip":skip,"take":take};

      var res=await PostRequestService().httpPostRequest(url: riderHistoryOrdersurl, body: _body, context: context);
      if(res !=null){
        List<RiderOrdersModel> historyList=(res).map<RiderOrdersModel>((m)=> RiderOrdersModel.fromJson(m)).toList();
        Provider.of<RiderHistoryProvider>(context,listen: false).updateRiderHistory(
          newList: historyList,
        );
        return true;
      }
      else{
        return false;
      }
    }
    catch(err){
      print("Exception in Rider History Service $err");
      return  false;
    }
  }
}