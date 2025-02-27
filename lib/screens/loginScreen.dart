import 'package:flutter/material.dart';
import 'mainScreen.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool botonActivo = false;

  void comprobarDatos() {
    setState(() {
      botonActivo = usernameController.text.length >= 3 &&
          passwordController.text.length >= 6;
    });
  }

  void login() {
    String username = usernameController.text;
    String password = passwordController.text;

    if (username.length < 3 || password.length < 6) {
      errorDialogo();
    } else {
      usernameController.clear();
      passwordController.clear();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MyHomePage(title: "Inicio"),
        ),
      );
    }
  }

  void errorDialogo() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error"),
          content: const Text(
              "El usuario debe tener al menos 3 caracteres y la contraseña 6."),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("OK"),
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
        title: const Text("Iniciar sesión"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("Iniciar sesión", style: TextStyle(fontSize: 20)),
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(labelText: "Usuario"),
              onChanged: (_) => comprobarDatos(),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: "Contraseña"),
              obscureText: true,
              onChanged: (_) => comprobarDatos(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: login,
              child: const Text("Iniciar"),
            ),
          ],
        ),
      ),
    );
  }
}
