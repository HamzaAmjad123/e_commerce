
import 'package:e_commerce/model/admin_models/stock_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../configs/api_urls.dart';
import '../../helper_services/custom_post_request_service.dart';
import '../../provider/admin_provider/stock_list_provider.dart';

class StockListService{
  Future getStockList({required BuildContext context,required int seriesId,required int itemTypeId,required int skip,required int take})async{
    try{
      Map _body={"seriesId":seriesId,"itemTypeId":itemTypeId,"skip":skip,"take":take};
      var res=await PostRequestService().httpPostRequest(url: getStockListUrl, body: _body, context: context);
      if(res!=null){
        StockListModel stockList=StockListModel.fromJson(res);
        Provider.of<StockListProvider>(context,listen: false).updateStock(
          newStock: stockList.result
        );
        return true;
      }
      else{
        return null;
      }
    }
        catch(err){
      print("Exception in Get Stock List Service $err");
      return null;
        }
  }
}