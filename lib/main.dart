// main.dart

import 'package:flutter/material.dart';
import 'controllers/joke_controller.dart';
import 'models/joke_model.dart';

void main() {
  runApp(MyApp());
}

/// Widget arrel de l'aplicació.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Acudits',
      home: JokePage(),
    );
  }
}

/// Widget de la pàgina principal que mostra un acudit.
class JokePage extends StatefulWidget {
  @override
  _JokePageState createState() => _JokePageState();
}

class _JokePageState extends State<JokePage> {
  // Instància del controlador.
  final JokeController _jokeController = JokeController();

  // Future que contindrà l'acudit actual.
  Future<Joke>? _jokeFuture;

  @override
  void initState() {
    super.initState();
    // Carrega l'acudit inicial.
    _loadJoke();
  }

  /// Funció que demana al controlador un acudit nou.
  void _loadJoke() {
    setState(() {
      _jokeFuture = _jokeController.fetchRandomJoke();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acudits'),
      ),
      body: Center(
        // Utilitzem FutureBuilder per a gestionar l'estat de la petició.
        child: FutureBuilder<Joke>(
          future: _jokeFuture,
          builder: (context, snapshot) {
            // Mentre s'espera la resposta mostrem un indicador de càrrega.
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              // En cas d'error, mostrem el missatge corresponent.
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              // Quan hi ha dades, mostrem l'acudit (setup i punchline).
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      snapshot.data!.setup,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 20),
                    Text(
                      snapshot.data!.punchline,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
            }
            return Text('No s\'ha trobat cap acudit.');
          },
        ),
      ),
      // Botó flotant que en carregarà un de nou quan es premi.
      floatingActionButton: FloatingActionButton(
        onPressed: _loadJoke,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
