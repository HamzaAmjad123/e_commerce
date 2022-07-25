

import 'package:flutter/cupertino.dart';

import '../model/series_model.dart';

class SeriesProvider extends ChangeNotifier{
  List<Series>? series=[];
  updateSeries({List<Series>? newSeries}){
    series=newSeries!;
    print("Length of series ${series!.length}");
  }

}