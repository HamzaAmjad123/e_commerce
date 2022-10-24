
import 'package:flutter/cupertino.dart';

import '../model/approved_order_model.dart';

class ApprovedOrderProvider extends ChangeNotifier{
  List<ApprovedOrder>? approvedOrder=[];
  updateApprovedOrder({ List<ApprovedOrder>? newOrder}){
    approvedOrder=newOrder;
    notifyListeners();
  }
}