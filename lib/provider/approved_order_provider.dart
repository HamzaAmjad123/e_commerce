
import 'package:flutter/cupertino.dart';
import '../model/order_list_model.dart';

class ApprovedOrderProvider extends ChangeNotifier{
  List<OrderList>? approvedOrder=[];
  updateApprovedOrder({ List<OrderList>? newOrder}){
    approvedOrder=newOrder;
    notifyListeners();
  }
}