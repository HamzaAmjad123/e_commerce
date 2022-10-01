

import 'package:flutter/cupertino.dart';

import '../model/home_dashboard_model.dart';

class HomeDashboardProvider extends ChangeNotifier{
  HomeDashboardModel? dashboard;
  updateDashboard({HomeDashboardModel? newDashboard}){
    dashboard=newDashboard;
    notifyListeners();
  }
}