import 'package:flutter/material.dart';

class ProveedoresPage extends StatefulWidget {
  const ProveedoresPage({super.key});

  @override
  State<ProveedoresPage> createState() => _ProveedoresPageState();
}

class _ProveedoresPageState extends State<ProveedoresPage> {
  List<String> proveedores = <String>[];

  void eliminarProveedor(int index) {
    setState(() {
      proveedores.removeAt(index);
    });
  }

  void agregarProveedor() {
    setState(() {
      proveedores.add('Proveedor ${proveedores.length + 1}');
    });
  }

  void editarProveedor(int index) {
    TextEditingController controller = TextEditingController(
      text: proveedores[index],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Editar proveedor'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(labelText: 'Nombre del proveedor'),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                proveedores[index] = controller.text;
              });
              Navigator.pop(context);
            },
            child: const Text('Guardar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Proveedores'),
        backgroundColor: const Color(0xFFDC1F26),
      ),
      body: ListView.builder(
        itemCount: proveedores.length,
        itemBuilder: (BuildContext context, int index) => ListTile(
          title: Text(proveedores[index]),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () => editarProveedor(index),
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => eliminarProveedor(index),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: agregarProveedor,
        backgroundColor: const Color(0xFFDC1F26),
        child: const Icon(Icons.add),
      ),
    );
  }
}
