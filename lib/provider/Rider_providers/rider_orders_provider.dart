import 'package:flutter/widgets.dart';

import '../../model/rider_models/rider_order_model.dart';

class RiderApprovesOrdersProvider extends ChangeNotifier {
  List<RiderOrdersModel>? riderApprovedorders;

  updateRiderApprovedOrders({List<RiderOrdersModel>? newList}) {
    riderApprovedorders = newList;
    notifyListeners();
  }
}
