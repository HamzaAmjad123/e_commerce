import 'package:flutter/cupertino.dart';
import '../model/wearhouse_model.dart';

class WearHouseProvider extends ChangeNotifier{
  List<WearHouseModel>? wearHouseList;
  updateWearHouse({ List<WearHouseModel>? list}){
    print("calling");
    wearHouseList=list;
    print("list in provider");
    print(list);
    notifyListeners();
  }
}