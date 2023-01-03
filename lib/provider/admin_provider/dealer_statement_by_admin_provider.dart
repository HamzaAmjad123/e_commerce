

import 'package:flutter/material.dart';

import '../../model/admin_models/dealer_statement_by_admin_model.dart';

class DealerStatementByAdminProvider extends ChangeNotifier{
  DealerStatementList? dealerStat;

  updateDealerState({DealerStatementList? newDealerStat}){

    dealerStat=newDealerStat;
    print("New State $newDealerStat");
    notifyListeners();
  }
}