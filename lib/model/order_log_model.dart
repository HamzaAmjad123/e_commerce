class OrderLogModel {
  int? deliveryLogId;
  int? status;
  String? description;
  int? shippedBy;
  String? dealerSign;
  String? deliveredBySign;
  bool? isVerifiedByGatePassUser;
  int? gatePassUserId;
  Null? gatePassUser;
  int? warehouseId;
  Null? warehouse;
  int? deliverById;
  String? deliverBy;
  int? orderId;
  Null? order;
  int? tenantId;
  String? createdBy;
  String? createdDate;
  String? updatedBy;
  String? updatedDate;

  OrderLogModel(
      {this.deliveryLogId,
        this.status,
        this.description,
        this.shippedBy,
        this.dealerSign,
        this.deliveredBySign,
        this.isVerifiedByGatePassUser,
        this.gatePassUserId,
        this.gatePassUser,
        this.warehouseId,
        this.warehouse,
        this.deliverById,
        this.deliverBy,
        this.orderId,
        this.order,
        this.tenantId,
        this.createdBy,
        this.createdDate,
        this.updatedBy,
        this.updatedDate});

  OrderLogModel.fromJson(Map<String, dynamic> json) {
    deliveryLogId = json['deliveryLogId'];
    status = json['status'];
    description = json['description'];
    shippedBy = json['shippedBy'];
    dealerSign = json['dealerSign'];
    deliveredBySign = json['deliveredBySign'];
    isVerifiedByGatePassUser = json['isVerifiedByGatePassUser'];
    gatePassUserId = json['gatePassUserId'];
    gatePassUser = json['gatePassUser'];
    warehouseId = json['warehouseId'];
    warehouse = json['warehouse'];
    deliverById = json['deliverById'];
    deliverBy = json['deliverBy'];
    orderId = json['orderId'];
    order = json['order'];
    tenantId = json['tenantId'];
    createdBy = json['createdBy'];
    createdDate = json['createdDate'];
    updatedBy = json['updatedBy'];
    updatedDate = json['updatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['deliveryLogId'] = this.deliveryLogId;
    data['status'] = this.status;
    data['description'] = this.description;
    data['shippedBy'] = this.shippedBy;
    data['dealerSign'] = this.dealerSign;
    data['deliveredBySign'] = this.deliveredBySign;
    data['isVerifiedByGatePassUser'] = this.isVerifiedByGatePassUser;
    data['gatePassUserId'] = this.gatePassUserId;
    data['gatePassUser'] = this.gatePassUser;
    data['warehouseId'] = this.warehouseId;
    data['warehouse'] = this.warehouse;
    data['deliverById'] = this.deliverById;
    data['deliverBy'] = this.deliverBy;
    data['orderId'] = this.orderId;
    data['order'] = this.order;
    data['tenantId'] = this.tenantId;
    data['createdBy'] = this.createdBy;
    data['createdDate'] = this.createdDate;
    data['updatedBy'] = this.updatedBy;
    data['updatedDate'] = this.updatedDate;
    return data;
  }
}
