

import 'package:e_commerce/model/order_log.dart';
import 'package:flutter/cupertino.dart';

class OrderLogProvider extends ChangeNotifier{
  List<OrderLog>? orderLog;
  updateorderlog({List<OrderLog>? neworderlog}){
    orderLog=neworderlog;
    notifyListeners();
  }
}