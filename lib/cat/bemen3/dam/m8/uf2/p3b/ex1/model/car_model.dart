// Definició de la classe Car, que representa un cotxe amb diverses propietats
class Car {
  // Atributs de la classe Car
  final String make;   // Marca del cotxe (ex: Toyota, Ford)
  final String model;  // Model del cotxe (ex: Corolla, Mustang)
  final int year;      // Any de fabricació del cotxe
  final String type;   // Tipus de cotxe (ex: sedan, SUV, esportiu)
  final int id;        // Identificador únic del cotxe

  // Constructor de la classe Car, que requereix que totes les propietats siguin passades com a arguments
  Car({
    required this.make,
    required this.model,
    required this.year,
    required this.type,
    required this.id,
  });

  // Mètode de fàbrica per crear un objecte Car a partir d'un Map (per exemple, després de deserialitzar JSON)
  factory Car.fromMap(Map<String, dynamic> json) {
    return Car(
      make: json['make'] ?? '', // Si 'make' no està present, assigna una cadena buida per evitar errors
      model: json['model'] ?? '', // Si 'model' no està present, assigna una cadena buida
      year: json['year'] != null ? json['year'] as int : 0, // Si 'year' és nul, assigna 0 per evitar errors
      type: json['type'] ?? '', // Si 'type' no està present, assigna una cadena buida
      id: json['id'], // No s'especifica un valor per defecte perquè 'id' és un camp crític
    );
  }

  // Mètode per convertir un objecte Car a un Map (per exemple, abans de serialitzar-lo a JSON)
  Map<String, dynamic> toMap() {
    return {
      'make': make,   // Assigna la marca del cotxe al camp 'make'
      'model': model, // Assigna el model del cotxe al camp 'model'
      'year': year,   // Assigna l'any de fabricació al camp 'year'
      'type': type,   // Assigna el tipus de cotxe al camp 'type'
      'id': id,       // Assigna l'identificador del cotxe al camp 'id'
    };
  }
}
