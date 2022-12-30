
import 'package:flutter/foundation.dart';

import '../../model/admin_models/admin_ledger_model.dart';

class AdminLedgerProvider extends ChangeNotifier{
  List<LedgerList>? ledger=[];
  updateLedger({List<LedgerList>? newLedger}){
    ledger=newLedger;
    notifyListeners();
  }
}