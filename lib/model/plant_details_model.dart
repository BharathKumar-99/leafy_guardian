import 'dart:convert';

import 'common_question_model.dart';

class PlantsDetailModel {
  String? name;
  String? description;
  List<CommonQuestions>? commonQuestions;
  String? idealTemp;
  String? idelMoist;
  String? recomendedSoilPh;

  PlantsDetailModel(
      {this.name,
      this.description,
      this.commonQuestions,
      this.idealTemp,
      this.idelMoist,
      this.recomendedSoilPh});

  PlantsDetailModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    if (json['common_questions'] != null) {
      commonQuestions = <CommonQuestions>[];
      json['common_questions'].forEach((v) {
        commonQuestions!.add(CommonQuestions.fromJson(v));
      });
    }
    idealTemp = json['ideal_temp'];
    idelMoist = json['ideal_moist'];
    recomendedSoilPh = json['recommended_soil_ph'];
  }
  factory PlantsDetailModel.fromRawJson(String str) =>
      PlantsDetailModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    if (commonQuestions != null) {
      data['common_questions'] =
          commonQuestions!.map((v) => v.toJson()).toList();
    }
    data['ideal_temp'] = idealTemp;
    data['ideal_moist'] = idelMoist;
    data['recommended_soil_ph'] = recomendedSoilPh;
    return data;
  }
}
