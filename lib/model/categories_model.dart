class CategoriesModel {
  int? totalCount;
  List<Category>? result;

  CategoriesModel({this.totalCount, this.result});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    if (json['result'] != null) {
      result = <Category>[];
      json['result'].forEach((v) {
        result!.add(new Category.fromJson(v));
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

class Category {
  int? itemTypeId;
  String? name;
  int? tenantId;
  Null? createdBy;
  String? createdDate;
  Null? updatedBy;
  Null? updatedDate;

  Category(
      {this.itemTypeId,
        this.name,
        this.tenantId,
        this.createdBy,
        this.createdDate,
        this.updatedBy,
        this.updatedDate});

  Category.fromJson(Map<String, dynamic> json) {
    itemTypeId = json['itemTypeId'];
    name = json['name'];
    tenantId = json['tenantId'];
    createdBy = json['createdBy'];
    createdDate = json['createdDate'];
    updatedBy = json['updatedBy'];
    updatedDate = json['updatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemTypeId'] = this.itemTypeId;
    data['name'] = this.name;
    data['tenantId'] = this.tenantId;
    data['createdBy'] = this.createdBy;
    data['createdDate'] = this.createdDate;
    data['updatedBy'] = this.updatedBy;
    data['updatedDate'] = this.updatedDate;
    return data;
  }
}
