


import 'dart:convert';
import 'dart:developer';

import 'package:e_commerce/helper_services/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetRequestService{
  Future httpGetRequest({required String url,required BuildContext context})async{
    print("get request url $url");
    try{
      var headers={
        "Content-Type":"application/json"
      };
      http.Response response=await http.get(Uri.parse(url),headers: headers);
      print("get request status code ${response.statusCode}");
      log("get request body ${response.body}");
      var jsonDecoded=json.decode(response.body);
      if(response.statusCode !=200){
        CustomSnackBar.failedSnackBar(context: context, message: jsonDecoded['title']);
        return null;
      }
      else
        {
          return jsonDecoded;
        }
    }
        catch(err){
      print("Exception in Custom Get Request Service $err");
      CustomSnackBar.failedSnackBar(context: context, message: "Exception=========> $err");
      return null;
        }
  }
}