class CartModel {
  int discount;
  double unitprice;
  String name;
  String image;
  int id;
  int qty = 0;
  CartModel(
      this.image,
      this.discount, this.unitprice, this.name, this.id, this.qty);
  static List<CartModel> d1() => [];

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      json['image'],
      json['price'],
      json['name'],
      json['id'],
      json['totalprice'],
      json['qty'],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemId'] = this.id;
    data['quantity'] = this.qty;
    return data;
  }
}


