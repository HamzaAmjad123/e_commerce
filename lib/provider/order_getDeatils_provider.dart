import 'package:e_commerce/model/order_deatils_model.dart';
import 'package:flutter/cupertino.dart';

class OrderDetailsProvider extends ChangeNotifier{
  OrderDetailsModel? orderDetails;
  updateOrderDetails({OrderDetailsModel? newOrderDetails}){
    orderDetails=newOrderDetails;
    notifyListeners();
  }
}