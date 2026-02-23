import 'package:flutter/material.dart';

class PlayerControls extends StatefulWidget {
  const PlayerControls({super.key});

  @override
  State<PlayerControls> createState() => _PlayerControlsState();
}

class _PlayerControlsState extends State<PlayerControls> {
  bool _isPlaying = false;

  // 1. Вызывается первым при создании виджета
  @override
  void initState() {
    super.initState();
    print('🎵 [PlayerControls] initState: контролы созданы');
  }

  // 2. Вызывается после initState и перед build
  // Также вызывается, если изменились зависимости (например, унаследованные виджеты)
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('🎵 [PlayerControls] didChangeDependencies');
  }

  // 3. Основной метод отрисовки
  @override
  Widget build(BuildContext context) {
    print('🎵 [PlayerControls] build: _isPlaying = $_isPlaying');

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _SkipButton(
          direction: SkipDirection.previous,
          onPressed: _onPreviousPressed,
        ),
        const SizedBox(width: 20),
        _PlayPauseButton(
          isPlaying: _isPlaying,
          onPressed: _onPlayPausePressed,
        ),
        const SizedBox(width: 20),
        _SkipButton(
          direction: SkipDirection.next,
          onPressed: _onNextPressed,
        ),
      ],
    );
  }

  // 4. Вызывается, если родитель пересоздал виджет с новыми параметрами
  @override
  void didUpdateWidget(PlayerControls oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('🎵 [PlayerControls] didUpdateWidget');
  }

  // 5. Вызывается перед уничтожением (когда виджет удаляется из дерева)
  @override
  void deactivate() {
    super.deactivate();
    print('🎵 [PlayerControls] deactivate');
  }

  // 6. Вызывается при окончательном уничтожении
  @override
  void dispose() {
    print('🎵 [PlayerControls] dispose: контролы уничтожены');
    super.dispose();
  }

  void _onPlayPausePressed() {
    setState(() {
      _isPlaying = !_isPlaying;
      print('🎵 [PlayerControls] setState: меняем на _isPlaying = $_isPlaying');
    });
  }

  void _onPreviousPressed() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Предыдущий трек (в разработке)')),
    );
  }

  void _onNextPressed() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Следующий трек (в разработке)')),
    );
  }
}

// Вспомогательные виджеты (можно добавить логирование и в них)
class _SkipButton extends StatelessWidget {
  final SkipDirection direction;
  final VoidCallback onPressed;

  const _SkipButton({
    required this.direction,
    required this.onPressed,
  });

  IconData get _icon {
    switch (direction) {
      case SkipDirection.previous:
        return Icons.skip_previous;
      case SkipDirection.next:
        return Icons.skip_next;
    }
  }

  @override
  Widget build(BuildContext context) {
    print(
        '🎵 [_SkipButton] build: ${direction == SkipDirection.previous ? "previous" : "next"}');

    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        _icon,
        size: 50,
        color: Colors.white,
      ),
    );
  }
}

class _PlayPauseButton extends StatelessWidget {
  final bool isPlaying;
  final VoidCallback onPressed;

  const _PlayPauseButton({
    required this.isPlaying,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    print('🎵 [_PlayPauseButton] build: isPlaying = $isPlaying');

    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          isPlaying ? Icons.pause : Icons.play_arrow,
          size: 50,
          color: Colors.deepPurple,
        ),
      ),
    );
  }
}

enum SkipDirection { previous, next }
