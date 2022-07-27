
import 'package:flutter/material.dart';

import '../model/items_model.dart';

class ItemsProvider extends ChangeNotifier{
  List<ItemsList>? itemsList=[];
  updateItems({List<ItemsList>? newItemsList}){
    itemsList=newItemsList!;
    notifyListeners();
  }
}