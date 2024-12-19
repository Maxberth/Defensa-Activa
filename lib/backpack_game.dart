import 'package:flutter/material.dart';

class BackpackItem {
  final String name;
  final String imagePath;
  final double weight;
  final int utility;
  bool isSelected;

  BackpackItem({
    required this.name,
    required this.imagePath,
    required this.weight,
    required this.utility,
    this.isSelected = false,
  });
}

class BackpackGame extends StatefulWidget {
  @override
  _BackpackGameState createState() => _BackpackGameState();
}

class _BackpackGameState extends State<BackpackGame> {
  final double maxBackpackWeight = 10.0; // 10 kg max capacity
  double currentWeight = 0.0;
  int currentScore = 0;

  // List of available items
  late List<BackpackItem> items;

  @override
  void initState() {
    super.initState();
    // Initialize items with their properties
    items = [
      BackpackItem(
        name: 'Alcohol',
        imagePath: 'assets/alcohol.png',
        weight: 0.5,
        utility: 7,
      ),
      BackpackItem(
        name: 'Atun',
        imagePath: 'assets/atun.png',
        weight: 0.3,
        utility: 8,
      ),
      BackpackItem(
        name: 'Botella de Agua',
        imagePath: 'assets/botella_agua.png',
        weight: 1.0,
        utility: 9,
      ),
      BackpackItem(
        name: 'Consola',
        imagePath: 'assets/consola.png',
        weight: 2.0,
        utility: 5,
      ),
      BackpackItem(
        name: 'Gaseosa',
        imagePath: 'assets/gaseosa.png',
        weight: 0.7,
        utility: 3,
      ),
      BackpackItem(
        name: 'Linterna',
        imagePath: 'assets/linterna.png',
        weight: 4,
        utility: 8,
      ),
      BackpackItem(
        name: 'Manta',
        imagePath: 'assets/manta.png',
        weight: 1.5,
        utility: 9,
      ),
      BackpackItem(
        name: 'Perfume',
        imagePath: 'assets/perfume.png',
        weight: 0.2,
        utility: 2,
      ),
    ];
  }

  void _toggleItemSelection(BackpackItem item) {
    setState(() {
      if (item.isSelected) {
        item.isSelected = false;
        currentWeight -= item.weight;
        currentScore -= item.utility;
      } else if (currentWeight + item.weight <= maxBackpackWeight) {
        item.isSelected = true;
        currentWeight += item.weight;
        currentScore += item.utility;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('¡No puedes agregar más peso a la mochila!'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    });
  }

  void _resetGame() {
    setState(() {
      for (var item in items) {
        item.isSelected = false;
      }
      currentWeight = 0.0;
      currentScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kit de Emergencia'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetGame,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Backpack and Stats Section (50% of the screen)
            Container(
              height: MediaQuery.of(context).size.height / 2,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/mochila.png',
                    fit: BoxFit.contain,
                  ),
                  Positioned(
                    top: 20,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            // Texto con borde negro
                            Text(
                              'Peso: ${currentWeight.toStringAsFixed(1)} / $maxBackpackWeight kg',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 4 // Grosor del borde
                                  ..color = Colors.black, // Color del borde
                              ),
                            ),
                            // Texto blanco superpuesto
                            Text(
                              'Peso: ${currentWeight.toStringAsFixed(1)} / $maxBackpackWeight kg',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white, // Color del interior
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          children: [
                            // Texto con borde negro
                            Text(
                              'Puntaje: $currentScore',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 4 // Grosor del borde
                                  ..color = Colors.black, // Color del borde
                              ),
                            ),
                            // Texto blanco superpuesto
                            Text(
                              'Puntaje: $currentScore',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white, // Color del interior
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Items Grid (50% of the screen) with 3 columns
            GridView.builder(
              shrinkWrap: true,
              physics:
                  NeverScrollableScrollPhysics(), // Disable internal scroll for GridView
              padding: EdgeInsets.all(8), // Reduce padding for the grid
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Three items per row
                crossAxisSpacing: 8, // Reduce space between items
                mainAxisSpacing: 8, // Reduce space between rows
                childAspectRatio:
                    0.8, // Adjust the aspect ratio to make items more compact
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                BackpackItem item = items[index];
                return GestureDetector(
                  onTap: () => _toggleItemSelection(item),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: item.isSelected ? Colors.green : Colors.grey,
                        width: item.isSelected ? 3 : 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          // Makes sure the image resizes properly
                          child: Image.asset(
                            item.imagePath,
                            width: 60,
                            height: 60,
                          ),
                        ),
                        Text(
                          item.name,
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          '${item.weight} kg',
                          style: TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                        Text(
                          'Util: ${item.utility}',
                          style: TextStyle(fontSize: 10, color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
