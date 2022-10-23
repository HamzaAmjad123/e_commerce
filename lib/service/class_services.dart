
import 'package:e_commerce/configs/api_urls.dart';
import 'package:e_commerce/helper_services/custom_post_request_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../model/class_model.dart';
import '../provider/class_provider.dart';

class GetClassesService{
  Future getClasses({required BuildContext context})async{
    try{
      var res=await PostRequestService().httpPostRequest(url: getClassesUrl, body: {}, context: context);
      if(res!=null){
        ClassesModel classModel=ClassesModel.fromJson(res);
        Provider.of<ClassesProvider>(context,listen: false).updateClass(
          newClass: classModel.result
        );
        return true;
      }
      else{
        return null;
      }
    }
        catch(err){
      print("Exception in Get Classes Service $err");
      return null;
        }
  }
}