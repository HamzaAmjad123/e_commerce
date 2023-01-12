

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../configs/api_urls.dart';
import '../../helper_services/custom_post_request_service.dart';
import '../../model/admin_models/admin_get_items_list_model.dart';
import '../../provider/admin_provider/admin_items_list_provider.dart';


class AdminItemsListService{
  Future getItemsList({required BuildContext context,required int skip,required int take})async{
    try{
      Map _body={"skip":skip,"take":take};
      var res=await PostRequestService().httpPostRequest(url: adminItemsListUrl, body: _body, context: context);
      if(res!=null){
        AdminGetItemsListModel getItems=AdminGetItemsListModel.fromJson(res);
        Provider.of<AdminItemsListProvider>(context,listen: false).updateItemsList(
          newitems: getItems.result
        );
        return true;
      }
      else{
        return null;
      }
    }
        catch(err){
      print("Exception in get items list service $err");
      return null;
        }
  }
}