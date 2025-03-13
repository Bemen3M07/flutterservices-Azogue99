// car_http_service.dart


import 'package:empty/cat/bemen3/dam/m8/uf2/p3b/ex3/car_model.dart';
import 'package:http/http.dart' as http;

class CarHttpService {
  Future<List<CarsModel>> getCars() async {
    var uri = Uri.parse("https://car-data.p.rapidapi.com/cars?limit=10&page=0");

    var response = await http.get(
      uri,
      headers: {
        "x-rapidapi-host": "car-data.p.rapidapi.com",
        "x-rapidapi-key": "ef4fc7393fmsh3067378fdbee87dp178848jsn284eb71a8575",
      },
    );

    if (response.statusCode == 200) {
      return carsModelFromJson(response.body);
    } else {
      throw ("Error al obtener la lista de coches: ${response.statusCode}");
    }
  }
}
