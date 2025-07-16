import 'package:flutter/material.dart'; // Estaba mal escrito "fluter"
import 'package:helloworld/login.dart';

void main() {
  runApp(const JVAdminApp());
}

class JVAdminApp extends StatelessWidget {
  const JVAdminApp({super.key});

  // Debe ser StatelessWidget si no usas estado
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JV ADMIN',
      theme: ThemeData(primaryColor: const Color(0xffe32f22)),
      home: InicioSesion(),
      debugShowCheckedModeBanner: false,
    );
  }
}
