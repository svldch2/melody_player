import 'package:flutter/material.dart';
import '../models/song.dart';
import '../widgets/player_controls.dart';

class PlayerScreen extends StatelessWidget {
  final Song song;

  const PlayerScreen({
    super.key,
    required this.song,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  /// Верхняя панель
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.deepPurple,
      foregroundColor: Colors.white,
      title: Text(
        song.title,
        style: const TextStyle(fontSize: 18),
      ),
      centerTitle: true,
    );
  }

  /// Основное содержимое экрана с градиентом
  Widget _buildBody() {
    return Container(
      decoration: _buildGradient(),
      child: Column(
        children: [
          _buildAlbumArtSection(),
          _buildSongInfoSection(),
        ],
      ),
    );
  }

  /// Градиентный фон
  BoxDecoration _buildGradient() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.deepPurple.shade900,
          Colors.deepPurple.shade300,
        ],
      ),
    );
  }

  /// Секция с обложкой (круг + иконка или изображение)
  Expanded _buildAlbumArtSection() {
    return Expanded(
      flex: 3,
      child: Center(
        child: _buildAlbumArt(),
      ),
    );
  }

  /// Круглая обложка — теперь выбирает между иконкой и реальным изображением
  Widget _buildAlbumArt() {
    if (song.coverArt != null) {
      return Container(
        width: 250,
        height: 250,
        decoration: _buildAlbumArtDecoration(),
        child: ClipOval(
          child: Image.asset(
            song.coverArt!,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              print('Не удалось загрузить обложку для ${song.title}: $error');
              return _buildFallbackIcon();
            },
          ),
        ),
      );
    }
    return _buildFallbackIcon();
  }

  /// Реальное изображение обложки (упрощенный вариант)
  Container _buildCoverImage() {
    return Container(
      width: 250,
      height: 250,
      decoration: _buildAlbumArtDecoration(),
      child: ClipOval(
        child: Image.asset(
          song.coverArt!,
          fit: BoxFit.cover,
          // Просто показываем заглушку при ошибке
          errorBuilder: (context, error, stackTrace) {
            print('Ошибка загрузки изображения: $error');
            return _buildFallbackIcon();
          },
        ),
      ),
    );
  }

  /// Запасная иконка (когда нет обложки или ошибка загрузки)
  Container _buildFallbackIcon() {
    return Container(
      width: 250,
      height: 250,
      decoration: _buildAlbumArtDecoration(),
      child: const Icon(
        Icons.music_note,
        size: 120,
        color: Colors.white,
      ),
    );
  }

  /// Декорация для круглой обложки (общая для всех вариантов)
  BoxDecoration _buildAlbumArtDecoration() {
    return BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.white.withOpacity(0.1),
      boxShadow: _buildBoxShadow(),
    );
  }

  /// Тень для обложки
  List<BoxShadow> _buildBoxShadow() {
    return [
      BoxShadow(
        color: Colors.black.withOpacity(0.3),
        blurRadius: 20,
        spreadRadius: 5,
      ),
    ];
  }

  /// Секция с информацией о песне и кнопками
  Expanded _buildSongInfoSection() {
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          _buildSongTitle(),
          const SizedBox(height: 8),
          _buildArtistName(),
          const SizedBox(height: 8),
          _buildDuration(),
          const SizedBox(height: 30),
          const PlayerControls(),
        ],
      ),
    );
  }

  /// Название песни (крупное)
  Text _buildSongTitle() {
    return Text(
      song.title,
      style: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  /// Имя исполнителя
  Text _buildArtistName() {
    return Text(
      song.artist,
      style: TextStyle(
        fontSize: 18,
        color: Colors.white.withOpacity(0.8),
      ),
    );
  }

  /// Длительность песни
  Text _buildDuration() {
    return Text(
      song.duration,
      style: TextStyle(
        fontSize: 16,
        color: Colors.white.withOpacity(0.6),
      ),
    );
  }
}
