// To parse this JSON data, do
//
//     final craeteRuslt = craeteRusltFromJson(jsonString);

import 'dart:convert';

CraeteRuslt craeteRusltFromJson(String str) => CraeteRuslt.fromJson(json.decode(str));

String craeteRusltToJson(CraeteRuslt data) => json.encode(data.toJson());

class CraeteRuslt {
  int? id;
  int? userId;
  DiseaseId? diseaseId;
  DateTime? createdAt;

  CraeteRuslt({
    this.id,
    this.userId,
    this.diseaseId,
    this.createdAt,
  });

  factory CraeteRuslt.fromJson(Map<String, dynamic> json) => CraeteRuslt(
    id: json["id"],
    userId: json["user_id"],
    diseaseId: json["disease_id"] == null ? null : DiseaseId.fromJson(json["disease_id"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "disease_id": diseaseId?.toJson(),
    "created_at": createdAt?.toIso8601String(),
  };
}

class DiseaseId {
  Disease? disease;
  Plant? plant;
  Description? description;
  DateTime? createdAt;

  DiseaseId({
    this.disease,
    this.plant,
    this.description,
    this.createdAt,
  });

  factory DiseaseId.fromJson(Map<String, dynamic> json) => DiseaseId(
    disease: json["disease"] == null ? null : Disease.fromJson(json["disease"]),
    plant: json["plant"] == null ? null : Plant.fromJson(json["plant"]),
    description: json["description"] == null ? null : Description.fromJson(json["description"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "disease": disease?.toJson(),
    "plant": plant?.toJson(),
    "description": description?.toJson(),
    "created_at": createdAt?.toIso8601String(),
  };
}

class Description {
  List<Information>? information;

  Description({
    this.information,
  });

  factory Description.fromJson(Map<String, dynamic> json) => Description(
    information: json["information"] == null ? [] : List<Information>.from(json["information"]!.map((x) => Information.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "information": information == null ? [] : List<dynamic>.from(information!.map((x) => x.toJson())),
  };
}

class Information {
  String? detail;
  String? title;

  Information({
    this.detail,
    this.title,
  });

  factory Information.fromJson(Map<String, dynamic> json) => Information(
    detail: json["detail"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "detail": detail,
    "title": title,
  };
}

class Disease {
  int? id;
  String? diseaseName;
  DateTime? createdAt;

  Disease({
    this.id,
    this.diseaseName,
    this.createdAt,
  });

  factory Disease.fromJson(Map<String, dynamic> json) => Disease(
    id: json["id"],
    diseaseName: json["disease_name"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "disease_name": diseaseName,
    "created_at": createdAt?.toIso8601String(),
  };
}

class Plant {
  int? id;
  String? plantName;
  DateTime? createdAt;

  Plant({
    this.id,
    this.plantName,
    this.createdAt,
  });

  factory Plant.fromJson(Map<String, dynamic> json) => Plant(
    id: json["id"],
    plantName: json["plant_name"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "plant_name": plantName,
    "created_at": createdAt?.toIso8601String(),
  };
}
