class OrderObjectionModel {
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
  Warehouse? warehouse;
  int? tenantId;
  String? voucher;
  List<ObjectionOrderLines>? orderLines;
  bool? isVerifiedByGatePassUser;
  int? numberOfBags;
  String? cargoReciptImage;
  bool? isOrderObjection;
  String? orderObjectionDetail;
  String? objectionApprovedOrCancelledById;
  int? objectionResult;
  int? cargoId;
  Cargo? cargo;

  OrderObjectionModel(
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

  OrderObjectionModel.fromJson(Map<String, dynamic> json) {
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
    warehouse = json['warehouse'] != null
        ? new Warehouse.fromJson(json['warehouse'])
        : null;
    tenantId = json['tenantId'];
    voucher = json['voucher'];
    if (json['orderLines'] != null) {
      orderLines = <ObjectionOrderLines>[];
      json['orderLines'].forEach((v) {
        orderLines!.add(new ObjectionOrderLines.fromJson(v));
      });
    }
    isVerifiedByGatePassUser = json['isVerifiedByGatePassUser'];
    numberOfBags = json['numberOfBags'];
    cargoReciptImage = json['cargoReciptImage'];
    isOrderObjection = json['isOrderObjection'];
    orderObjectionDetail = json['orderObjectionDetail'];
    objectionApprovedOrCancelledById = json['objectionApprovedOrCancelledById'];
    objectionResult = json['objectionResult'];
    cargoId = json['cargoId'];
    cargo = json['cargo'] != null ? new Cargo.fromJson(json['cargo']) : null;
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
    if (this.warehouse != null) {
      data['warehouse'] = this.warehouse!.toJson();
    }
    data['tenantId'] = this.tenantId;
    data['voucher'] = this.voucher;
    if (this.orderLines != null) {
      data['orderLines'] = this.orderLines!.map((v) => v.toJson()).toList();
    }
    data['isVerifiedByGatePassUser'] = this.isVerifiedByGatePassUser;
    data['numberOfBags'] = this.numberOfBags;
    data['cargoReciptImage'] = this.cargoReciptImage;
    data['isOrderObjection'] = this.isOrderObjection;
    data['orderObjectionDetail'] = this.orderObjectionDetail;
    data['objectionApprovedOrCancelledById'] =
        this.objectionApprovedOrCancelledById;
    data['objectionResult'] = this.objectionResult;
    data['cargoId'] = this.cargoId;
    if (this.cargo != null) {
      data['cargo'] = this.cargo!.toJson();
    }
    return data;
  }
}

class Dealer {
  int? id;
  String? username;
  String? email;
  String? password;
  String? role;
  String? phoneNumber;
  String? about;
  String? imageUrl;
  String? name;
  int? tenantId;
  int? aqmId;
  int? rmsId;
  int? asmId;
  int? meId;
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
  String? updatedBy;
  String? createdBy;

  Warehouse(
      {this.warehouseId,
        this.name,
        this.address,
        this.cityId,
        this.tenantId,
        this.updatedBy,
        this.createdBy});

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

class ObjectionOrderLines {
  int? orderLineId;
  int? quantity;
  int? receivedQuantity;
  double? unitPrice;
  double? descountPrice;
  int? type;
  double? totalAmount;
  int? itemId;
  int? objectionId=0;
  Item? item;
  int? orderId;
  int? tenantId;

  ObjectionOrderLines(
      {this.orderLineId,
        this.quantity,
        this.unitPrice,
        this.descountPrice,
        this.type,
        this.totalAmount,
        this.itemId,
        this.item,
        this.orderId,
        this.tenantId,
      this.objectionId,
        this.receivedQuantity
      });

  ObjectionOrderLines.fromJson(Map<String, dynamic> json) {
    orderLineId = json['orderLineId'];
    quantity = json['quantity'];
    unitPrice = json['unitPrice'];
    descountPrice = json['descountPrice'];
    type = json['type'];
    totalAmount = json['totalAmount'];
    itemId = json['itemId'];
    item = json['item'] != null ? new Item.fromJson(json['item']) : null;
    orderId = json['orderId'];
    tenantId = json['tenantId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orderLineId'] = this.orderLineId;
    data['expectedQuantity'] = this.quantity;
    data['unitPrice'] = this.unitPrice;
    data['descountPrice'] = this.descountPrice;
    data['type'] = this.type;
    data['totalAmount'] = this.totalAmount;
    data['itemId'] = this.itemId;
    // if (this.item != null) {
    //   data['item'] = this.item!.toJson();
    // }
    data['orderId'] = this.orderId;
    data['tenantId'] = this.tenantId;
    data['orderObjectionId']=0;
    data['receivedQuantity']=this.receivedQuantity;
    return data;
  }
}

class Item {
  int? itemId;
  String? name;
  int? seriesId;
  Series? series;
  int? unitDiscountPercentage;
  double? unitPrice;




  Item(
      {this.itemId,
        this.name,
        this.seriesId,
        this.series,
        this.unitDiscountPercentage,
        this.unitPrice});

  Item.fromJson(Map<String, dynamic> json) {
    itemId = json['itemId'];
    name = json['name'];
    seriesId = json['seriesId'];
    series = json['series'] != null ? new Series.fromJson(json['series']) : null;
    unitDiscountPercentage = json['unitDiscountPercentage'];
    unitPrice = json['unitPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemId'] = this.itemId;
    data['name'] = this.name;
    data['seriesId'] = this.seriesId;
    if (this.series != null) {
      data['series'] = this.series!.toJson();
    }
    data['unitDiscountPercentage'] = this.unitDiscountPercentage;
    data['unitPrice'] = this.unitPrice;
    return data;
  }
}
class Series {
  int? seriesId;
  String? name;

  Series({this.seriesId, this.name});

  Series.fromJson(Map<String, dynamic> json) {
    seriesId = json['seriesId'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seriesId'] = this.seriesId;
    data['name'] = this.name;
    return data;
  }
}

class Cargo {
  int? cargoId;
  String? name;
  String? detail;
  int? warehouseId;
  Warehouse? warehouse;
  int? tenantId;

  Cargo({this.cargoId, this.name, this.detail, this.warehouseId, this.warehouse, this.tenantId});

  Cargo.fromJson(Map<String, dynamic> json) {
    cargoId = json['cargoId'];
    name = json['name'];
    detail = json['detail'];
    warehouseId = json['warehouseId'];
    warehouse = json['warehouse'] != null
        ? new Warehouse.fromJson(json['warehouse'])
        : null;
    tenantId = json['tenantId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cargoId'] = this.cargoId;
    data['name'] = this.name;
    data['detail'] = this.detail;
    data['warehouseId'] = this.warehouseId;
    if (this.warehouse != null) {
      data['warehouse'] = this.warehouse!.toJson();
    }
    data['tenantId'] = this.tenantId;
    return data;
  }
}
