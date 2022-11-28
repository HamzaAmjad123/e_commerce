class CartModel {
  int discount;
  double unitprice;
  String name;
  String? image;
  String? serires;
  int id;
  int availeableStock;
  int qty = 0;
  CartModel(
      this.image,
      this.discount, this.unitprice, this.name, this.id, this.qty,this.serires,this.availeableStock);
  static List<CartModel> d1() => [];

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      json['image'],
      json['price'],
      json['availeableStock'],
      json['name'],
      json['serires'],
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


