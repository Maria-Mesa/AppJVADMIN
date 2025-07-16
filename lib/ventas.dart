import 'package:flutter/material.dart';

class VentasPage extends StatefulWidget {
  const VentasPage({super.key});

  @override
  _VentasPageState createState() => _VentasPageState();
}

class _VentasPageState extends State<VentasPage> {
  List<String> ventas = <String>[];

  void eliminarVenta(int index) {
    setState(() {
      ventas.removeAt(index);
    });
  }

  void agregarVenta() {
    setState(() {
      ventas.add('Venta nueva ${ventas.length + 1}');
    });
  }

  void editarVenta(int index) {
    TextEditingController controller = TextEditingController(
      text: ventas[index],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Editar nombre de venta'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(labelText: 'Nombre'),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancelar'),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton(
            child: const Text('Guardar'),
            onPressed: () {
              setState(() {
                ventas[index] = controller.text;
              });
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ventas Registradas'),
        backgroundColor: const Color(0xFFDC1F26),
      ),
      body: ListView.builder(
        itemCount: ventas.length,
        itemBuilder: (BuildContext context, int index) => ListTile(
          title: Text(ventas[index]),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () => editarVenta(index),
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => eliminarVenta(index),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: agregarVenta,
        backgroundColor: const Color(0xFFDC1F26),
        child: const Icon(Icons.add),
      ),
    );
  }
}
