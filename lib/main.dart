import 'package:flutter/material.dart';
import 'safety_scenarios.dart'; // Existing safety scenarios module
import 'backpack_game.dart'; // New backpack game module

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainMenu(),
    );
  }
}

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menú Principal"),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          padding: EdgeInsets.all(16),
          children: [
            _buildMenuItem(context, 'assets/Busqueda.png', 'BUSQUEDA', () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SafetyScenariosModule.getMainMenu(),
                ),
              );
            }),
            _buildMenuItem(context, 'assets/kitgame.png', 'KITGAME', () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BackpackGame(),
                ),
              );
            }),
            _buildMenuItem(context, 'assets/tercerminijuego.png', '3MINIJUEGO',
                () {
              _showInDevelopmentMessage(context, '3MINIJUEGO');
            }),
            _buildMenuItem(context, 'assets/cuartominijuego.png', '4MINIJUEGO',
                () {
              _showInDevelopmentMessage(context, '4MINIJUEGO');
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(
      BuildContext context, String iconPath, String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            iconPath,
            width: 100,
            height: 100,
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  void _showInDevelopmentMessage(BuildContext context, String featureName) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("En desarrollo"),
        content: Text("La función '$featureName' está en desarrollo."),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("Aceptar"),
          ),
        ],
      ),
    );
  }
}
