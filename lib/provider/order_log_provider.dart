

import 'package:e_commerce/model/order_log_model.dart';
import 'package:flutter/cupertino.dart';

class OrderLogProvider extends ChangeNotifier{
  List<OrderLogModel>? orderLog;
  updateorderlog({List<OrderLogModel>? neworderlog}){
    orderLog=neworderlog;
    notifyListeners();
  }
}