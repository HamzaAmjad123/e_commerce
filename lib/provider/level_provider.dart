import 'package:flutter/material.dart';

import '../model/level_model.dart';

class LevelProvider extends ChangeNotifier {
  List<Level>?myLevel=[];

  updateClassLevel({List<Level>? newLevel}) {
    myLevel = newLevel;
    notifyListeners();
  }
}
