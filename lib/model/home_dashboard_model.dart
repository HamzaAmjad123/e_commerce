class HomeDashboardModel {
  double? totalAmount;
  double? totalReceived;
  int? totalPaid;
  int? totalRemaining;
  int? totalApprovedOrders;
  int? totalPendingOrders;
  int? totalRejectedOrders;
  int? totalReturnedApproved;
  int? totalReturnedPending;
  int? totalReturnRejected;

  HomeDashboardModel(
      {this.totalAmount,
        this.totalReceived,
        this.totalPaid,
        this.totalRemaining,
        this.totalApprovedOrders,
        this.totalPendingOrders,
        this.totalRejectedOrders,
        this.totalReturnedApproved,
        this.totalReturnedPending,
        this.totalReturnRejected});

  HomeDashboardModel.fromJson(Map<String, dynamic> json) {
    totalAmount = json['totalAmount'];
    totalReceived = json['totalReceived'];
    totalPaid = json['totalPaid'];
    totalRemaining = json['totalRemaining'];
    totalApprovedOrders = json['totalApprovedOrders'];
    totalPendingOrders = json['totalPendingOrders'];
    totalRejectedOrders = json['totalRejectedOrders'];
    totalReturnedApproved = json['totalReturnedApproved'];
    totalReturnedPending = json['totalReturnedPending'];
    totalReturnRejected = json['totalReturnRejected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalAmount'] = this.totalAmount;
    data['totalReceived'] = this.totalReceived;
    data['totalPaid'] = this.totalPaid;
    data['totalRemaining'] = this.totalRemaining;
    data['totalApprovedOrders'] = this.totalApprovedOrders;
    data['totalPendingOrders'] = this.totalPendingOrders;
    data['totalRejectedOrders'] = this.totalRejectedOrders;
    data['totalReturnedApproved'] = this.totalReturnedApproved;
    data['totalReturnedPending'] = this.totalReturnedPending;
    data['totalReturnRejected'] = this.totalReturnRejected;
    return data;
  }
}
