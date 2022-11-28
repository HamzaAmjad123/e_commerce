import 'package:e_commerce/model/class_model.dart';

class ItemsModel {
  int? totalCount;
  List<Items>? result;

  ItemsModel({this.totalCount, this.result});

  ItemsModel.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    if (json['result'] != null) {
      result = <Items>[];
      json['result'].forEach((v) { result!.add(new Items.fromJson(v)); });
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

class Items {
  int? itemId;
  String? name;
  int? seriesId;
  Series? series;
  int? unitDiscountPercentage;
  double? unitPrice;
  String? slogan;
  String? code;
  int? availableStock;
  bool? isApproved;
  String? approvedBy;
  String? image;
  String? address;
  int? cityId;
  int? rankId;
  Null? rank;
  int? status;
  Null? languageId;
  int? classId;
  ClassModel? classModel;
  int? itemTypeId;
  ItemType? itemType;
  int? warehouseId;
  Warehouse? warehouse;
  int? tenantId;
  Null? rankingColor;
  int? qty = 0;

  Items({this.itemId, this.name, this.seriesId, this.series, this.unitDiscountPercentage,
  this.unitPrice, this.slogan, this.code, this.availableStock, this.isApproved, this.approvedBy,
  this.image, this.address, this.cityId, this.rankId, this.rank, this.status, this.languageId,
  this.classId, this.classModel, this.itemTypeId, this.itemType, this.warehouseId, this.warehouse, this.tenantId, this.rankingColor,this.qty});
  static List<Items> d1() => [];

  Items.fromJson(Map<String, dynamic> json) {
  itemId = json['itemId'];
  name = json['name'];
  seriesId = json['seriesId'];
  series = json['series'] != null ? new Series.fromJson(json['series']) : null;
  unitDiscountPercentage = json['unitDiscountPercentage'];
  unitPrice = json['unitPrice'];
  slogan = json['slogan'];
  code = json['code'];
  availableStock = json['availableStock'];
  isApproved = json['isApproved'];
  approvedBy = json['approvedBy'];
  image = json['image'];
  address = json['address'];
  cityId = json['cityId'];
  rankId = json['rankId'];
  rank = json['rank'];
  status = json['status'];
  languageId = json['languageId'];
  classId = json['classId'];
  classModel = json['class'] != null ? new ClassModel.fromJson(json['class']) : null;
  itemTypeId = json['itemTypeId'];
  itemType = json['itemType'] != null ? new ItemType.fromJson(json['itemType']) : null;
  warehouseId = json['warehouseId'];
  warehouse = json['warehouse'] != null ? new Warehouse.fromJson(json['warehouse']) : null;
  tenantId = json['tenantId'];
  rankingColor = json['rankingColor'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['itemId'] = this.itemId;
  data['qty'] = this.qty;
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

class ClassModel {
  int? levelId;
  String? name;

  ClassModel({this.levelId, this.name});

  ClassModel.fromJson(Map<String, dynamic> json) {
    levelId = json['levelId'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['levelId'] = this.levelId;
    data['name'] = this.name;
    return data;
  }
}

class ItemType {
  int? itemTypeId;
  String? name;

  ItemType({this.itemTypeId, this.name});

  ItemType.fromJson(Map<String, dynamic> json) {
    itemTypeId = json['itemTypeId'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemTypeId'] = this.itemTypeId;
    data['name'] = this.name;
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


