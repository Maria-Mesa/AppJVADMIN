import 'package:flutter/material.dart';
import 'package:helloworld/dashboard.dart';
import 'package:helloworld/inventario.dart';
import 'package:helloworld/proveedores.dart';
import 'package:helloworld/ventas.dart';

class PantallaPrincipal extends StatefulWidget {
  const PantallaPrincipal({super.key});

  @override
  _PantallaPrincipalState createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
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
