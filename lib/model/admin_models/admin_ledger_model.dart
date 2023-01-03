class AdminLedgerModel {
  List<AdminLedgerList>? result;
  String? message;

  AdminLedgerModel({this.result, this.message});

  AdminLedgerModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <AdminLedgerList>[];
      json['result'].forEach((v) {
        result!.add(new AdminLedgerList.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class AdminLedgerList {
  int? voucherId;
  double? totalReceived;
  double? totalAmount;
  int? dealerId;
  Dealer? dealer;
  int? tenantId;
  List<Null>? voucherLines;
  int? totalCount;
  int? pendingVoucherLines;

  AdminLedgerList(
      {this.voucherId,
        this.totalReceived,
        this.totalAmount,
        this.dealerId,
        this.dealer,
        this.tenantId,
        this.voucherLines,
        this.totalCount,
        this.pendingVoucherLines});

  AdminLedgerList.fromJson(Map<String, dynamic> json) {
    voucherId = json['voucherId'];
    totalReceived = json['totalReceived'];
    totalAmount = json['totalAmount'];
    dealerId = json['dealerId'];
    dealer =
    json['dealer'] != null ? new Dealer.fromJson(json['dealer']) : null;
    tenantId = json['tenantId'];
    // if (json['voucherLines'] != null) {
    //   voucherLines = <Null>[];
    //   json['voucherLines'].forEach((v) {
    //     voucherLines!.add(new Null.fromJson(v));
    //   });
    // }
    totalCount = json['totalCount'];
    pendingVoucherLines = json['pendingVoucherLines'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['voucherId'] = this.voucherId;
    data['totalReceived'] = this.totalReceived;
    data['totalAmount'] = this.totalAmount;
    data['dealerId'] = this.dealerId;
    if (this.dealer != null) {
      data['dealer'] = this.dealer!.toJson();
    }
    data['tenantId'] = this.tenantId;
    // if (this.voucherLines != null) {
    //   data['voucherLines'] = this.voucherLines!.map((v) => v.toJson()).toList();
    // }
    data['totalCount'] = this.totalCount;
    data['pendingVoucherLines'] = this.pendingVoucherLines;
    return data;
  }
}

class Dealer {
  int? id;
  Null? username;
  Null? email;
  Null? password;
  Null? role;
  String? phoneNumber;
  Null? about;
  Null? imageUrl;
  String? name;
  Null? tenantId;
  Null? paymentLimit;
  Null? aqmId;
  Null? rmsId;
  Null? asmId;
  Null? meId;
  bool? isAsignAllWarehouse;
  List<Warehouse>? warehouses;

  Dealer(
      {this.id,
        this.username,
        this.email,
        this.password,
        this.role,
        this.phoneNumber,
        this.about,
        this.imageUrl,
        this.name,
        this.tenantId,
        this.paymentLimit,
        this.aqmId,
        this.rmsId,
        this.asmId,
        this.meId,
        this.isAsignAllWarehouse,
        this.warehouses});

  Dealer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    role = json['role'];
    phoneNumber = json['phoneNumber'];
    about = json['about'];
    imageUrl = json['imageUrl'];
    name = json['name'];
    tenantId = json['tenantId'];
    paymentLimit = json['paymentLimit'];
    aqmId = json['aqmId'];
    rmsId = json['rmsId'];
    asmId = json['asmId'];
    meId = json['meId'];
    isAsignAllWarehouse = json['isAsignAllWarehouse'];
    if (json['warehouses'] != null) {
      warehouses = <Warehouse>[];
      json['warehouses'].forEach((v) {
        warehouses!.add(new Warehouse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['role'] = this.role;
    data['phoneNumber'] = this.phoneNumber;
    data['about'] = this.about;
    data['imageUrl'] = this.imageUrl;
    data['name'] = this.name;
    data['tenantId'] = this.tenantId;
    data['paymentLimit'] = this.paymentLimit;
    data['aqmId'] = this.aqmId;
    data['rmsId'] = this.rmsId;
    data['asmId'] = this.asmId;
    data['meId'] = this.meId;
    data['isAsignAllWarehouse'] = this.isAsignAllWarehouse;
    if (this.warehouses != null) {
      data['warehouses'] = this.warehouses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class Warehouse {
  int? warehouseId;
  String? name;
  String? address;
  int? cityId;
  int? tenantId;
  Null? updatedBy;
  Null? createdBy;

  Warehouse({this.warehouseId, this.name, this.address, this.cityId, this.tenantId, this.updatedBy, this.createdBy});

  Warehouse.fromJson(Map<String, dynamic> json) {
    warehouseId = json['warehouseId'];
    name = json['name'];
    address = json['address'];
    cityId = json['cityId'];
    tenantId = json['tenantId'];
    updatedBy = json['updatedBy'];
    createdBy = json['createdBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['warehouseId'] = this.warehouseId;
    data['name'] = this.name;
    data['address'] = this.address;
    data['cityId'] = this.cityId;
    data['tenantId'] = this.tenantId;
    data['updatedBy'] = this.updatedBy;
    data['createdBy'] = this.createdBy;
    return data;
  }
}
