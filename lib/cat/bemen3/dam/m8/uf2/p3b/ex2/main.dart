import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:empty/cat/bemen3/dam/m8/uf2/p3b/ex2/providers/counter_provider.dart';
import 'package:empty/cat/bemen3/dam/m8/uf2/p3b/ex2/screens/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CounterProvider(), // Crea una instància de CounterProvider i la proporciona a l'aplicació
      child: const MyApp(), // Inicialitza l'aplicació
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Oculta la bandera de mode de depuració
      title: 'Provider Counter', // Títol de l'aplicació
      theme: ThemeData(
        primarySwatch: Colors.purple, // Defineix el color principal de l'aplicació
      ),
      home: const HomeScreen(), // Estableix HomeScreen com a pantalla principal de l'aplicació
    );
  }
}
