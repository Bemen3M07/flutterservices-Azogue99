// car_model.dart
// ---------------------------------------------------------------------
// Classe Car i funció per convertir la resposta JSON en objectes Car.
// ---------------------------------------------------------------------
import 'dart:convert';

List<Car> carsFromJson(String str) =>
    List<Car>.from(json.decode(str).map((x) => Car.fromMap(x)));

class Car {
  final int? id;
  final int? year;
  final String? make;
  final String? model;
  final String? type;

  Car({
    this.id,
    this.year,
    this.make,
    this.model,
    this.type,
  });

  factory Car.fromMap(Map<String, dynamic> map) {
    return Car(
      id: map["id"],
      year: map["year"],
      make: map["make"],
      model: map["model"],
      type: map["type"],
    );
  }
}
