
import 'package:e_commerce/helper_services/custom_post_request_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../configs/api_urls.dart';
import '../../model/admin_models/admin_ledger_model.dart';
import '../../provider/admin_provider/admin_ledger_provider.dart';

class AdminLedgerService{
  Future  getLedgerStatement({required BuildContext context, required int skip,required int take,required String searchText})async{
    try{
      Map _body={"skip":skip,"take":take,"searchText":searchText};
      var res=await PostRequestService().httpPostRequest(url: adminLedgerUrl, body: _body, context: context);
      if(res!=null){
        AdminLedgerModel ledgerModel=AdminLedgerModel.fromJson(res);
        Provider.of<AdminLedgerProvider>(context,listen: false).updateLedger(
          newLedger: ledgerModel.result
        );
        return true;
      }
      else{
        return null;
      }
    }
        catch(err){
      print("Exception in admin ledger service $err");
      return null;
        }
  }
}