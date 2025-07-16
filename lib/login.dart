import 'package:flutter/material.dart';
import 'package:helloworld/pantallaprincipal.dart';
import 'package:helloworld/registro.dart';

class InicioSesion extends StatelessWidget {
  final TextEditingController correoController = TextEditingController();
  final TextEditingController contrasenaController = TextEditingController();

  InicioSesion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDC1F26),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 70.0),
        children: <Widget>[
          Column(
            children: <Widget>[
              const Icon(Icons.person, size: 65, color: Colors.brown),
              const SizedBox(height: 25),
              const Text(
                'JV ADMIN',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffd9bfb6),
                ),
              ),
              const Text(
                'Administra tu óptica de forma fácil y segura',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: <Widget>[
                    const Text(
                      'Iniciar Sesión',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: correoController,
                      decoration: const InputDecoration(
                        labelText: 'Correo electrónico',
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      controller: contrasenaController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Contraseña',
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const PantallaPrincipal(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffe5aaa6),
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text('Iniciar Sesión'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => Registro()),
                        );
                      },
                      child: const Text('¿No tienes cuenta? Regístrate aquí'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
