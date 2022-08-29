import 'package:flutter/widgets.dart';

import '../../model/rider_models/rider_order_model.dart';

class RiderApprovesOrdersProvider extends ChangeNotifier {
  List<RiderOdersModel>? riderApprovedorders;

  updateRiderApprovedOrders({List<RiderOdersModel>? newList}) {
    riderApprovedorders = newList;
    notifyListeners();
  }
}
