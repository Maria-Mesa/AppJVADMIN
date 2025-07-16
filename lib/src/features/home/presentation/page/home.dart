import 'package:flutter/material.dart';
import 'package:helloworld/inventario.dart';
import 'package:helloworld/proveedores.dart';
import 'package:helloworld/src/features/accounting/presentation/page/accounting_page.dart';
import 'package:helloworld/src/features/dashboard/presentation/page/dashboard.dart';
import 'package:helloworld/ventas.dart';
import 'package:hugeicons/hugeicons.dart';

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
    const AccountingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFFDC1F26),
        unselectedItemColor: Colors.grey,
        onTap: (int i) => setState(() => index = i),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(HugeIcons.strokeRoundedHome02),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Inventario'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Ventas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_shipping),
            label: 'Proveedores',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Contabilidad',
          ),
        ],
      ),
    );
  }
}
