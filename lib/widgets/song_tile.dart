import 'package:flutter/material.dart';
import '../models/song.dart';

class SongTile extends StatelessWidget {
  final Song song;
  final VoidCallback? onTap; // Опциональный callback при нажатии

  const SongTile({
    super.key,
    required this.song,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.deepPurple.shade100,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(
          Icons.music_note,
          color: Colors.deepPurple,
        ),
      ),
      title: Text(
        song.title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text('${song.artist} • ${song.duration}'),
      trailing: const Icon(
        Icons.play_arrow,
        color: Colors.deepPurple,
      ),
      onTap: onTap,
    );
  }
}
