class CashBookModel {
  CashBook? result;
  String? message;

  CashBookModel({this.result, this.message});

  CashBookModel.fromJson(Map<String, dynamic> json) {
    result =
    json['result'] != null ? new CashBook.fromJson(json['result']) : null;
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

class CashBook {
  int? voucherId;
  double? totalReceived;
  double? totalAmount;
  int? dealerId;
  Null? dealer;
  int? tenantId;
  List<VoucherLines>? voucherLines;
  int? totalCount;

  CashBook(
      {this.voucherId,
        this.totalReceived,
        this.totalAmount,
        this.dealerId,
        this.dealer,
        this.tenantId,
        this.voucherLines,
        this.totalCount});

  CashBook.fromJson(Map<String, dynamic> json) {
    voucherId = json['voucherId'];
    totalReceived = json['totalReceived'];
    totalAmount = json['totalAmount'];
    dealerId = json['dealerId'];
    dealer = json['dealer'];
    tenantId = json['tenantId'];
    if (json['voucherLines'] != null) {
      voucherLines = <VoucherLines>[];
      json['voucherLines'].forEach((v) {
        voucherLines!.add(new VoucherLines.fromJson(v));
      });
    }
    totalCount = json['totalCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['voucherId'] = this.voucherId;
    data['totalReceived'] = this.totalReceived;
    data['totalAmount'] = this.totalAmount;
    data['dealerId'] = this.dealerId;
    data['dealer'] = this.dealer;
    data['tenantId'] = this.tenantId;
    if (this.voucherLines != null) {
      data['voucherLines'] = this.voucherLines!.map((v) => v.toJson()).toList();
    }
    data['totalCount'] = this.totalCount;
    return data;
  }
}

class VoucherLines {
  int? voucherLineId;
  double? total;
  int? type;
  String? receivedDate;
  int? receivedType;
  String? amountReceivedDetail;
  int? receivedById;
  int? voucherId;
  int? tenantId;

  VoucherLines(
      {this.voucherLineId,
        this.total,
        this.type,
        this.receivedDate,
        this.receivedType,
        this.amountReceivedDetail,
        this.receivedById,
        this.voucherId,
        this.tenantId});

  VoucherLines.fromJson(Map<String, dynamic> json) {
    voucherLineId = json['voucherLineId'];
    total = json['total'];
    type = json['type'];
    receivedDate = json['receivedDate'];
    receivedType = json['receivedType'];
    amountReceivedDetail = json['amountReceivedDetail'];
    receivedById = json['receivedById'];
    voucherId = json['voucherId'];
    tenantId = json['tenantId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['voucherLineId'] = this.voucherLineId;
    data['total'] = this.total;
    data['type'] = this.type;
    data['receivedDate'] = this.receivedDate;
    data['receivedType'] = this.receivedType;
    data['amountReceivedDetail'] = this.amountReceivedDetail;
    data['receivedById'] = this.receivedById;
    data['voucherId'] = this.voucherId;
    data['tenantId'] = this.tenantId;
    return data;
  }
}
