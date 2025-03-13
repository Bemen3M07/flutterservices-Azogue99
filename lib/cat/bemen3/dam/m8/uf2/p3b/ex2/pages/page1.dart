import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:empty/cat/bemen3/dam/m8/uf2/p3b/ex2/providers/counter_provider.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          // Mostra el valor actual del comptador amb un estil de text gran
          Text(
            context.watch<CounterProvider>().counter.toString(), 
            style: const TextStyle(fontSize: 50),
          ), 
          // Botó per incrementar el comptador
          ElevatedButton(
            onPressed: () {
              context.read<CounterProvider>().increment(); // Crida la funció increment() del provider
            }, 
            child: const Text('Sumar'), // Etiqueta del botó
          ),
        ],
      ),
    );
  }
}
