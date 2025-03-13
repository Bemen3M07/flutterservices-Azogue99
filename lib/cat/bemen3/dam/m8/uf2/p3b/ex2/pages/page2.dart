import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:empty/cat/bemen3/dam/m8/uf2/p3b/ex2/providers/counter_provider.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
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
