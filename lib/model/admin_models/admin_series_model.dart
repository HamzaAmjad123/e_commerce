class AdminSeriesModel{
  int? totalCount;
  List<AdminSeriesList>? seriesList;

  AdminSeriesModel({this.totalCount, this.seriesList});

  AdminSeriesModel.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    if (json['result'] != null) {
      seriesList = <AdminSeriesList>[];
      json['result'].forEach((v) {
        seriesList!.add(new AdminSeriesList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalCount'] = this.totalCount;
    if (this.seriesList != null) {
      data['result'] = this.seriesList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AdminSeriesList {
  int? seriesId;
  String? name;
  int? tenantId;
  String? createdBy;
  String? createdDate;
  String? updatedBy;
  String? updatedDate;

  AdminSeriesList(
      {this.seriesId,
        this.name,
        this.tenantId,
        this.createdBy,
        this.createdDate,
        this.updatedBy,
        this.updatedDate});

  AdminSeriesList.fromJson(Map<String, dynamic> json) {
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
