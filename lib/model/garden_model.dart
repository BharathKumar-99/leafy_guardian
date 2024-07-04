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
  DateTime? lastWatering;

  GardenModel(
      {this.name,
      this.temp,
      this.humidity,
      this.soil,
      this.image,
      this.description,
      this.id,
      this.soilPh,
      this.lastWatering,
      this.potNo});

  GardenModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    temp = json['temperature'];
    humidity = json['humidity'];
    soil = json['soil'];
    image = json['image'];
    soilPh = json['soil_ph'];
    description = json['description'] != null
        ? PlantsDetailModel.fromJson(json['description'])
        : null;
    potNo = json['potNo'];

    lastWatering = json['last_watered'] != null
        ? DateTime.parse(json['last_watered'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['temp'] = temp;
    data['temperature'] = humidity;
    data['soil'] = soil;
    data['image'] = image;
    data['soil_ph'] = soilPh;
    if (description != null) {
      data['description'] = description!.toJson();
    }
    data['potNo'] = potNo;
    data['last_watered'] = lastWatering.toString();
    return data;
  }
}
