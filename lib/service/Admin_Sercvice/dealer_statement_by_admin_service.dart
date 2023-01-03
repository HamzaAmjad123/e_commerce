
import 'package:e_commerce/model/admin_models/dealer_statement_by_admin_model.dart';
import 'package:e_commerce/provider/admin_provider/dealer_statement_by_admin_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../configs/api_urls.dart';
import '../../helper_services/custom_post_request_service.dart';

class DealerStatementByAdminService{
  Future getStatement({required BuildContext context,required int voucherId,required int skip,required int take,required String fromDate,required String toDate})async{
    try{
      Map _body={"voucherId":voucherId,"skip":skip,"take":take,"fromDate":fromDate,"toDate":toDate};
      
      var res=await PostRequestService().httpPostRequest(url: dealerStatByAdminUrl, body: _body, context: context);
      if(res!=null){
        DealerStatementByAdminModel dealerStatement=DealerStatementByAdminModel.fromJson(res);
        Provider.of<DealerStatementByAdminProvider>(context,listen: false).updateDealerState(
          newDealerStat: dealerStatement.result
        );
        return true;
      }
      else{
        return null;
      }
    }
        catch(err){
      print("Exception in get dealer statement by admin list service $err");
      return null;
        }
  }
}