
import 'package:flutter/cupertino.dart';

import '../model/wearhouse_shippment_model.dart';

class WearHouseShipmentProvider extends ChangeNotifier{
  List<WearHouseShipment>? shipment=[];
  updateShipment({ List<WearHouseShipment>? newShipment}){
    shipment=newShipment;
    notifyListeners();
  }
}