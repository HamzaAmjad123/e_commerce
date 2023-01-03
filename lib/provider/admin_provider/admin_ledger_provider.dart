
import 'package:flutter/foundation.dart';

import '../../model/admin_models/admin_ledger_model.dart';

class AdminLedgerProvider extends ChangeNotifier{
  List<AdminLedgerList>? ledger=[];
  updateLedger({List<AdminLedgerList>? newLedger}){
    ledger=newLedger;
    notifyListeners();
  }
}