import 'dart:convert';
import 'package:http/http.dart' as http;
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
  List<String> role = [];

  Future getLogin(
      {required String userName,
      required String password,
      required BuildContext context}) async {
    Map _body = {"username": userName, "password": password};
    try {
      var res = await PostRequestService()
          .httpPostRequest(url: loginUrl, body: _body, context: context);
      if (res != null) {
        UserResponseModel user = UserResponseModel.fromJson(res);
        Provider.of<UserDataProvider>(context, listen: false)
            .updateUserData(newUser: user);
        await LocalStorageServices().saveToken("${user.token}");
        await LocalStorageServices().saveUser(jsonEncode(user.toJson()));
        if (deviceToken.isNotEmpty) {
          sendToken(
              tenatId: user.user!.tenantId!,
              userId: user.user!.id!,
              token: deviceToken);
        }
        final box = GetStorage();
        box.write('user', user.user!.toJson());
        role = user.userRoles!;
        return role;
      } else {
        return role;
      }
    } catch (err) {
      print("exception in loginApiService $err");
      return role;
    }
  }

  Future sendToken(
      {required String token,
      required int userId,
      required int tenatId,
     }) async {
    String url="https://pos.impliessolutions.com/api/notification/SaveDeviceToken";
    Map _body = {"UserId": userId, "TenatId": tenatId, "DeviceToken": token};
    String userToken = await LocalStorageServices().getToken()??"";
    var headers = {
      "Content-Type": "application/json; charset=utf-8",
      "authorization": "Bearer $userToken"
    };

    print("Url===>$url");
    print("bodyyy===>$_body");
    try {
      http.Response response = await http.post(Uri.parse(url),
          body: json.encode(_body), headers: headers);
      if (response.statusCode==200) {
        print("==token Upload successfuly==");
        print("$response");
        return true;
      }
    } catch (err) {
      print("exception in saveToken Api $err");
      return false;
    }
  }
}
