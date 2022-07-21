

import 'package:e_commerce/helper_services/custom_get_request_service.dart';
import 'package:e_commerce/model/categories_model.dart';
import 'package:e_commerce/provider/category_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../configs/api_urls.dart';


class CategoriesService{
  Future getCategory({required BuildContext context})async{
    try{
      var res=await GetRequestService().httpGetRequest(url: getCatUrl, context: context);
      if(res !=null){
        CategoriesModel categories=CategoriesModel.fromJson(res);
        Provider.of<CategoriesProvider>(context,listen: false).updateCat(
          newCat: categories.result
        );
        return true;
      }
      else{
        return false;
      }
    }
        catch(err){
      print("Exception in getCat Service $err");
      return false;
        }
  }
}