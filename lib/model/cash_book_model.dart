class CashBookModel {
  AdminItemsList? result;
  String? message;

  CashBookModel({this.result, this.message});

  CashBookModel.fromJson(Map<String, dynamic> json) {
    result =
    json['result'] != null ? new AdminItemsList.fromJson(json['result']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class AdminItemsList {
  List<LedgerDetails>? ledgerDetails;
  int? dealerId;
  int? voucherId;
  int? tenantId;
  double? totalAmount;
  double? totalReceived;

  AdminItemsList(
      {this.ledgerDetails,
        this.dealerId,
        this.voucherId,
        this.tenantId,
        this.totalAmount,
        this.totalReceived});

  AdminItemsList.fromJson(Map<String, dynamic> json) {
    if (json['ledgerDetails'] != null) {
      ledgerDetails = <LedgerDetails>[];
      json['ledgerDetails'].forEach((v) {
        ledgerDetails!.add(new LedgerDetails.fromJson(v));
      });
    }
    dealerId = json['dealerId'];
    voucherId = json['voucherId'];
    tenantId = json['tenantId'];
    totalAmount = json['totalAmount'];
    totalReceived = json['totalReceived'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ledgerDetails != null) {
      data['ledgerDetails'] =
          this.ledgerDetails!.map((v) => v.toJson()).toList();
    }
    data['dealerId'] = this.dealerId;
    data['voucherId'] = this.voucherId;
    data['tenantId'] = this.tenantId;
    data['totalAmount'] = this.totalAmount;
    data['totalReceived'] = this.totalReceived;
    return data;
  }
}

class LedgerDetails {
  int? dealerId;
  String? date;
  String? title;
  double? credit;
  double? debit;
  int? status;
  String? description;
  String? type;
  int? orderId;
  String? statusString;
  int? voucherLineId;

  LedgerDetails(
      {this.dealerId,
        this.date,
        this.title,
        this.credit,
        this.debit,
        this.status,
        this.description,
        this.type,
        this.orderId,
        this.statusString,
        this.voucherLineId});

  LedgerDetails.fromJson(Map<String, dynamic> json) {
    dealerId = json['dealerId'];
    date = json['date'];
    title = json['title'];
    credit = json['credit'];
    debit = json['debit'];
    status = json['status'];
    description = json['description'];
    type = json['type'];
    orderId = json['orderId'];
    statusString = json['statusString'];
    voucherLineId = json['voucherLineId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dealerId'] = this.dealerId;
    data['date'] = this.date;
    data['title'] = this.title;
    data['credit'] = this.credit;
    data['debit'] = this.debit;
    data['status'] = this.status;
    data['description'] = this.description;
    data['type'] = this.type;
    data['orderId'] = this.orderId;
    data['statusString'] = this.statusString;
    data['voucherLineId'] = this.voucherLineId;
    return data;
  }
}
