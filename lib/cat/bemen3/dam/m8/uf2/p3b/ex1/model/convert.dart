// Importació del paquet 'dart:convert' per treballar amb JSON
import 'dart:convert';

// Importació del model de cotxe
import 'car_model.dart';

/// Funció per convertir una cadena JSON en una llista d'objectes `Car`
///
/// Aquesta funció rep una cadena JSON (`str`), la deserialitza i converteix
/// cada element en una instància de `Car` utilitzant el mètode `fromMap`.
List<Car> carFromJson(String str) {
  // Decodificació del JSON en una estructura de dades de Dart (llista de Map)
  final jsonData = json.decode(str);

  // Conversió de la llista de Map a una llista d'objectes `Car`
  return List<Car>.from(jsonData.map((item) => Car.fromMap(item)));
}

/// Funció per convertir una llista d'objectes `Car` a una cadena JSON
///
/// Aquesta funció rep una llista d'objectes `Car`, els converteix en `Map`
/// mitjançant `toMap()`, i després els serialitza en format JSON.
String carToJson(List<Car> data) {
  // Conversió de la llista d'objectes `Car` a una llista de Map
  final jsonData = data.map((item) => item.toMap()).toList();

  // Codificació de la llista de Map a una cadena JSON
  return json.encode(jsonData);
}
