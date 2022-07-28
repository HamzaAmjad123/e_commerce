class CartModel {
  int discount;
  double unitprice;
  double totalprice;
  String name;
  int id;
  int qty = 0;
  CartModel(
      this.discount, this.unitprice,this.totalprice, this.name, this.id, this.qty);
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
    data['image'] = this.discount;
    data['price'] = this.unitprice;
    data['name'] = this.name;
    data['id'] = this.id;
    data['totalprice'] = this.totalprice;
    return data;
  }
}
