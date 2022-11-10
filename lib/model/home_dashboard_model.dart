class HomeDashboardModel {
  List<BarChartData>? barChartData;
  DashboardModel? revenueData;

  HomeDashboardModel({this.barChartData, this.revenueData});

  HomeDashboardModel.fromJson(Map<String, dynamic> json) {
    if (json['barChartData'] != null) {
      barChartData = <BarChartData>[];
      json['barChartData'].forEach((v) {
        barChartData!.add(new BarChartData.fromJson(v));
      });
    }
    revenueData = json['revenueData'] != null
        ? new DashboardModel.fromJson(json['revenueData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.barChartData != null) {
      data['barChartData'] = this.barChartData!.map((v) => v.toJson()).toList();
    }
    if (this.revenueData != null) {
      data['revenueData'] = this.revenueData!.toJson();
    }
    return data;
  }
}

class BarChartData {
  String? name;
  List<Series>? series;

  BarChartData({this.name, this.series});

  BarChartData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['series'] != null) {
      series = <Series>[];
      json['series'].forEach((v) {
        series!.add(new Series.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.series != null) {
      data['series'] = this.series!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Series {
  String? name;
  String? value;

  Series({this.name, this.value});

  Series.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['value'] = this.value;
    return data;
  }
}

class DashboardModel {
  double? totalAmount;
  double? totalPaid;
  double? totalRemaining;
  int? totalApprovedOrders;
  int? totalPendingOrders;
  int? totalRejectedOrders;

  DashboardModel(
      {this.totalAmount,
        this.totalPaid,
        this.totalRemaining,
        this.totalApprovedOrders,
        this.totalPendingOrders,
        this.totalRejectedOrders});

  DashboardModel.fromJson(Map<String, dynamic> json) {
    totalAmount = json['totalAmount'];
    totalPaid = json['totalPaid'];
    totalRemaining = json['totalRemaining'];
    totalApprovedOrders = json['totalApprovedOrders'];
    totalPendingOrders = json['totalPendingOrders'];
    totalRejectedOrders = json['totalRejectedOrders'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalAmount'] = this.totalAmount;
    data['totalPaid'] = this.totalPaid;
    data['totalRemaining'] = this.totalRemaining;
    data['totalApprovedOrders'] = this.totalApprovedOrders;
    data['totalPendingOrders'] = this.totalPendingOrders;
    data['totalRejectedOrders'] = this.totalRejectedOrders;
    return data;
  }
}

