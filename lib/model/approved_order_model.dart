class ApprovedOrderModel {
  int? totalCount;
  List<ApprovedOrder>? result;

  ApprovedOrderModel({this.totalCount, this.result});

  ApprovedOrderModel.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    if (json['result'] != null) {
      result = <ApprovedOrder>[];
      json['result'].forEach((v) {
        result!.add(new ApprovedOrder.fromJson(v));
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

class ApprovedOrder {
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
  Null? voucher;
  Null? orderLines;
  bool? isVerifiedByGatePassUser;
  Null? numberOfBags;
  Null? cargoReciptImage;
  bool? isOrderObjection;
  Null? orderObjectionDetail;
  Null? objectionApprovedOrCancelledById;
  Null? objectionResult;
  Null? cargoId;
  Null? cargo;

  ApprovedOrder(
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

  ApprovedOrder.fromJson(Map<String, dynamic> json) {
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
    voucher = json['voucher'];
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
    data['voucher'] = this.voucher;
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
  Null? phoneNumber;
  Null? about;
  Null? imageUrl;
  Null? name;
  Null? tenantId;
  Null? aqmId;
  Null? rmsId;
  Null? asmId;
  Null? meId;
  bool? isAsignAllWarehouse;
  List<WearHouse>? warehouses;

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
    aqmId = json['aqmId'];
    rmsId = json['rmsId'];
    asmId = json['asmId'];
    meId = json['meId'];
    isAsignAllWarehouse = json['isAsignAllWarehouse'];
    if (json['warehouses'] != null) {
      warehouses = <WearHouse>[];
      json['warehouses'].forEach((v) {
        warehouses!.add(new WearHouse.fromJson(v));
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

class WearHouse {
  int? warehouseId;
  String? name;
  String? address;
  int? cityId;
  int? tenantId;
  String? createdBy;
  String? createdDate;
  String? updatedBy;
  String? updatedDate;

  WearHouse(
      {this.warehouseId,
        this.name,
        this.address,
        this.cityId,
        this.tenantId,
        this.createdBy,
        this.createdDate,
        this.updatedBy,
        this.updatedDate});

  WearHouse.fromJson(Map<String, dynamic> json) {
    warehouseId = json['warehouseId'];
    name = json['name'];
    address = json['address'];
    cityId = json['cityId'];
    tenantId = json['tenantId'];
    createdBy = json['createdBy'];
    createdDate = json['createdDate'];
    updatedBy = json['updatedBy'];
    updatedDate = json['updatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['warehouseId'] = this.warehouseId;
    data['name'] = this.name;
    data['address'] = this.address;
    data['cityId'] = this.cityId;
    data['tenantId'] = this.tenantId;
    data['createdBy'] = this.createdBy;
    data['createdDate'] = this.createdDate;
    data['updatedBy'] = this.updatedBy;
    data['updatedDate'] = this.updatedDate;
    return data;
  }
}