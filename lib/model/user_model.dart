class UserResponseModel {
  String? token;
  String? expiration;
  UserModel? user;
  Tenant? tenant;
  List<String>? userRoles;

  UserResponseModel({this.token, this.expiration, this.user,
    this.tenant,
    this.userRoles});

  UserResponseModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    expiration = json['expiration'];
    user = json['user'] != null ? new UserModel.fromJson(json['user']) : null;
    tenant = json['tenant'] != null ? new Tenant.fromJson(json['tenant']) : null;
    userRoles = json['userRoles'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['expiration'] = this.expiration;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.tenant != null) {
      data['tenant'] = this.tenant!.toJson();
    }
    data['userRoles'] = this.userRoles;
    return data;
  }
}

class UserModel {
  int? id;
  String? userName;
  String? email;
  String? imageUrl;
  String? name;
  int? tenantId;

  UserModel({this.id, this.userName, this.email, this.imageUrl, this.name, this.tenantId});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    email = json['email'];
    imageUrl = json['imageUrl'];
    name = json['name'];
    tenantId = json['tenantId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['email'] = this.email;
    data['imageUrl'] = this.imageUrl;
    data['name'] = this.name;
    data['tenantId'] = this.tenantId;
    return data;
  }
}

class Tenant {


  // Tenant({});

Tenant.fromJson(Map<String, dynamic> json) {
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  return data;
}
}
