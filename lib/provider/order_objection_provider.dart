
import 'package:flutter/material.dart';

import '../model/order_objection_model.dart';

class OrderObjectionProvider extends ChangeNotifier{
  OrderObjectionModel? orderObjection;
  updateObjection({OrderObjectionModel? newObjection}){
    orderObjection=newObjection;
    notifyListeners();
  }
}