class OrderSave {
  String? message;
  String? order;

  OrderSave({this.message, this.order});

  OrderSave.fromJson(Map<String, dynamic> json) {
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