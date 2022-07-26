

import 'package:e_commerce/configs/api_urls.dart';
import 'package:e_commerce/helper_services/custom_post_request_service.dart';
import 'package:e_commerce/model/series_model.dart';
import 'package:e_commerce/provider/series_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SeriesServices{
  Future getSeries({required BuildContext context,required int tenantid,required int skip,required int take})async{
    try{
      Map _body={"tenantId":tenantid,"skip":skip,"take":take};
      var  res= await PostRequestService().httpPostRequest(url: getSereiesUrl, body: _body, context: context);
      if(res!=null){
        SeriesModel seriesModel=SeriesModel.fromJson(res);
        Provider.of<SeriesProvider>(context,listen: false).updateSeries(
          newSeries: seriesModel.result
        );
        return true;
      }else{
        return false;
      }
    }catch(err){
      print("Exception in getSeries Service $err");
    }
  }
}