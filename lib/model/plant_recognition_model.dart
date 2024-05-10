class PlantRecognitionModel {
  String? language;
  String? preferedReferential;
  String? bestMatch;

  PlantRecognitionModel({
    this.language,
    this.preferedReferential,
    this.bestMatch,
  });

  PlantRecognitionModel.fromJson(Map<String, dynamic> json) {
    language = json['language'];
    preferedReferential = json['preferedReferential'];
    bestMatch = json['bestMatch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['language'] = language;
    data['preferedReferential'] = preferedReferential;
    data['bestMatch'] = bestMatch;

    return data;
  }
}
