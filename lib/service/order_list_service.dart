

import 'package:e_commerce/configs/api_urls.dart';
import 'package:e_commerce/helper_services/custom_post_request_service.dart';
import 'package:e_commerce/model/order_list_model.dart';
import 'package:e_commerce/provider/order_list_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class OrderListService{
  Future getOrderList({required int skip,required int take,required int tenatId,required BuildContext context,required String searchText,required String fromDate,required String  toDate})async{
   try{
     Map _body={"skip":skip,"take":take,"tenantId":tenatId,"searchText":searchText,"fromDate":fromDate,"toDate":toDate};

     var res=await PostRequestService().httpPostRequest(url:orderListUrl , body: _body, context: context);
     if(res !=null){
       OrderListModel orderListModel=OrderListModel.fromJson(res);
       Provider.of<OrderListProvider>(context,listen: false).updateOrderList(
           newOrder: orderListModel.result
       );
       return true;
     }
     else{
       return false;
     }
   }
       catch(err){
     print("Exception in Order List Service $err");
     return  false;
       }
  }
}