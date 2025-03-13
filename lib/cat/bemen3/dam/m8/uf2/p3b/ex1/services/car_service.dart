import 'package:http/http.dart' as http;
import '../model/car_model.dart';
import '../model/convert.dart';

class CarService {
  final String _baseUrl = 'https://car-data.p.rapidapi.com/cars?limit=10&page=0';
  final Map<String, String> _headers = {
    'X-RapidAPI-Key': 'dbf17f441cmshda3ef0377f825ecp1c6b05jsn77ac23c7765a',
    'X-RapidAPI-Host': 'car-data.p.rapidapi.com',
  };

  Future<List<Car>> getCars() async {
    final uri = Uri.parse(_baseUrl);
    final response = await http.get(uri, headers: _headers);

    if (response.statusCode == 200) {
      return carFromJson(response.body);
    } else {
      throw Exception('Error en obtenir la llista de cotxes: ${response.statusCode}');
    }
  }
}

