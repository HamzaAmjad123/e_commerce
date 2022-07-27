import 'dart:convert';

import 'package:e_commerce/configs/api_urls.dart';
import 'package:e_commerce/helper_services/custom_post_request_service.dart';
import 'package:e_commerce/provider/items_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;
import 'package:provider/provider.dart';
import '../model/items_model.dart';
import 'local_storage_service.dart';

class ItemsService{
  Future getAllItems({required BuildContext context,required int take,required int skip,required int seriesId,required int itemId})async{
    try{
      Map _body={"seriesId": seriesId, "take": take, "skip": skip,"itemTypeId": itemId};

      var res=await PostRequestService().httpPostRequest(url: getItemsUrl, body: _body, context: context);
      print("responseeeeeeeeeeeeeeee $res");
      if(res!=null){
        print("respon $res");
        ItemsModel itemsModel=ItemsModel.fromJson(res);
        Provider.of<ItemsProvider>(context,listen: false).updateItems(
          newItemsList: itemsModel.result
        );
        return  true;
      }
      else{
        return false;
      }

    }
    catch(err){
      print("exception in getItemservice $err");
      return false;
    }
  }
}