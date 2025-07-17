import 'package:flutter/material.dart';


class Inventory extends StatefulWidget {
  const Inventory({super.key});

  @override
  State<Inventory> createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  List<String> productos = <String>[
    'Montura Ray-Ban',
    'Lente Blue Light',
    'Montura Oakley',
  ];

  void eliminarProducto(int index) {
    setState(() {
      productos.removeAt(index);
    });
  }

  void agregarProducto() {
    setState(() {
      productos.add('Nuevo Producto ${productos.length + 1}');
    });
  }

  void editarProducto(int index) {
    TextEditingController controller = TextEditingController(
      text: productos[index],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Editar producto'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Nombre del producto'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  productos[index] = controller.text;
                });
                Navigator.of(context).pop(); // Cierra el diálogo
              },
              child: const Text('Guardar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventario'),
        backgroundColor: const Color(0xFFDC1F26),
      ),
      body: ListView.builder(
        itemCount: productos.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(productos[index]),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  onPressed: () => editarProducto(index),
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => eliminarProducto(index),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFDC1F26),
        onPressed: agregarProducto,
        child: const Icon(Icons.add),
      ),
    );
  }
}
