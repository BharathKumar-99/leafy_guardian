import 'dart:convert';

class AskGaurdianModel {
  String? question;
  List<ListDescription>? issue;
  List<ListDescription>? causes;
  List<ListDescription>? symptoms;
  List<ListDescription>? treatment;
  List<ListDescription>? tips;
  String? error;

  AskGaurdianModel(
      {this.question,
      this.issue,
      this.causes,
      this.symptoms,
      this.treatment,
      this.error,
      this.tips});

factory AskGaurdianModel.fromRawJson(String str) =>
      AskGaurdianModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  AskGaurdianModel.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    if (json['issue'] != null) {
      issue = <ListDescription>[];
      json['issue'].forEach((v) {
        issue!.add(ListDescription.fromJson(v));
      });
    }
    if (json['causes'] != null) {
      causes = <ListDescription>[];
      json['causes'].forEach((v) {
        causes!.add(ListDescription.fromJson(v));
      });
    }
    if (json['symptoms'] != null) {
      symptoms = <ListDescription>[];
      json['symptoms'].forEach((v) {
        symptoms!.add(ListDescription.fromJson(v));
      });
    }
    if (json['treatment'] != null) {
      treatment = <ListDescription>[];
      json['treatment'].forEach((v) {
        treatment!.add(ListDescription.fromJson(v));
      });
    }
    if (json['tips'] != null) {
      tips = <ListDescription>[];
      json['tips'].forEach((v) {
        tips!.add(ListDescription.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question'] = question;
    if (issue != null) {
      data['issue'] = issue!.map((v) => v.toJson()).toList();
    }
    if (causes != null) {
      data['causes'] = causes!.map((v) => v.toJson()).toList();
    }
    if (symptoms != null) {
      data['symptoms'] = symptoms!.map((v) => v.toJson()).toList();
    }
    if (treatment != null) {
      data['treatment'] = treatment!.map((v) => v.toJson()).toList();
    }
    if (tips != null) {
      data['tips'] = tips!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListDescription {
  String? title;
  String? description;

  ListDescription({this.title, this.description});

  ListDescription.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    return data;
  }
}
