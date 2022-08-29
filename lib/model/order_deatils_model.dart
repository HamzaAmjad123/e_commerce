class OrderDetails {
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
  List<OrderLines>? orderLines;
  bool? isVerifiedByGatePassUser;

  OrderDetails(
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
        this.orderLines,
        this.isVerifiedByGatePassUser});

  OrderDetails.fromJson(Map<String, dynamic> json) {
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
    if (json['orderLines'] != null) {
      orderLines = <OrderLines>[];
      json['orderLines'].forEach((v) {
        orderLines!.add(new OrderLines.fromJson(v));
      });
    }
    isVerifiedByGatePassUser = json['isVerifiedByGatePassUser'];
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
    if (this.orderLines != null) {
      data['orderLines'] = this.orderLines!.map((v) => v.toJson()).toList();
    }
    data['isVerifiedByGatePassUser'] = this.isVerifiedByGatePassUser;
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
  Null? warehouseId;

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
        this.warehouseId});

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
    warehouseId = json['warehouseId'];
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
    data['warehouseId'] = this.warehouseId;
    return data;
  }
}

class OrderLines {
  int? orderLineId;
  int? quantity;
  double? unitPrice;
  double? descountPrice;
  int? type;
  double? totalAmount;
  int? itemId;
  Item? item;
  int? orderId;
  int? tenantId;

  OrderLines(
      {this.orderLineId,
        this.quantity,
        this.unitPrice,
        this.descountPrice,
        this.type,
        this.totalAmount,
        this.itemId,
        this.item,
        this.orderId,
        this.tenantId});

  OrderLines.fromJson(Map<String, dynamic> json) {
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
    data['quantity'] = this.quantity;
    data['unitPrice'] = this.unitPrice;
    data['descountPrice'] = this.descountPrice;
    data['type'] = this.type;
    data['totalAmount'] = this.totalAmount;
    data['itemId'] = this.itemId;
    if (this.item != null) {
      data['item'] = this.item!.toJson();
    }
    data['orderId'] = this.orderId;
    data['tenantId'] = this.tenantId;
    return data;
  }
}

class Item {
  int? itemId;
  String? name;
  int? seriesId;
  Null? series;
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
    series = json['series'];
    unitDiscountPercentage = json['unitDiscountPercentage'];
    unitPrice = json['unitPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemId'] = this.itemId;
    data['name'] = this.name;
    data['seriesId'] = this.seriesId;
    data['series'] = this.series;
    data['unitDiscountPercentage'] = this.unitDiscountPercentage;
    data['unitPrice'] = this.unitPrice;
    return data;
  }
}
