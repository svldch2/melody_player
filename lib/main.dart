import 'package:flutter/material.dart';
import 'package:melody_player/screens/main_screen.dart';

void main() {
  runApp(const MelodyPlayer());
}

class MelodyPlayer extends StatelessWidget {
  const MelodyPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Melody Player',
      theme: ThemeData(
        // Цветовая схема в стиле музыкального плеера
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}
