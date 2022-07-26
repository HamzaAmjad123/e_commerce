import 'package:flutter/material.dart';

import '../model/series_model.dart';


class SeriesProvider extends ChangeNotifier{
  List<Series>? mySeries=[];
  updateSeries({List<Series>? newSeries}){
    mySeries=newSeries;
    notifyListeners();
  }
}