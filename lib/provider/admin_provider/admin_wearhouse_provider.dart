

 import 'package:flutter/cupertino.dart';

import '../../model/admin_models/admin_wearhouse_model.dart';

class AdminWearHouseProvider extends ChangeNotifier{
  List<AdminWearhouseModel>? adminWearHouse=[];
  updateWearHouse({ List<AdminWearhouseModel>? newWearHouse}){
    adminWearHouse=newWearHouse;
    notifyListeners();
  }
}