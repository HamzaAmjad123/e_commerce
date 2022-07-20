

import 'package:e_commerce/model/user_model.dart';
import 'package:flutter/cupertino.dart';

class UserDataProvider extends ChangeNotifier{
  UserModel? user;
  updateUserData({UserModel? newUser}){
    user=newUser;
    notifyListeners();
  }
}