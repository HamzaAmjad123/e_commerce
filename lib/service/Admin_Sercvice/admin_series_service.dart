

import 'package:e_commerce/configs/api_urls.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../helper_services/custom_post_request_service.dart';
import '../../model/admin_models/admin_series_model.dart';
import '../../provider/admin_provider/admin_series_provider.dart';

class GetAdminSeriesService{
  Future getAdminSeries({required BuildContext context,required int skip,required int take})async{
    try{
      var _body={
        "skip":skip,
        "take": take
      };
      var res=await PostRequestService().httpPostRequest(url: adminSeriesList, body: _body, context: context);
      if(res!=null){
        AdminSeriesModel seriesModel=AdminSeriesModel.fromJson(res);
        Provider.of<AdminSeriesProvider>(context,listen: false).updateSeriesList(
          list: seriesModel.seriesList,
        );
        return true;
      }
      else{
        return null;
      }
    }
    catch(err){
      print("Exception in Get AdminSereies Service $err");
      return null;
    }
  }
}