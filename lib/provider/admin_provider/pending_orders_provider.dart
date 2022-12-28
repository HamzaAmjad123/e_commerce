import 'package:flutter/cupertino.dart';

import '../../model/admin_models/pending_orders_model.dart';

class AdminPendingOrdersProvider extends ChangeNotifier {
  List<PendingOrdersList>? pendingOrders = [];

  updatePendingOrders({List<PendingOrdersList>? newOrders}) {
    pendingOrders = newOrders;
    notifyListeners();
  }
}
