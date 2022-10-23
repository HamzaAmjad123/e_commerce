
import 'package:flutter/cupertino.dart';

import '../model/class_model.dart';

class ClassesProvider  extends ChangeNotifier{
  List<Classes>? myClass=[];
  updateClass({List<Classes>? newClass}){
    myClass=newClass;
    notifyListeners();
  }
}