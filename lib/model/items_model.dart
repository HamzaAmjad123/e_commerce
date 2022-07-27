class ItemsModel {
  int? totalCount;
  List<ItemsList>? result;

  ItemsModel({this.totalCount, this.result});

  ItemsModel.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    if (json['result'] != null) {
      result = <ItemsList>[];
      json['result'].forEach((v) { result!.add(new ItemsList.fromJson(v)); });
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

class ItemsList {
  int? itemId;
  String? name;
  String? slogan;
  String? code;
  double? unitPrice;
  int? unitDiscountPercentage;
  int? status;
  int? availableStock;
  bool? isAvailable;
  String? address;
  int? cityId;
  int? rankId;
  Null? rank;
  Null? languageId;
  Null? language;
  int? classId;
  // Null? class;
  int? seriesId;
  Series? series;
  int? itemTypeId;
  Null? itemType;
  int? tenantId;
  Null? createdBy;
  String? createdDate;
  Null? updatedBy;
  Null? updatedDate;

  ItemsList({this.itemId, this.name, this.slogan, this.code, this.unitPrice, this.unitDiscountPercentage, this.status, this.availableStock, this.isAvailable, this.address, this.cityId, this.rankId, this.rank, this.languageId, this.language, this.classId, /*this.class,*/ this.seriesId, this.series, this.itemTypeId, this.itemType, this.tenantId, this.createdBy, this.createdDate, this.updatedBy, this.updatedDate});

  ItemsList.fromJson(Map<String, dynamic> json) {
  itemId = json['itemId'];
  name = json['name'];
  slogan = json['slogan'];
  code = json['code'];
  unitPrice = json['unitPrice'];
  unitDiscountPercentage = json['unitDiscountPercentage'];
  status = json['status'];
  availableStock = json['availableStock'];
  isAvailable = json['isAvailable'];
  address = json['address'];
  cityId = json['cityId'];
  rankId = json['rankId'];
  rank = json['rank'];
  languageId = json['languageId'];
  language = json['language'];
  classId = json['classId'];
// class = json['class'];
  seriesId = json['seriesId'];
  series = json['series'] != null ? new Series.fromJson(json['series']) : null;
  itemTypeId = json['itemTypeId'];
  itemType = json['itemType'];
  tenantId = json['tenantId'];
  createdBy = json['createdBy'];
  createdDate = json['createdDate'];
  updatedBy = json['updatedBy'];
  updatedDate = json['updatedDate'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['itemId'] = this.itemId;
  data['name'] = this.name;
  data['slogan'] = this.slogan;
  data['code'] = this.code;
  data['unitPrice'] = this.unitPrice;
  data['unitDiscountPercentage'] = this.unitDiscountPercentage;
  data['status'] = this.status;
  data['availableStock'] = this.availableStock;
  data['isAvailable'] = this.isAvailable;
  data['address'] = this.address;
  data['cityId'] = this.cityId;
  data['rankId'] = this.rankId;
  data['rank'] = this.rank;
  data['languageId'] = this.languageId;
  data['language'] = this.language;
  data['classId'] = this.classId;
  // data['class'] = this.class;
  data['seriesId'] = this.seriesId;
  if (this.series != null) {
  data['series'] = this.series!.toJson();
  }
  data['itemTypeId'] = this.itemTypeId;
  data['itemType'] = this.itemType;
  data['tenantId'] = this.tenantId;
  data['createdBy'] = this.createdBy;
  data['createdDate'] = this.createdDate;
  data['updatedBy'] = this.updatedBy;
  data['updatedDate'] = this.updatedDate;
  return data;
  }
}

class Series {
  int? seriesId;
  String? name;
  int? tenantId;
  Null? createdBy;
  String? createdDate;
  Null? updatedBy;
  Null? updatedDate;

  Series({this.seriesId, this.name, this.tenantId, this.createdBy, this.createdDate, this.updatedBy, this.updatedDate});

  Series.fromJson(Map<String, dynamic> json) {
    seriesId = json['seriesId'];
    name = json['name'];
    tenantId = json['tenantId'];
    createdBy = json['createdBy'];
    createdDate = json['createdDate'];
    updatedBy = json['updatedBy'];
    updatedDate = json['updatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seriesId'] = this.seriesId;
    data['name'] = this.name;
    data['tenantId'] = this.tenantId;
    data['createdBy'] = this.createdBy;
    data['createdDate'] = this.createdDate;
    data['updatedBy'] = this.updatedBy;
    data['updatedDate'] = this.updatedDate;
    return data;
  }
}
