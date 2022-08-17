class CartModel {
  int discount;
  double unitPrice;
  double totalPrice;
  String name;
  int id;
  int qty = 0;
  CartModel(
      this.discount, this.unitPrice,this.totalPrice, this.name, this.id, this.qty);
  static List<CartModel> d1() => [];

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      json['discount'],
      json['price'],
      json['name'],
      json['id'],
      json['totalprice'],
      json['qty'],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.discount;
    data['price'] = this.unitPrice;
    data['name'] = this.name;
    data['id'] = this.id;
    data['totalprice'] = this.totalPrice;
    return data;
  }
}
