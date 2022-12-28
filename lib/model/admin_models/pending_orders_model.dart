class PendingOrdersListModel {
  int? totalCount;
  List<PendingOrdersList>? result;

  PendingOrdersListModel({this.totalCount, this.result});

  PendingOrdersListModel.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    if (json['result'] != null) {
      result = <PendingOrdersList>[];
      json['result'].forEach((v) {
        result!.add(new PendingOrdersList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalCount'] = this.totalCount;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PendingOrdersList {
  int? orderId;
  String? orderNo;
  String? date;
  double? totalAmount;
  int? type;
  int? paymentStatus;
  int? status;
  int? dealerId;
  Dealer? dealer;
  int? warehouseId;
  Null? warehouse;
  int? tenantId;
  Voucher? voucher;
  Null? orderLines;
  bool? isVerifiedByGatePassUser;
  Null? numberOfBags;
  Null? cargoReciptImage;
  bool? isOrderObjection;
  Null? orderObjectionDetail;
  Null? objectionApprovedOrCancelledById;
  int? objectionResult;
  int? cargoId;
  Null? cargo;

  PendingOrdersList(
      {this.orderId,
        this.orderNo,
        this.date,
        this.totalAmount,
        this.type,
        this.paymentStatus,
        this.status,
        this.dealerId,
        this.dealer,
        this.warehouseId,
        this.warehouse,
        this.tenantId,
        this.voucher,
        this.orderLines,
        this.isVerifiedByGatePassUser,
        this.numberOfBags,
        this.cargoReciptImage,
        this.isOrderObjection,
        this.orderObjectionDetail,
        this.objectionApprovedOrCancelledById,
        this.objectionResult,
        this.cargoId,
        this.cargo});

  PendingOrdersList.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    orderNo = json['orderNo'];
    date = json['date'];
    totalAmount = json['totalAmount'];
    type = json['type'];
    paymentStatus = json['paymentStatus'];
    status = json['status'];
    dealerId = json['dealerId'];
    dealer =
    json['dealer'] != null ? new Dealer.fromJson(json['dealer']) : null;
    warehouseId = json['warehouseId'];
    warehouse = json['warehouse'];
    tenantId = json['tenantId'];
    voucher =
    json['voucher'] != null ? new Voucher.fromJson(json['voucher']) : null;
    orderLines = json['orderLines'];
    isVerifiedByGatePassUser = json['isVerifiedByGatePassUser'];
    numberOfBags = json['numberOfBags'];
    cargoReciptImage = json['cargoReciptImage'];
    isOrderObjection = json['isOrderObjection'];
    orderObjectionDetail = json['orderObjectionDetail'];
    objectionApprovedOrCancelledById = json['objectionApprovedOrCancelledById'];
    objectionResult = json['objectionResult'];
    cargoId = json['cargoId'];
    cargo = json['cargo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderId'] = this.orderId;
    data['orderNo'] = this.orderNo;
    data['date'] = this.date;
    data['totalAmount'] = this.totalAmount;
    data['type'] = this.type;
    data['paymentStatus'] = this.paymentStatus;
    data['status'] = this.status;
    data['dealerId'] = this.dealerId;
    if (this.dealer != null) {
      data['dealer'] = this.dealer!.toJson();
    }
    data['warehouseId'] = this.warehouseId;
    data['warehouse'] = this.warehouse;
    data['tenantId'] = this.tenantId;
    if (this.voucher != null) {
      data['voucher'] = this.voucher!.toJson();
    }
    data['orderLines'] = this.orderLines;
    data['isVerifiedByGatePassUser'] = this.isVerifiedByGatePassUser;
    data['numberOfBags'] = this.numberOfBags;
    data['cargoReciptImage'] = this.cargoReciptImage;
    data['isOrderObjection'] = this.isOrderObjection;
    data['orderObjectionDetail'] = this.orderObjectionDetail;
    data['objectionApprovedOrCancelledById'] =
        this.objectionApprovedOrCancelledById;
    data['objectionResult'] = this.objectionResult;
    data['cargoId'] = this.cargoId;
    data['cargo'] = this.cargo;
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

class Voucher {
  int? voucherId;
  double? totalReceived;
  double? totalAmount;
  int? dealerId;
  Null? dealer;
  int? tenantId;
  // List<Null>? voucherLines;
  int? totalCount;
  int? pendingVoucherLines;

  Voucher(
      {this.voucherId,
        this.totalReceived,
        this.totalAmount,
        this.dealerId,
        this.dealer,
        this.tenantId,
        // this.voucherLines,
        this.totalCount,
        this.pendingVoucherLines});

  Voucher.fromJson(Map<String, dynamic> json) {
    voucherId = json['voucherId'];
    totalReceived = json['totalReceived'];
    totalAmount = json['totalAmount'];
    dealerId = json['dealerId'];
    dealer = json['dealer'];
    tenantId = json['tenantId'];
    // if (json['voucherLines'] != null) {
    //   voucherLines = <Null>[];
    //   json['voucherLines'].forEach((v) {
    //     // voucherLines!.add(new Null.fromJson(v));
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
    data['dealer'] = this.dealer;
    data['tenantId'] = this.tenantId;
    // if (this.voucherLines != null) {
    //   data['voucherLines'] = this.voucherLines!.map((v) => v.toJson()).toList();
    // }
    data['totalCount'] = this.totalCount;
    data['pendingVoucherLines'] = this.pendingVoucherLines;
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