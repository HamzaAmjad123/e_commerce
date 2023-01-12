
import 'package:e_commerce/model/admin_models/admin_get_items_list_model.dart';
import 'package:flutter/cupertino.dart';



class AdminItemsListProvider extends ChangeNotifier{
  List<AdminItemsList>? itemsList=[];
  updateItemsList({List<AdminItemsList>? newitems}){
    itemsList=newitems;
    notifyListeners();
  }
}