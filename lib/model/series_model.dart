class SeriesModel {
  int? totalCount;
  List<Series>? result;

  SeriesModel({this.totalCount, this.result});

  SeriesModel.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    if (json['result'] != null) {
      result = <Series>[];
      json['result'].forEach((v) {
        result!.add(new Series.fromJson(v));
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

class Series {
  int? seriesId;
  String? name;
  int? tenantId;
  // Null? createdBy;
  String? createdDate;
  // Null? updatedBy;
  // Null? updatedDate;

  Series(
      {this.seriesId,
        this.name,
        this.tenantId,
        // this.createdBy,
        this.createdDate,
       /* this.updatedBy,
        this.updatedDate*/});

  Series.fromJson(Map<String, dynamic> json) {
    seriesId = json['seriesId'];
    name = json['name'];
    tenantId = json['tenantId'];
    // createdBy = json['createdBy'];
    createdDate = json['createdDate'];
    // updatedBy = json['updatedBy'];
    // updatedDate = json['updatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seriesId'] = this.seriesId;
    data['name'] = this.name;
    data['tenantId'] = this.tenantId;
    // data['createdBy'] = this.createdBy;
    data['createdDate'] = this.createdDate;
    // data['updatedBy'] = this.updatedBy;
    // data['updatedDate'] = this.updatedDate;
    return data;
  }
}
