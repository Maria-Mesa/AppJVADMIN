import 'package:flutter/material.dart';
import 'package:helloworld/dashboard.dart';
import 'package:helloworld/inventario.dart';
import 'package:helloworld/proveedores.dart';
import 'package:helloworld/ventas.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  final List<Widget> pages = <Widget>[
    const DashboardPage(),
    const InventarioPage(),
    const VentasPage(),
    const ProveedoresPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        selectedItemColor: const Color(0xFFDC1F26),
        unselectedItemColor: Colors.grey,
        onTap: (int i) => setState(() => index = i),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Inventario'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Ventas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_shipping),
            label: 'Proveedores',
          ),
        ],
      ),
    );
  }
}
