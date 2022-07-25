import 'dart:convert';

import 'package:e_commerce/configs/api_urls.dart';
import 'package:e_commerce/helper_services/custom_post_request_service.dart';
import 'package:e_commerce/helper_services/custom_snackbar.dart';
import 'package:e_commerce/model/user_model.dart';
import 'package:e_commerce/provider/user_data_provider.dart';
import 'package:e_commerce/service/local_storage_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;
import 'package:provider/provider.dart';

class LoginApiService {
  Future getLogin(
      {required String userName,
      required String password,
      required BuildContext context}) async {
    Map _body={"username":userName,"password":password};
    try{
      var res= await PostRequestService().httpPostRequest(url: loginUrl, body: _body, context: context);
      if(res !=null){
        UserResponseModel user=UserResponseModel.fromJson(res);
        if(res !=null){
          Provider.of<UserDataProvider>(context,listen: false).updateUserData(
              newUser: user.user
          );
          print("Expiration ${user.token!}");
          LocalStorageServices().saveToken("${user.token}");
          // print(LocalStorageServices().getToken());
          // LocalStorageServices().saveToken("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWRtaW4iLCJqdGkiOiJlMjI2ZjBjZC1kZTI5LTRlOWYtOGY1NS0yMzRhMjE0OTMxNzUiLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJBZG1pbiIsImV4cCI6MTY2MTA4OTYwOCwiaXNzIjoiaHR0cHM6Ly9hcGkuaW1wbGllc3NvbHV0aW9ucy5jb20vIiwiYXVkIjoiaHR0cHM6Ly9pbXBsaWVzc29sdXRpb25zLmNvbS8ifQ.4IiQy1lvheg4OjB5fgKsX8kUfA5ALDQLDklNiSQepOQ");
          return true;
        }
        else{
          return false;
        }
      }
    }
        catch(err){
      print("exception in loginApiService $err");
      return false;
        }
  }
 }
//
// class LoginApiService {
//   Future getLogin(
//       {required String userName,
//         required String password,
//         required BuildContext context}) async {
//     Map _body={"username":userName,"password":password};
//     try{
//      http.Response response=await http.post(Uri.parse(loginUrl),body: _body);
//      print("post status code ${response.statusCode}");
//      print("post request body ${response.body}");
//      UserResponseModel user=UserResponseModel.fromJson(json.decode(response.body));
//      if(response.statusCode==200){
//        Provider.of<UserDataProvider>(context,listen: false).updateUserData(
//          newUser: user.user
//        );
//        return true;
//      }
//      else{
//        CustomSnackBar.failedSnackBar(context: context, message: "Login is not successful");
//        return false;
//      }
//     }
//     catch(err){
//       print("exception in loginApiService $err");
//       return false;
//     }
//   }
// }