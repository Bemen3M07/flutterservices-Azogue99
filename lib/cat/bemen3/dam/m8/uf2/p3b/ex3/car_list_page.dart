// car_list_page.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'car_provider.dart';
import 'car_detail_page.dart'; // Import the detail page

class CarListPage extends StatelessWidget {
  const CarListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final carProvider = Provider.of<CarProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Lista de Coches")),
      body: carProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: carProvider.cars.length,
              itemBuilder: (context, index) {
                final car = carProvider.cars[index];
                return ListTile(
                  title: Text("${car.make} ${car.model}"),
                  subtitle: Text("Año: ${car.year} | Tipo: ${car.type}"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CarDetailPage(car: car),
                      ),
                    );
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          carProvider.fetchCars();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
