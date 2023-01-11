import 'package:flutter/cupertino.dart';
import '../../model/admin_models/admin_class_model.dart';

class AdminClassProvider extends ChangeNotifier{
  List<ClassList>? classList=[];
  updateClasses({List<ClassList>? newList}){
    classList=newList;
   notifyListeners();
  }
}