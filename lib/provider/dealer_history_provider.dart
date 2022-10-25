import 'package:flutter/cupertino.dart';
import '../model/dealer_orders_model.dart';

class DealerHistoryProvider extends ChangeNotifier{
  List<OrderHistory>? history;
  updateApprovedOrders({List<OrderHistory>? newlist}){
    history=newlist;
    notifyListeners();
  }
}