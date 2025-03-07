// services/car_http_service.dart
// ---------------------------------------------------------------------
// Classe que gestiona la crida HTTP a l'endpoint de Car Data.
// ---------------------------------------------------------------------

import 'package:http/http.dart' as http;
import '../models/car_model.dart';

class CarHttpService {
  // Credencials "hardcoded"
  final String _apiKey = "ef4fc7393fmsh3067378fdbee87dp178848jsn284eb71a8575";
  final String _apiHost = "car-data.p.rapidapi.com";

  // Domini i endpoint
  final String _baseDomain = "car-data.p.rapidapi.com";
  final String _endpoint = "/cars";

  /// Obté la llista de cotxes de manera dinàmica, permetent especificar el
  /// límit i la pàgina de la consulta.
  Future<List<Car>> getCars({int limit = 10, int page = 0}) async {
    // Construeix la URI de manera dinàmica amb els paràmetres de consulta
    final Uri uri = Uri.https(_baseDomain, _endpoint, {
      'limit': limit.toString(),
      'page': page.toString(),
    });

    // Realitza la petició GET amb els headers requerits
    final response = await http.get(
      uri,
      headers: {
        "x-rapidapi-key": _apiKey,
        "x-rapidapi-host": _apiHost,
      },
    );

    // Comprova l'estat de la resposta i converteix el JSON en objectes Car
    if (response.statusCode == 200) {
      return carsFromJson(response.body);
    } else {
      throw Exception(
          "Error en obtenir les dades dels cotxes: ${response.statusCode}");
    }
  }
}
