import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  int _counter = 0; // Variable privada que emmagatzema el valor del comptador

  int get counter => _counter; // Getter per obtenir el valor actual del comptador

  void increment() {
    _counter++; // Incrementa el valor del comptador en 1
    notifyListeners(); // Notifica als oients (widgets que utilitzen aquest provider) sobre el canvi de valor
  }
}
