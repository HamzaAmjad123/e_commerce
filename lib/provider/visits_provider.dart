

import 'package:e_commerce/model/vsits_model.dart';
import 'package:flutter/material.dart';

class VisitsProvider extends ChangeNotifier{
  Visits? myVisits;
  updateVisits({Visits? newVisits}){
    myVisits=newVisits;
    notifyListeners();
  }
}