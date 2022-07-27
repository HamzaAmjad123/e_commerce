

import 'package:flutter/cupertino.dart';

import '../model/categories_model.dart';

class CategoriesProvider extends ChangeNotifier{
  List<Category>? myCat=[];
  updateCat({List<Category>? newCat}){
    myCat=newCat;
    notifyListeners();
  }
}