

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../model/admin_models/admin_ranks_model.dart';

class AdminRanksListProvider extends ChangeNotifier{
  List<AdminRanksListModel>? ranksList=[];
  updateRanks({List<AdminRanksListModel>? newList}){
    ranksList=newList;
    notifyListeners();
  }

}