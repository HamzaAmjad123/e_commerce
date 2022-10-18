
import 'package:flutter/material.dart';

import '../model/items_model.dart';

class ItemsProvider extends ChangeNotifier{
  List<Items>? itemsList=[];
  updateItems({List<Items>? newItemsList}){
    itemsList=newItemsList!;
    notifyListeners();
  }
}