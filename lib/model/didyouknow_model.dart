class DidYouKnowModel {
  int? id;
  String? createdAt;
  String? fact;

  DidYouKnowModel({this.id, this.createdAt, this.fact});

  DidYouKnowModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    fact = json['fact'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created_at'] = createdAt;
    data['fact'] = fact;
    return data;
  }
}
