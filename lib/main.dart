import 'package:flutter/material.dart';

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
            _buildMenuItem(context, 'assets/iconoIncendio.png', 'Incendio', () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ScenarioScreen(
                    fondoImage: 'assets/fondo_Incendio.png',
                    overlayImage: 'assets/imagen_de_adentro_Incendio.png',
                    overlayWidth: 95,
                    overlayHeight: 95,
                    overlayPositionX: 0.7,
                    overlayPositionY: 0.55,
                    message:
                        '🎮 Tip de Seguridad: No dejes tu consola de videojuegos conectada y encendida cuando no la estés usando. Puede sobrecalentarse y provocar fallos eléctricos o incluso incendios. Apágala y desconéctala después de jugar para mantenerla en buen estado y evitar riesgos. ¡Cuida tu equipo y tu hogar!',
                  ),
                ),
              );
            }),
            _buildMenuItem(context, 'assets/iconoTerremoto.png', 'Terremoto',
                () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ScenarioScreen(
                    fondoImage: 'assets/fondoTerremoto.png',
                    overlayImage: 'assets/imagen_de_adentro_terremoto.png',
                    overlayWidth: 138, // Tamaño base de la imagen de overlay
                    overlayHeight: 138,
                    overlayPositionX: 0.71, // Centrado en X
                    overlayPositionY: 0.556, // Centrado en Y
                    overlayScale: 3.0, // Escala la imagen 3 veces su tamaño
                    message:
                        '⚠️ Advertencia: Aléjate de las ventanas. Los vidrios pueden romperse y causar lesiones graves. Busca refugio debajo de una mesa sólida o en una zona segura lejos de objetos que puedan caer. ¡Protégete y mantén la calma!',
                  ),
                ),
              );
            }),
            _buildMenuItem(context, 'assets/iconoDerrumbe.png', 'Derrumbe', () {
              _showInDevelopmentMessage(context);
            }),
            _buildMenuItem(context, 'assets/iconoInundacion.png', 'Inundación',
                () {
              _showInDevelopmentMessage(context);
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

  void _showInDevelopmentMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("En desarrollo"),
        content: Text("Esta función está en desarrollo."),
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

class ScenarioScreen extends StatelessWidget {
  final String fondoImage;
  final String overlayImage;
  final double overlayWidth;
  final double overlayHeight;
  final double overlayPositionX;
  final double overlayPositionY;
  final double
      overlayScale; // Nuevo parámetro para la escala de la imagen de overlay
  final String message;

  ScenarioScreen({
    required this.fondoImage,
    required this.overlayImage,
    required this.overlayWidth,
    required this.overlayHeight,
    required this.overlayPositionX,
    required this.overlayPositionY,
    this.overlayScale = 1.0, // Valor predeterminado para la escala
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Escenario"),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              fondoImage,
              fit: BoxFit.cover,
            ),
          ),
          // Posicionamiento específico de la imagen de adentro con escala
          Positioned(
            top: MediaQuery.of(context).size.height * overlayPositionY -
                (overlayHeight * overlayScale / 2),
            left: MediaQuery.of(context).size.width * overlayPositionX -
                (overlayWidth * overlayScale / 2),
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: Text(message),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text("Aceptar"),
                      ),
                    ],
                  ),
                );
              },
              child: Transform.scale(
                scale: overlayScale, // Aplica la escala a la imagen
                child: Image.asset(
                  overlayImage,
                  width: overlayWidth,
                  height: overlayHeight,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
