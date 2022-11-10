import 'dart:convert';

import 'package:e_commerce/configs/api_urls.dart';
import 'package:e_commerce/helper_services/custom_post_request_service.dart';
import 'package:e_commerce/helper_services/custom_snackbar.dart';
import 'package:e_commerce/model/user_model.dart';
import 'package:e_commerce/provider/user_data_provider.dart';
import 'package:e_commerce/service/local_storage_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

class LoginApiService {
  Future getLogin(
      {required String userName,
      required String password,
      required BuildContext context}) async {
    Map _body = {"username": userName, "password": password};
    print("boddyyy");
    print(_body);
    try {
      print("inside try");
      var res = await PostRequestService()
          .httpPostRequest(url: loginUrl, body: _body, context: context);
      if (res != null) {
        print("Inside");
        UserResponseModel user = UserResponseModel.fromJson(res);
        Provider.of<UserDataProvider>(context, listen: false)
            .updateUserData(newUser: user);

        LocalStorageServices().saveToken("${user.token}");
        LocalStorageServices().saveUser(true);
        final box = GetStorage();
        box.write('user', user.user!.toJson());

        return true;
      } else {
        print("this is response");
        print(res);
        return false;
      }
    } catch (err) {
      print("exception in loginApiService $err");
      return false;
    }
  }
}

