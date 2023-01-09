import 'package:e_commerce/helper_services/custom_post_request_service.dart';
import 'package:e_commerce/helper_services/custom_snackbar.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../../configs/api_urls.dart';
import '../../model/admin_models/admin_class_model.dart';
import '../../provider/admin_provider/adimn_class_provider.dart';

class AdminClasssService{
   Future getAllClasses({required BuildContext context})async{
     try{
        Map body={};
       var res=await PostRequestService().httpPostRequest(url: adminClassUrl, body: body, context: context);
       print(res);
       if(res!=null){
         AdminClassModel classModel=AdminClassModel.fromJson(res);
         Provider.of<AdminClassProvider>(context,listen: false).updateClasses(
             newList: classModel.result
         );
         return true;
       }else{
         return null;
       }
   }catch(e){
     CustomSnackBar.failedSnackBar(context: context, message: "Exception in GetClass $e");
     return null;
     }
   }
}