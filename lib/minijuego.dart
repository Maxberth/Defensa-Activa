import 'package:flutter/material.dart';

class Minijuego extends StatelessWidget {
  const Minijuego({super.key});

  @override
  Widget build(BuildContext context) {
    return Nivel1();
  }
}

class Nivel1 extends StatelessWidget {
  const Nivel1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nivel 1'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Image.asset('assets/caso_incendio.png', fit: BoxFit.cover),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.green,
              alignment: Alignment.center,
              child: const Text(
                '¿A quién deberíamos llamar?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                _buildRoleOption(
                    context, 'assets/rol_doctor.png', Nivel1RespuestaDoctor()),
                _buildRoleOption(context, 'assets/rol_policia.png',
                    Nivel1RespuestaPolicia()),
                _buildRoleOption(context, 'assets/rol_bombero.png',
                    Nivel1RespuestaBombero()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRoleOption(
      BuildContext context, String assetPath, Widget respuestaScreen) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => respuestaScreen),
          );
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          height: double.infinity,
          child: AspectRatio(
            aspectRatio: 1 / 2, // Ajusta esto para hacer la imagen más alta
            child: Image.asset(
              assetPath,
              fit: BoxFit.fill,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        ),
      ),
    );
  }
}

// Las clases de respuesta permanecen iguales
class Nivel1RespuestaDoctor extends StatelessWidget {
  const Nivel1RespuestaDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Respuesta: Doctor'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child:
                Image.asset('assets/respuesta_doctor.png', fit: BoxFit.cover),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.red,
              alignment: Alignment.center,
              child: const Text(
                'INCORRECTO\nEllos brindan asistencia médica en casos de accidentes, enfermedades graves o lesiones. Pero para apagar incendios no son los adecuados.',
                style: TextStyle(color: Colors.white, fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
          ),
        ],
      ),
    );
  }
}

class Nivel1RespuestaPolicia extends StatelessWidget {
  const Nivel1RespuestaPolicia({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Respuesta: Policía'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child:
                Image.asset('assets/respuesta_policia.png', fit: BoxFit.cover),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.red,
              alignment: Alignment.center,
              child: const Text(
                'INCORRECTO\nEllos ayudan a proteger a las personas y controlar las calles, pero para apagar un incendio no son muy buenos.',
                style: TextStyle(color: Colors.white, fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
          ),
        ],
      ),
    );
  }
}

class Nivel1RespuestaBombero extends StatelessWidget {
  const Nivel1RespuestaBombero({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Respuesta: Bombero'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child:
                Image.asset('assets/respuesta_bombero.png', fit: BoxFit.cover),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.green,
              alignment: Alignment.center,
              child: const Text(
                'CORRECTO\nEllos están entrenados para apagar incendios, rescatar personas atrapadas y controlar situaciones relacionadas con fuego.',
                style: TextStyle(color: Colors.white, fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
          ),
        ],
      ),
    );
  }
}
