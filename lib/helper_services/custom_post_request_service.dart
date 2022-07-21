

import 'dart:convert';
import 'dart:developer';

import 'package:e_commerce/helper_services/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class PostRequestService{
  Future httpPostRequest({required String url,required Map body,required BuildContext context})async{
    print("post request url $url");
    try{
      var headers={
        "Content-Type":"application/json; charset=utf-8"
      };
      http.Response response=await http.post(Uri.parse(url),body: json.encode(body),headers: headers);
      print("post response status code ${response.statusCode}");
      log("get post body ${response.body}");
      var jsonDecoded=json.decode(response.body);
      if(jsonDecoded ==null || jsonDecoded['status'] ==401){
        CustomSnackBar.failedSnackBar(context: context, message: jsonDecoded['title']);
        return null;
      }
      else{
        return jsonDecoded;
      }
    }
    catch(err){
      print("exception in post request service $err");
      CustomSnackBar.failedSnackBar(context: context, message: "Exception==========> $err");
      return null;
    }
  }
}