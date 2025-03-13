import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:empty/cat/bemen3/dam/m8/uf2/p3b/ex2/pages/page1.dart';
import 'package:empty/cat/bemen3/dam/m8/uf2/p3b/ex2/pages/page2.dart';
import 'package:empty/cat/bemen3/dam/m8/uf2/p3b/ex2/pages/page3.dart';
import 'package:empty/cat/bemen3/dam/m8/uf2/p3b/ex2/providers/counter_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Índex de la pàgina seleccionada al BottomNavigationBar

  // Llista de pàgines que es mostraran en funció de l'índex seleccionat
  final List<Widget> _pages = <Widget>[
    const Page1(),
    const Page2(),
    const Page3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'), // Títol de l'AppBar
        actions: [
          // Mostra el valor actual del comptador a la barra d'aplicació
          TextButton(
            onPressed: null, 
            child: Text(
              context.watch<CounterProvider>().counter.toString(), // Obté el valor del comptador del provider
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      body: _pages[_selectedIndex], // Mostra la pàgina corresponent segons l'índex seleccionat
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Defineix l'índex actual seleccionat
        onTap: (int index) {
          setState(() {
            _selectedIndex = index; // Canvia l'índex quan es prem un element de la barra de navegació
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // Icona de la primera pàgina
            label: 'Page 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business), // Icona de la segona pàgina
            label: 'Page 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school), // Icona de la tercera pàgina
            label: 'Page 3',
          ),
        ],
      ),
    );
  }
}
