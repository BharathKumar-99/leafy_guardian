//model class for garden of user
import 'package:leafy_guardian/model/plant_details_model.dart';

class GardenModel {
  int? id;
  String? name;
  double? temp;
  double? humidity;
  String? soil;
  String? image;
  PlantsDetailModel? description;

  GardenModel(
      {this.name,
      this.temp,
      this.humidity,
      this.soil,
      this.image,
      this.description});

  GardenModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    temp = json['temp'];
    humidity = json['humidity'];
    soil = json['soil'];
    image = json['image'];
    description = json['description'] != null
        ? PlantsDetailModel.fromJson(json['description'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['temp'] = temp;
    data['humidity'] = humidity;
    data['soil'] = soil;
    data['image'] = image;
    if (description != null) {
      data['description'] = description!.toJson();
    }
    return data;
  }
}
