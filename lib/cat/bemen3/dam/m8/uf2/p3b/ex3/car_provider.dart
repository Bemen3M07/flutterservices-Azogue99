// car_provider.dart

import 'package:flutter/material.dart';
import 'car_model.dart';
import 'car_http_service.dart';

class CarProvider extends ChangeNotifier {
  final CarHttpService _carHttpService = CarHttpService(); // Instancia del servicio HTTP
  List<CarsModel> _cars = []; // Lista donde almacenamos los coches obtenidos
  bool _isLoading = false; // Indicador de carga

  List<CarsModel> get cars => _cars; // Getter para la lista de coches
  bool get isLoading => _isLoading; // Getter para el estado de carga

  Future<void> fetchCars() async {
    _isLoading = true;
    notifyListeners(); // Notificamos a los listeners que la UI debe actualizarse

    try {
      _cars = await _carHttpService.getCars(); // Llamamos al servicio que obtiene los coches
    } catch (e) {
      print("Error al obtener los datos: $e");
    }

    _isLoading = false;
    notifyListeners(); // Volvemos a notificar a los listeners tras la carga
  }
}