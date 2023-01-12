import 'package:e_commerce/model/admin_models/admin_get_items_list_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../configs/api_urls.dart';
import '../../helper_services/custom_post_request_service.dart';
import '../../model/admin_models/admin_ranks_model.dart';
import '../../provider/admin_rank_list_provider.dart';

class AdminRanksListService{
  Future getRanks({required BuildContext context})async{
    try{
      Map _body={};
      var res=await PostRequestService().httpPostRequest(url: adminRanksUrl, body: _body, context: context);
      if(res!=null){
        List<AdminRanksListModel> rankList=res.map<AdminRanksListModel>((v)=>AdminRanksListModel.fromJson(v)).toList();
        Provider.of<AdminRanksListProvider>(context,listen: false).updateRanks(
          newList:rankList
        );
        return true;

      }
      else{
        return null;
      }
    }
        catch(err){
      print("Exception in ranks list service $err");
      return null;
        }
  }
}