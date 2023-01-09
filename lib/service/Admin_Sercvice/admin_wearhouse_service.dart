


import 'package:e_commerce/helper_services/custom_post_request_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../configs/api_urls.dart';
import '../../model/admin_models/admin_wearhouse_model.dart';
import '../../provider/admin_provider/admin_wearhouse_provider.dart';

class AdminWearHouseService {
  Future getWearHouse({required BuildContext context})async{
    try{
      Map _body={};
      var res=await PostRequestService().httpPostRequest(url: adminWearHouseUrl, body: _body, context: context);
      if(res!=null){
        List<AdminWearhouseModel> adminWearHouse=res.map<AdminWearhouseModel>((v)=>AdminWearhouseModel.fromJson(v)).toList();
        Provider.of<AdminWearHouseProvider>(context,listen: false).updateWearHouse(
          newWearHouse: adminWearHouse
        );
        return true;
      }
      else{
        return null;
      }
    }
        catch(err){
      print("Exception in Admin WearHouse Service $err");
      return null;
        }
  }
}