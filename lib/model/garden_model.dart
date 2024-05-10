//model class for garden of user
import 'package:leafy_guardian/model/plant_details_model.dart';

class GardenModel {
  int? id;
  String? name;
  double? temp;
  double? humidity;
  double? soilPh;
  String? soil;
  String? image;
  PlantsDetailModel? description;
  int? potNo;

  GardenModel(
      {this.name,
      this.temp,
      this.humidity,
      this.soil,
      this.image,
      this.description,
      this.id,this.soilPh,
      this.potNo});

  GardenModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    temp = json['temp'];
    humidity = json['humidity'];
    soil = json['soil'];
    image = json['image'];
    soilPh = json['soil_ph'];
    description = json['description'] != null
        ? PlantsDetailModel.fromJson(json['description'])
        : null;
    potNo = json['potNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['temp'] = temp;
    data['humidity'] = humidity;
    data['soil'] = soil;
    data['image'] = image;
    data['soil_ph'] = soilPh;
    if (description != null) {
      data['description'] = description!.toJson();
    }
    data['potNo'] = potNo;
    return data;
  }
}
