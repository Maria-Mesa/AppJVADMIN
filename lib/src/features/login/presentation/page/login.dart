import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jvadmin/src/core/constants/constants.dart';
import 'package:jvadmin/src/core/shared/auth/auth_button.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,

      body: ListView(
        padding: Constants.contentPadding,
        children: <Widget>[
          Column(
            children: <Widget>[
              Image.asset('assets/images/logo.png', height: 240),
              const Text(
                'JV ADMIN',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Text(
                'Administra tu óptica de forma fácil y segura',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 30),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: Constants.contentPadding,
                  child: Column(
                    children: <Widget>[
                      const Text(
                        'Iniciar Sesión',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: 'Correo electrónico',
                        ),
                      ),
                      const SizedBox(height: 15),
                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Contraseña',
                        ),
                      ),
                      const SizedBox(height: 20),
                      AuthButton(
                        label: 'Iniciar Sesión',
                        onTap: () {
                          context.push('/home');
                        },
                      ),
                      TextButton(
                        onPressed: () {
                          context.push('/signup');
                        },
                        child: const Text('¿No tienes cuenta? Regístrate aquí'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
