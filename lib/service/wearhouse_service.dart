


import 'dart:convert';

import 'package:e_commerce/helper_services/custom_post_request_service.dart';
import 'package:e_commerce/helper_services/custom_snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../configs/api_urls.dart';
import '../model/wearhouse_model.dart';
import '../provider/wearhouse_provider.dart';

class WearHouseService{
  Future getWearHouse({required BuildContext context})async{
    try{
      var res=await PostRequestService().httpPostRequest(url: getWareHouseUrl, body:{}, context: context);
      if(res!=null){
       print("ress");
       print(res);

        List<WearHouseModel> wearHouseList=[];
        wearHouseList= (res).map<WearHouseModel>((m )=> WearHouseModel.fromJson(m)).toList();;
        print("hshshadhsagsa");
        Provider.of<WearHouseProvider>(context,listen:false).updateWearHouse(
          list: wearHouseList,
        );
        return true;
      }else{
        return false;
      }

    }catch(e){
      CustomSnackBar.failedSnackBar(context: context, message:"Exception in WearHouse service $e");
      print("Exception in WearHouse service $e");
      return false;
    }
  }
}