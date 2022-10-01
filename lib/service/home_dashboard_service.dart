

import 'package:e_commerce/configs/api_urls.dart';
import 'package:e_commerce/helper_services/custom_post_request_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../model/home_dashboard_model.dart';
import '../provider/home_dashboard_provider.dart';

class HomeDashboardService{
  Future getDashboardData({required BuildContext context,required  int dealerId})async{
    try{

      var res=await PostRequestService().httpPostRequest(url: dashboardUrl+"DealerId=$dealerId", body: {}, context: context);
      if(res!=null){
        HomeDashboardModel dashboardModel=HomeDashboardModel.fromJson(res);
        Provider.of<HomeDashboardProvider>(context,listen: false).updateDashboard(
          newDashboard: dashboardModel
        );
        return true;
      }
      else{
        return null;
      }

    }
        catch(err){
      print("Exception in dashboard service $err");
      return null;
        }
  }
}