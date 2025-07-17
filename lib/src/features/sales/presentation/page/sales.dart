import 'package:flutter/material.dart';

class Sales extends StatefulWidget {
  const Sales({super.key});

  @override
  State<Sales> createState() => _SalesState();
}

class _SalesState extends State<Sales> {
  List<String> sales = <String>[];

  void eliminarVenta(int index) {
    setState(() {
      sales.removeAt(index);
    });
  }

  void agregarVenta() {
    setState(() {
      sales.add('Venta nueva ${sales.length + 1}');
    });
  }

  void editarVenta(int index) {
    TextEditingController controller = TextEditingController(
      text: sales[index],
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
                sales[index] = controller.text;
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
      body: ListView.builder(
        itemCount: sales.length,
        itemBuilder: (BuildContext context, int index) => ListTile(
          title: Text(sales[index]),
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
