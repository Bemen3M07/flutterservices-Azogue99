import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:empty/cat/bemen3/dam/m8/uf2/p3b/ex2/providers/counter_provider.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Center(
      // Mostra el valor actual del comptador en un text gran
      child: Text(
        context.watch<CounterProvider>().counter.toString(), // Obté el valor del comptador del provider
        style: const TextStyle(fontSize: 50), // Defineix una mida de font gran
      ),
    );
  }
}
