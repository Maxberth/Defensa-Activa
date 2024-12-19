// safety_scenarios.dart
import 'package:flutter/material.dart';

// Export the main classes so they can be imported from other files
export 'safety_scenarios.dart';

class SafetyScenariosModule {
  // Static method to initialize and return the main menu
  static Widget getMainMenu() {
    return MainMenu();
  }

  // Static method to create a scenario screen
  static Widget createScenarioScreen({
    required String fondoImage,
    required String overlayImage,
    required double overlayWidth,
    required double overlayHeight,
    required double overlayPositionX,
    required double overlayPositionY,
    double overlayScale = 1.0,
    required String message,
  }) {
    return ScenarioScreen(
      fondoImage: fondoImage,
      overlayImage: overlayImage,
      overlayWidth: overlayWidth,
      overlayHeight: overlayHeight,
      overlayPositionX: overlayPositionX,
      overlayPositionY: overlayPositionY,
      overlayScale: overlayScale,
      message: message,
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
      body: Container(
        color: Color(0xFF001F3F), // Azul marino
        child: Center(
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            padding: EdgeInsets.all(16),
            children: [
              _buildMenuItem(
                context,
                'assets/iconoIncendio.png',
                'Incendio',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SafetyScenariosModule.createScenarioScreen(
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
                },
              ),
              _buildMenuItem(
                context,
                'assets/iconoTerremoto.png',
                'Terremoto',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SafetyScenariosModule.createScenarioScreen(
                        fondoImage: 'assets/fondoTerremoto.png',
                        overlayImage: 'assets/imagen_de_adentro_terremoto.png',
                        overlayWidth: 138,
                        overlayHeight: 138,
                        overlayPositionX: 0.71,
                        overlayPositionY: 0.556,
                        overlayScale: 3.0,
                        message:
                            '⚠ Advertencia: Aléjate de las ventanas. Los vidrios pueden romperse y causar lesiones graves. Busca refugio debajo de una mesa sólida o en una zona segura lejos de objetos que puedan caer. ¡Protégete y mantén la calma!',
                      ),
                    ),
                  );
                },
              ),
              _buildMenuItem(
                context,
                'assets/iconoDerrumbe.png',
                'Derrumbe',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SafetyScenariosModule.createScenarioScreen(
                        fondoImage: 'assets/fondo_Derrumbe.png',
                        overlayImage: 'assets/imagen_de_adentro_derrumbe.png',
                        overlayWidth: 250,
                        overlayHeight: 250,
                        overlayPositionX: 0.73,
                        overlayPositionY: 0.65,
                        message:
                            '🎮 Tip de Seguridad: "Después de un derrumbe, evita acercarte a vehículos dañados, ya que pueden estar inestables o tener escombros encima. Si estás dentro de un auto atrapado en un derrumbe y no puedes salir, permanece en el vehículo y trata de hacer señales visibles o auditivas para que los equipos de rescate te encuentren."',
                      ),
                    ),
                  );
                },
              ),
              _buildMenuItem(
                context,
                'assets/iconoInundacion.png',
                'Inundación',
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SafetyScenariosModule.createScenarioScreen(
                        fondoImage: 'assets/fondo_inundacion.png',
                        overlayImage: 'assets/imagen_de_adentro_Inundacion.png',
                        overlayWidth: 138,
                        overlayHeight: 137,
                        overlayPositionX: 0.78,
                        overlayPositionY: 0.71,
                        message:
                            '⚠ Consejo: "Si necesitas evacuar en una balsa durante una inundación, asegúrate de llevar chaleco salvavidas y mantener un equilibrio estable para evitar volcaduras. Mantente en áreas de agua más calmada y evita corrientes fuertes o áreas con escombros. Lleva contigo una linterna, un silbato o teléfono móvil para solicitar ayuda en caso necesario."',
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    String iconPath,
    String title,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                iconPath,
                fit: BoxFit.cover,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.7),
                    ],
                    stops: [0.6, 1.0],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 3.0,
                          color: Colors.black,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
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
  final double overlayScale;
  final String message;

  ScenarioScreen({
    required this.fondoImage,
    required this.overlayImage,
    required this.overlayWidth,
    required this.overlayHeight,
    required this.overlayPositionX,
    required this.overlayPositionY,
    this.overlayScale = 1.0,
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
                scale: overlayScale,
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
