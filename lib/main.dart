import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/loginScreen.dart';
import 'screens/mainScreen.dart';

void main() {
  runApp(const MyApp());
}

/// Clase principal de la aplicación.
/// Inicializa la aplicación y establece la orientación preferida en vertical.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Restringe la orientación del dispositivo a solo vertical
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Proyecto Inicial',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 255, 0, 0)),
        useMaterial3: true,
      ),
      routes: {
        "/login": (context) => const LoginPage(title: "Iniciar sesión"),
        "/home": (context) => const MyHomePage(title: "Inicio"),
      },
      initialRoute: "/login",
      home: const LoginPage(title: "Iniciar sesión"),
    );
  }
}

