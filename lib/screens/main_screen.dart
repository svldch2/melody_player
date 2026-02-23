import 'package:flutter/material.dart';
import '../models/song.dart';
import '../widgets/song_tile.dart';
import 'player_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Получаем демо-данные
    final songs = Song.getMockSongs();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Melody Player',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        actions: [
          // Кнопка поиска (пока просто иконка)
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: реализовать поиск
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Поиск будет доступен в следующей версии'),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: songs.length,
        itemBuilder: (context, index) {
          final song = songs[index];
          return SongTile(
            song: song,
            onTap: () {
              // Красивый переход с появлением снизу
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      PlayerScreen(song: song),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(0.0, 1.0);
                    const end = Offset.zero;
                    const curve = Curves.easeInOut;

                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));
                    var offsetAnimation = animation.drive(tween);

                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
