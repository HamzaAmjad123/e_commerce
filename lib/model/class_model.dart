class ClassesModel {
  List<Classes>? result;

  ClassesModel({this.result});

  ClassesModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Classes>[];
      json['result'].forEach((v) {
        result!.add(new Classes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Classes {
  int? levelId;
  String? name;
  int? tenantId;
  Null? tenant;
  Null? createdBy;
  String? createdDate;
  Null? updatedBy;
  Null? updatedDate;

  Classes(
      {this.levelId,
        this.name,
        this.tenantId,
        this.tenant,
        this.createdBy,
        this.createdDate,
        this.updatedBy,
        this.updatedDate});

  Classes.fromJson(Map<String, dynamic> json) {
    levelId = json['levelId'];
    name = json['name'];
    tenantId = json['tenantId'];
    tenant = json['tenant'];
    createdBy = json['createdBy'];
    createdDate = json['createdDate'];
    updatedBy = json['updatedBy'];
    updatedDate = json['updatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['levelId'] = this.levelId;
    data['name'] = this.name;
    data['tenantId'] = this.tenantId;
    data['tenant'] = this.tenant;
    data['createdBy'] = this.createdBy;
    data['createdDate'] = this.createdDate;
    data['updatedBy'] = this.updatedBy;
    data['updatedDate'] = this.updatedDate;
    return data;
  }
}
