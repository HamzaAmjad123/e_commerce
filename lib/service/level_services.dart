

import 'dart:convert';

import 'package:e_commerce/configs/api_urls.dart';
import 'package:e_commerce/helper_services/custom_post_request_service.dart';
import 'package:e_commerce/model/level_model.dart';
import 'package:e_commerce/provider/level_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'package:http/http.dart'as http;

import 'local_storage_service.dart';
class LevelService{
  Future getLevel({required BuildContext context})async{
    try{
      String token=await LocalStorageServices().getToken();
      var headers={
        "Content-Type":"application/json; charset=utf-8",
        "authorization": "Bearer $token"
      };
      http.Response response=await http.post(Uri.parse(getLevelUrl),headers: headers);
      print("response status code ${response.statusCode}");
      print("get request body ${response.body}");
      LevelModel levelModel=LevelModel.fromJson(json.decode(response.body));
      // List<Level> levelModel = (json.decode(response.body)).map<Level>((m )=> Level.fromJson(m)).toList();
      if(response.statusCode==200){
        Provider.of<LevelProvider>(context,listen: false).updateClassLevel(
            newLevel: levelModel.result);
        return true;
      }
      else{
        return false;
      }

    }
        catch(err){
      print("exception in level service $err");
      return false;
        }
  }
}
// Map _body={};
// var res=await PostRequestService().httpPostRequest(url: getLevelUrl, body: _body, context: context);
// if(res !=null){
// LevelModel levelModel=LevelModel.fromJson(res);
// Provider.of<LevelProvider>(context,listen: false).updateClassLevel(
// newLevel: levelModel.result
// );
// return true;
// }
// else{
// return false;
// }