

import 'package:e_commerce/model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';


class UserDataProvider extends ChangeNotifier{
  UserResponseModel? user;
  final box = GetStorage();

  updateUserData({UserResponseModel? newUser})async{
    user=newUser;
    notifyListeners();
  }
}