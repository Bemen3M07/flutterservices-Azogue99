// car_detail_page.dart

import 'package:flutter/material.dart';
import 'car_model.dart';

class CarDetailPage extends StatelessWidget {
  final CarsModel car;

  const CarDetailPage({Key? key, required this.car}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${car.make} ${car.model}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Make: ${car.make}', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text('Model: ${car.model}', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text('Year: ${car.year}', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text('Type: ${car.type}', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}
