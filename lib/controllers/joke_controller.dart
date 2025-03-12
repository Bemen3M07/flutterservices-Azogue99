// controllers/joke_controller.dart

import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import '../models/joke_model.dart';

/// Controlador que gestiona la recuperació dels acudits
/// des de l'API i selecciona-ne un de manera aleatòria.
class JokeController {
  // URL de l'API que proporciona els acudits.
  final String apiUrl = 'https://api.sampleapis.com/jokes/goodJokes';

  /// Recupera la llista d'acudits de l'API i retorna un [Joke] aleatori.
  Future<Joke> fetchRandomJoke() async {
    // Realitza una crida GET a l'API.
    final response = await http.get(Uri.parse(apiUrl));

    // Si la resposta és correcta, decodifica el JSON.
    if (response.statusCode == 200) {
      List<dynamic> jokesJson = jsonDecode(response.body);
      // Selecciona un índex aleatori de la llista.
      final randomIndex = Random().nextInt(jokesJson.length);
      // Retorna l'acudit seleccionat convertit al model [Joke].
      return Joke.fromJson(jokesJson[randomIndex]);
    } else {
      // En cas d'error, llença una excepció.
      throw Exception('Error en carregar l\'acudit');
    }
  }
}
