

import 'package:e_commerce/model/cash_book_model.dart';
import 'package:flutter/cupertino.dart';

class CashBookProvider extends ChangeNotifier{
  CashBookModel? cashBook;
  updateCashBook({CashBookModel? newCashBook}){
    cashBook=newCashBook;
    notifyListeners();
  }
}