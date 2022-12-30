import 'package:flutter/cupertino.dart';
import '../../model/admin_models/approved_order_model.dart';

class AdminApprovedOrdersProvider extends ChangeNotifier {
  List<ApprovedOrders>? approvedOrders = [];

  updateApprovedOrders({List<ApprovedOrders>? newOrders}) {
    approvedOrders = newOrders;
    notifyListeners();
  }
}
