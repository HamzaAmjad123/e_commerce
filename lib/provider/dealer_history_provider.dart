import 'package:flutter/cupertino.dart';
import '../model/dealer_orders_model.dart';

class DealerHistoryProvider extends ChangeNotifier{
  List<Result>? results;
  updateApprovedOrders({List<Result>? newlist}){
    results=newlist;
    notifyListeners();
  }
}