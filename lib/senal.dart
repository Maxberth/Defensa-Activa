import 'package:flutter/material.dart';
import 'dart:math';

class SenalPage extends StatefulWidget {
  @override
  _SenalPageState createState() => _SenalPageState();
}

class _SenalPageState extends State<SenalPage> {
  final List<Map<String, String>> signalData = [
    {
      'image': 'assets/equipo_de_primeros_auxilios.png',
      'word': 'equipo de primeros auxilios'
    },
    {'image': 'assets/desfibrilador.png', 'word': 'desfibrilador'},
    {
      'image': 'assets/salida_emergencia_deslizar.png',
      'word': 'salida emergencia deslizar'
    },
    {'image': 'assets/romper_para_pasar.png', 'word': 'romper para pasar'},
    {'image': 'assets/peligro_incendio.png', 'word': 'peligro incendio'},
    {'image': 'assets/peligro_radiacion.png', 'word': 'peligro radiacion'},
    {
      'image': 'assets/peligro_intoxicacion.png',
      'word': 'peligro intoxicacion'
    },
    {
      'image': 'assets/peligro_alta_temperatura.png',
      'word': 'peligro alta temperatura'
    },
    {
      'image': 'assets/peligro_baja_temperatura.png',
      'word': 'peligro baja temperatura'
    },
  ];

  int currentLevel = 0;
  String displayedWord = "";
  String hiddenWord = "";
  List<int> revealedIndices = [];

  @override
  void initState() {
    super.initState();
    initializeLevel();
  }

  void initializeLevel() {
    String word = signalData[currentLevel]['word']!;
    List<int> randomIndices = [];
    while (randomIndices.length < 3) {
      int randomIndex = Random().nextInt(word.replaceAll(" ", "").length);
      if (!randomIndices.contains(randomIndex)) {
        randomIndices.add(randomIndex);
      }
    }

    String tempHiddenWord = "";
    int charCount = 0;
    for (int i = 0; i < word.length; i++) {
      if (word[i] == ' ') {
        tempHiddenWord += ' ';
      } else if (randomIndices.contains(charCount)) {
        tempHiddenWord += word[i];
        revealedIndices.add(i);
      } else {
        tempHiddenWord += '_';
      }
      charCount += word[i] != ' ' ? 1 : 0;
    }

    setState(() {
      displayedWord = tempHiddenWord;
      hiddenWord = word;
    });
  }

  void revealLetter() {
    for (int i = 0; i < hiddenWord.length; i++) {
      if (!revealedIndices.contains(i) && hiddenWord[i] != ' ') {
        setState(() {
          displayedWord = displayedWord.substring(0, i) +
              hiddenWord[i] +
              displayedWord.substring(i + 1);
          revealedIndices.add(i);
        });
        break;
      }
    }
  }

  void checkAnswer(String userInput) {
    if (userInput.toLowerCase() == hiddenWord.toLowerCase()) {
      if (currentLevel < signalData.length - 1) {
        setState(() {
          currentLevel++;
          revealedIndices.clear();
          initializeLevel();
        });
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("¡Felicidades!"),
            content: Text("Has completado todos los niveles."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                child: Text("Salir"),
              ),
            ],
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Respuesta incorrecta, inténtalo de nuevo.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nivel ${currentLevel + 1}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Center(
              child: Image.asset(
                signalData[currentLevel]['image']!,
                height: MediaQuery.of(context).size.height * 0.4,
              ),
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () async {
                TextEditingController controller = TextEditingController();
                await showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Adivina la palabra"),
                    content: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                          hintText: "Escribe tu respuesta aquí"),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(controller.text);
                        },
                        child: Text("Aceptar"),
                      ),
                    ],
                  ),
                ).then((result) {
                  if (result != null) {
                    checkAnswer(result);
                  }
                });
              },
              child: Text(
                displayedWord,
                style: TextStyle(fontSize: 24, letterSpacing: 2),
                textAlign: TextAlign.center,
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: revealLetter,
              child: Text("Ayuda: Revelar una letra"),
            ),
          ],
        ),
      ),
    );
  }
}
