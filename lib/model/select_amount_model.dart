class SelectAmountModel {
  List<SelectAmount>? result;

  SelectAmountModel({this.result});

  SelectAmountModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <SelectAmount>[];
      json['result'].forEach((v) {
        result!.add(new SelectAmount.fromJson(v));
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

class SelectAmount {
  int? paymentMethodId;
  String? name;
  String? description;
  int? tenantId;
  String? createdBy;
  String? createdDate;
  String? updatedBy;
  String? updatedDate;

  SelectAmount(
      {this.paymentMethodId,
        this.name,
        this.description,
        this.tenantId,
        this.createdBy,
        this.createdDate,
        this.updatedBy,
        this.updatedDate});

  SelectAmount.fromJson(Map<String, dynamic> json) {
    paymentMethodId = json['paymentMethodId'];
    name = json['name'];
    description = json['description'];
    tenantId = json['tenantId'];
    createdBy = json['createdBy'];
    createdDate = json['createdDate'];
    updatedBy = json['updatedBy'];
    updatedDate = json['updatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['paymentMethodId'] = this.paymentMethodId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['tenantId'] = this.tenantId;
    data['createdBy'] = this.createdBy;
    data['createdDate'] = this.createdDate;
    data['updatedBy'] = this.updatedBy;
    data['updatedDate'] = this.updatedDate;
    return data;
  }
}
