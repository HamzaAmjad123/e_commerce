class AdminWearhouseModel {
  int? warehouseId;
  String? name;
  String? address;
  int? cityId;
  int? tenantId;
  String? createdBy;
  String? createdDate;
  String? updatedBy;
  String? updatedDate;

  AdminWearhouseModel(
      {this.warehouseId,
        this.name,
        this.address,
        this.cityId,
        this.tenantId,
        this.createdBy,
        this.createdDate,
        this.updatedBy,
        this.updatedDate});

  AdminWearhouseModel.fromJson(Map<String, dynamic> json) {
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
