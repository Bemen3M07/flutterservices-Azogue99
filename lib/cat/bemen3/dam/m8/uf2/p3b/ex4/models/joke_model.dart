// models/joke_model.dart

/// Model que representa un acudit.
/// Es basa en la resposta de l’API, assumint que cada acudit té un 'id'
/// i un camp 'joke' que conté el text de l'acudit.
class Joke {
  final int id;
  final String setup;
  final String punchline;

  Joke({required this.id, required this.setup, required this.punchline});

  /// Crea un objecte [Joke] a partir d'un JSON.
  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(
      id: json['id'],
      setup: json['setup'],
      punchline: json['punchline'],
    );
  }
}
