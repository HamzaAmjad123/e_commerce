class OrderSaveModel {
  String? message;
  String? order;

  OrderSaveModel({this.message, this.order});

  OrderSaveModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['order'] = this.order;
    return data;
  }
}