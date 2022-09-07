import 'package:e_commerce/model/rider_models/rider_order_model.dart';
import 'package:flutter/cupertino.dart';

class RiderHistoryProvider extends ChangeNotifier {
  List<RiderOdersModel>? historyList;

  updateRiderHistory({List<RiderOdersModel>? newList}) {
    historyList = newList;
    notifyListeners();
  }
}
