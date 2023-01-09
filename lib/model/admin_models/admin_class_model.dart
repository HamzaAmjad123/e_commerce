class AdminClassModel {
  List<ClassList>? result;

  AdminClassModel({this.result});

  AdminClassModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <ClassList>[];
      json['result'].forEach((v) {
        result!.add(new ClassList.fromJson(v));
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

class ClassList {
  int? levelId;
  String? name;
  int? tenantId;
  String? createdBy;
  String? createdDate;
  String? updatedBy;
  String? updatedDate;

  ClassList(
      {this.levelId,
        this.name,
        this.tenantId,
        this.createdBy,
        this.createdDate,
        this.updatedBy,
        this.updatedDate});

  ClassList.fromJson(Map<String, dynamic> json) {
    levelId = json['levelId'];
    name = json['name'];
    tenantId = json['tenantId'];
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
    data['createdBy'] = this.createdBy;
    data['createdDate'] = this.createdDate;
    data['updatedBy'] = this.updatedBy;
    data['updatedDate'] = this.updatedDate;
    return data;
  }
}
