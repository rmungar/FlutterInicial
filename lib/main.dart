import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      home: const LoginPage(title: "Iniciar sesión"),
    );
  }
}

/// Página principal con un estado asociado.
/// Muestra una lista de generaciones en números romanos y una barra de navegación inferior.
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /// Lista de números romanos utilizados para representar generaciones.

  final tiendas = [
    "Tienda 1",
    "Tienda 2",
    "Tienda 3",
    "Tienda 4",
    "Tienda 5",
    "Tienda 6",
    "Tienda 7",
    "Tienda 8",
    "Tienda 9"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra de navegación superior con un botón de configuración
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 220, 220, 220),
        title: Text(widget.title),
        actions: <Widget>[
          Builder(
              builder: (context) => IconButton(
                    icon: const Icon(
                      Icons.settings,
                      color: Colors.black,
                      size: 30,
                    ),
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                    tooltip: "Configuración",
                  )),
        ],
      ),
      // Menú lateral derecho (drawer) con diferentes opciones
      endDrawer: Drawer(
        child: Column(
          children: [
            _buildDrawerItem(Icons.favorite, "Favoritos", "5"),
            _buildDrawerItem(Icons.account_box_outlined, "Cuenta de usuario"),
            _buildDrawerItem(
                Icons.shopping_basket_outlined, "Mis Pedidos", "3"),
            _buildDrawerItem(Icons.mail, "Notificaciones", "24"),
            _buildDrawerItem(Icons.bug_report_outlined, "Reportar un bug"),
            const Divider(
              color: Color.fromARGB(150, 0, 0, 0),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
            ),
            // Espaciador para alinear correctamente el botón de salir
            const SizedBox(
              width: double.infinity,
              height: 370,
            ),
            Row(
              children: [
                const SizedBox(width: 258),
                IconButton(
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.black,
                    size: 30,
                  ),
                  onPressed: () {
                    exit(0);
                  },
                  tooltip: "Salir",
                  alignment: AlignmentDirectional.bottomEnd,
                ),
              ],
            ),
          ],
        ),
      ),
      // Cuerpo de la aplicación con una lista de generaciones
      body: Center(
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: 9,
          itemBuilder: (context, index) {
            return Card(
              color: const Color.fromARGB(255, 220, 220, 220),
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16.0),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      tiendas[index],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      // Botón flotante con el logo de la aplicación
      floatingActionButton: SizedBox(
          width: 60,
          height: 60,
          child: FloatingActionButton(
            onPressed: () {},
            shape: const CircleBorder(),
            backgroundColor: const Color.fromARGB(0, 255, 255, 255),
            elevation: 8,
            tooltip: "Inicio",
            child: Image.asset('assets/logo.png', width: 80, height: 80),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // Barra de navegación inferior con opciones de filtrado y búsqueda
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        color: const Color.fromARGB(255, 220, 220, 220),
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.format_list_bulleted_rounded,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {},
              tooltip: "Filtrar",
            ),
            const SizedBox(width: 40),
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {},
              tooltip: "Buscar",
            ),
          ],
        ),
      ),
    );
  }

  /// Construye un elemento del drawer con un icono, un título y un elemento opcional.
  Widget _buildDrawerItem(IconData icon, String title, [String? trailing]) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title, style: const TextStyle(color: Colors.black)),
      trailing: trailing != null
          ? Text(trailing,
              style: const TextStyle(color: Colors.black, fontSize: 16))
          : null,
      onTap: () {},
    );
  }
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
