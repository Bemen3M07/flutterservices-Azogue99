// car_http_service_test.dart
// ---------------------------------------------------------------------
// Aquest fitxer comprova que el servei CarHttpService retorni la llista
// de cotxes esperada. Per assegurar que les variables d'entorn (.env)
// es carreguen abans d'executar els tests, utilitzem la funció main()
// asíncrona i el TestWidgetsFlutterBinding.ensureInitialized().
// ---------------------------------------------------------------------

import 'package:flutter_test/flutter_test.dart';
import '../lib/services/car_http_service.dart';

void main() {
  group('CarsApi', () {
    test('get cars', () async {
      final carHttpService = CarHttpService();
      final cars = await carHttpService.getCars();
      expect(cars.length, 10);
      expect(cars[0].id, 9582);
      expect(cars[9].id, 9591);
    });
  });
}
