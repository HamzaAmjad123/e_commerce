import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageServices{

  Future saveToken(String token)async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    prefs.setString('token', token);
    return true;
  }
  Future getToken() async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    String? token = await prefs.getString('token');
    return token;
  }


  Future saveUser(bool isLogin)async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    pref.setBool('isLogin', isLogin);
    return  true;
  }
  Future getUser()async{
    SharedPreferences pref=await SharedPreferences.getInstance();
    return pref.getBool('isLogin');

}

}