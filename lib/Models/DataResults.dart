// To parse this JSON data, do
//
//     final dataResults = dataResultsFromJson(jsonString);

import 'dart:convert';

List<DataResults> dataResultsFromJson(String str) => List<DataResults>.from(json.decode(str).map((x) => DataResults.fromJson(x)));

String dataResultsToJson(List<DataResults> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataResults {
  int id;
  int userId;
  DiseaseId diseaseId;
  DateTime createdAt;

  DataResults({
    required this.id,
    required this.userId,
    required this.diseaseId,
    required this.createdAt,
  });

  factory DataResults.fromJson(Map<String, dynamic> json) => DataResults(
    id: json["id"],
    userId: json["user_id"],
    diseaseId: DiseaseId.fromJson(json["disease_id"]),
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "disease_id": diseaseId.toJson(),
    "created_at": createdAt.toIso8601String(),
  };
}

class DiseaseId {
  Disease disease;
  Plant plant;
  dynamic description;
  DateTime createdAt;

  DiseaseId({
    required this.disease,
    required this.plant,
    required this.description,
    required this.createdAt,
  });

  factory DiseaseId.fromJson(Map<String, dynamic> json) => DiseaseId(
    disease: Disease.fromJson(json["disease"]),
    plant: Plant.fromJson(json["plant"]),
    description: json["description"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "disease": disease.toJson(),
    "plant": plant.toJson(),
    "description": description,
    "created_at": createdAt.toIso8601String(),
  };
}

class Disease {
  int id;
  String diseaseName;
  DateTime createdAt;

  Disease({
    required this.id,
    required this.diseaseName,
    required this.createdAt,
  });

  factory Disease.fromJson(Map<String, dynamic> json) => Disease(
    id: json["id"],
    diseaseName: json["disease_name"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "disease_name": diseaseName,
    "created_at": createdAt.toIso8601String(),
  };
}

class Plant {
  int id;
  String plantName;
  DateTime createdAt;

  Plant({
    required this.id,
    required this.plantName,
    required this.createdAt,
  });

  factory Plant.fromJson(Map<String, dynamic> json) => Plant(
    id: json["id"],
    plantName: json["plant_name"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "plant_name": plantName,
    "created_at": createdAt.toIso8601String(),
  };
}

