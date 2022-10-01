import 'package:e_commerce/model/rider_models/rider_order_model.dart';
import 'package:flutter/cupertino.dart';

class RiderHistoryProvider extends ChangeNotifier {
  List<RiderOrdersModel>? historyList;

  updateRiderHistory({List<RiderOrdersModel>? newList}) {
    historyList = newList;
    notifyListeners();
  }
}
