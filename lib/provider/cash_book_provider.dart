

import 'package:e_commerce/model/cash_book.dart';
import 'package:flutter/cupertino.dart';

class CashBookProvider extends ChangeNotifier{
  CashBook? cashBook;
  updateCashBook({CashBook? newCashBook}){
    cashBook=newCashBook;
    notifyListeners();
  }
}