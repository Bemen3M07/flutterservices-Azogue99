// Importació del servei de cotxes des del paquet especificat
import 'package:empty/cat/bemen3/dam/m8/uf2/p3b/ex1/services/car_service.dart';
// Importació del paquet de proves de Flutter per a realitzar tests unitaris
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Definició d'una prova unitaria
  test('Comprovar si getCars retorna una llista', () async {
    // Creació d'una instància del servei de cotxes
    final service = CarService();

    // Obtenció de la llista de cotxes mitjançant el mètode getCars
    final cars = await service.getCars();

    // Comprovació que la llista de cotxes no està buida
    expect(cars.isNotEmpty, true, reason: 'La llista de cotxes hauria de contenir elements');

    // Comprovació que la llista té exactament 10 elements
    expect(cars.length, 10);

    // Verificació de l'identificador del primer cotxe de la llista
    expect(cars[0].id, equals(9582));

    // Verificació de l'identificador de l'últim cotxe de la llista
    expect(cars[9].id, equals(9591));
  });
}
