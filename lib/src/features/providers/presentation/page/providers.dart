import 'package:flutter/material.dart';

class Providers extends StatefulWidget {
  const Providers({super.key});

  @override
  State<Providers> createState() => _ProvidersState();
}

class _ProvidersState extends State<Providers> {
  List<String> providers = <String>[];

  void eliminarProveedor(int index) {
    setState(() {
      providers.removeAt(index);
    });
  }

  void agregarProveedor() {
    setState(() {
      providers.add('Proveedor ${providers.length + 1}');
    });
  }

  void editarProveedor(int index) {
    TextEditingController controller = TextEditingController(
      text: providers[index],
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
                providers[index] = controller.text;
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
      body: ListView.builder(
        itemCount: providers.length,
        itemBuilder: (BuildContext context, int index) => ListTile(
          title: Text(providers[index]),
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
