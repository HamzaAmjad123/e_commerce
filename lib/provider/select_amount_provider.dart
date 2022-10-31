

import 'package:flutter/material.dart';

import '../model/select_amount_model.dart';

class SelectAmountProvider extends ChangeNotifier{
  List<SelectAmount> ?selectAmount=[];
  updateAmount({List<SelectAmount> ? newAmount}){
    selectAmount=newAmount;
    notifyListeners();
  }
}