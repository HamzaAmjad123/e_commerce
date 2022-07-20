
import 'package:e_commerce/configs/api_urls.dart';
import 'package:e_commerce/helper_services/custom_get_request_service.dart';
import 'package:e_commerce/model/vsits_model.dart';
import 'package:e_commerce/provider/visits_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VisitsService{
  Future getVisits({required BuildContext context,required int userId})async{
    try{
      var res=await GetRequestService().httpGetRequest(url: visitsUrl + "SOID=$userId", context: context);
      if(res !=null){
        VisitsModel visits=VisitsModel.fromJson(res);
        Provider.of<VisitsProvider>(context,listen: false).updateVisits(
          newVisits: visits.mainDashboard
        );
        return true;
      }
      else{
        return false;
      }
    }
        catch(err){
      print("exception in get visits service $err");
      return false;
        }
  }
}