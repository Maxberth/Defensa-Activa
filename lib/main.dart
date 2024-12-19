import 'package:flutter/material.dart';
import 'safety_scenarios.dart';
import 'backpack_game.dart';
import 'minijuego.dart';
import 'senal.dart';

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
      appBar: AppBar(), // AppBar sin título
      backgroundColor: Color(0xFF000080), // Navy blue background
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.orange,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(40),
                    child: Center(
                      child: Text(
                        "Hola, \nciudadano",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Image.asset(
                      'assets/personaMain.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: [
                  _buildMenuCard(
                    context,
                    'assets/Busqueda.png',
                    'Encuentra',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SafetyScenariosModule.getMainMenu(),
                        ),
                      );
                    },
                  ),
                  _buildMenuCard(
                    context,
                    'assets/kitgame.png',
                    'MochiEmergencia',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BackpackGame(),
                        ),
                      );
                    },
                  ),
                  _buildMenuCard(
                    context,
                    'assets/tercerminijuego.png',
                    'Quien llamamos?',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Minijuego()),
                      );
                    },
                  ),
                  _buildMenuCard(
                    context,
                    'assets/cuartominijuego.png',
                    'SeñaLetra',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SenalPage()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuCard(
    BuildContext context,
    String iconPath,
    String title,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconPath,
              width: 80,
              height: 80,
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
