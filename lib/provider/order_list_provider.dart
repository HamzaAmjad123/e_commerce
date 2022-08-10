
import 'package:flutter/cupertino.dart';

import '../model/order_list_model.dart';

class OrderListProvider extends ChangeNotifier{
  List<OrderList>? orderList=[];
  updateOrderList({List<OrderList>? newOrder}){
    orderList=newOrder;
    notifyListeners();
  }
}