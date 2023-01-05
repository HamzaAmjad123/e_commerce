import 'package:flutter/cupertino.dart';
import '../../model/admin_models/admin_series_model.dart';

class AdminSeriesProvider extends ChangeNotifier{
  List<AdminSeriesList>? seriesList=[];
  updateSeriesList({List<AdminSeriesList>? list}){
    seriesList=list;
    notifyListeners();
  }
}