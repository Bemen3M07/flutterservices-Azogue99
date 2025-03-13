// car_model.dart

import 'dart:convert';

// Funció per obtenir una llista d'objectes de tipus CarsModel a partir d'un string json
List<CarsModel> carsModelFromJson(String str) => List<CarsModel>.from(
  json.decode(str).map((x) => CarsModel.fromMapToCarObject(x)),
);

// Funció per obtenir un string json a partir d'una llista d'objectes de tipus CarsModel
String carsModelToJson(List<CarsModel> data) =>
  json.encode(List<dynamic>.from(data.map((x) => x.fromCarObjectToMap())));

class CarsModel {
  int id;
  int year;
  String make;
  String model;
  String type;

  CarsModel({
    required this.id,
    required this.year,
    required this.make,
    required this.model,
    required this.type,
  });

  factory CarsModel.fromMapToCarObject(Map<String, dynamic> json) => CarsModel(
        id: json["id"],
        year: json["year"],
        make: json["make"],
        model: json["model"],
        type: json["type"],
      );

  // Mètode per convertir un objecte de tipus CarsModel a un mapa d'objectes
  Map<String, dynamic> fromCarObjectToMap() => {
        "id": id,
        "year": year,
        "make": make,
        "model": model,
        "type": type,
      };
}
