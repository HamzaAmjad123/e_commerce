
import 'package:flutter/cupertino.dart';

import '../../model/admin_models/stock_model.dart';

class StockListProvider extends ChangeNotifier{
  List<StockList>? stockList=[];
  updateStock({List<StockList>? newStock}){
    stockList=newStock;
    notifyListeners();
  }
}