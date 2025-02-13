import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Proyecto Inicial',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 0, 0)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Inicio'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  static const numerosRomanos = [
    "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            )
          ),
        ],
      ),
      endDrawer: Drawer(
        child: Column(
          children: [
            _buildDrawerItem(Icons.favorite, "Favoritos"),
            _buildDrawerItem(Icons.account_box_outlined, "Cuenta de usuario"),
            _buildDrawerItem(Icons.mail, "Notificaciones", "24", ),
            _buildDrawerItem(Icons.bug_report_outlined, "Reportar un bug"),
            
            const Divider(
              color: Color.fromARGB(150, 0, 0, 0),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
            ),
            SizedBox(
              width: double.infinity,
              height: 423,
            ),
            
            Row(
              children: [
                SizedBox(
                  width: 258,
                ),
                IconButton(
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.black,
                    size: 30,
                  ),
                onPressed: () {},
                tooltip: "Salir",
                alignment: AlignmentDirectional.bottomEnd,
                ),
              ]
            ),
          ]
        ),
      ),
      body: Center(
        child: ListView.builder(
          padding: EdgeInsets.all(16.0),
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
                      "${numerosRomanos[index]} Generación",
                      style: const TextStyle(
                        fontFamily: "Times New Roman",
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),

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
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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

  Widget _buildDrawerItem(IconData icon, String title, [String? trailing]) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title, style: const TextStyle(color: Colors.black)),
      trailing: trailing != null ? Text(trailing, style: const TextStyle(color: Colors.black)) : null,
      onTap: () {},
    );
  }
}
