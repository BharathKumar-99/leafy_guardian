class UserModel {
  int? id;
  String? createdAt;
  String? name;
  String? pic;
  String? userId;
  String? email;

  UserModel(
      {this.id, this.createdAt, this.name, this.pic, this.userId, this.email});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    name = json['name'];
    pic = json['pic'];
    userId = json['user_id'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created_at'] = createdAt;
    data['name'] = name;
    data['pic'] = pic;
    data['user_id'] = userId;
    data['email'] = email;
    return data;
  }
}
