import 'package:flutter/material.dart';
import '../models/song.dart';
import '../widgets/player_controls.dart';
import '../utils/text_styles.dart';

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
      body: _buildBody(context),
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
  Widget _buildBody(BuildContext context) {
    return Container(
      decoration: _buildGradient(),
      child: Column(
        children: [
          _buildAlbumArtSection(context),
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

  /// Секция с обложкой и индикатором прогресса
  Expanded _buildAlbumArtSection(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            _buildAlbumArt(context),
            _buildProgressIndicator(),
            _buildTimeIndicator(), // Добавим время воспроизведения
          ],
        ),
      ),
    );
  }

  /// Индикатор прогресса воспроизведения
  Widget _buildProgressIndicator() {
    return Positioned(
      bottom: 20,
      left: 40,
      right: 40,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Полоса прогресса
          Container(
            height: 4,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(2),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: 0.3, // Временно 30% для демонстрации
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Индикаторы времени (текущее / общее)
  Widget _buildTimeIndicator() {
    return Positioned(
      bottom: 40,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '1:23', // Текущее время
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 12,
              fontFamily: 'Montserrat',
            ),
          ),
          const SizedBox(width: 150), // Пространство под полосу
          Text(
            song.duration, // Общее время
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 12,
              fontFamily: 'Montserrat',
            ),
          ),
        ],
      ),
    );
  }

  /// Круглая обложка — теперь выбирает между иконкой и реальным изображением
  Widget _buildAlbumArt(BuildContext context) {
    // Получаем размер экрана
    final screenWidth = MediaQuery.of(context).size.width;
    // Обложка не больше 250 и не меньше 200, но пропорциональна экрану
    // final albumSize = screenWidth * 0.6.clamp(200.0, 250.0);
    final albumSize = screenWidth * 0.8;
    if (song.coverArt != null) {
      return Container(
        width: albumSize,
        height: albumSize,
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
          const SizedBox(height: 20),
          _buildExtraControls(), // <-- Новая секция
        ],
      ),
    );
  }

  /// Дополнительные элементы управления
  Widget _buildExtraControls() {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceEvenly, // Равномерно распределяет
      children: [
        _buildControlButton(Icons.repeat, 'Повтор'),
        _buildControlButton(Icons.shuffle, 'Перемешать'),
        _buildControlButton(Icons.favorite_border, 'В избранное'),
        _buildControlButton(Icons.playlist_add, 'В плейлист'),
      ],
    );
  }

  /// Кнопка с иконкой и подписью
  Widget _buildControlButton(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: Colors.white.withOpacity(0.8),
          size: 24,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: 10,
            fontFamily: 'Montserrat',
          ),
        ),
      ],
    );
  }

  /// Название песни (крупное, жирное начертание)
  Text _buildSongTitle() {
    return Text(
      song.title,
      style: AppTextStyles.songTitle,
      textAlign: TextAlign.center,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  /// Имя исполнителя (светлое начертание)
  Text _buildArtistName() {
    return Text(
      song.artist,
      style: AppTextStyles.artistName.copyWith(
        color: Colors.white.withOpacity(0.8), // Немного прозрачности
      ),
      textAlign: TextAlign.center,
    );
  }

  /// Длительность песни (обычное начертание)
  Text _buildDuration() {
    return Text(
      song.duration,
      style: AppTextStyles.duration.copyWith(
        color: Colors.white.withOpacity(0.6),
      ),
      textAlign: TextAlign.center,
    );
  }
}
