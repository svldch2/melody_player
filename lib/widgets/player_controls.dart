import 'package:flutter/material.dart';

class PlayerControls extends StatefulWidget {
  const PlayerControls({super.key});

  @override
  State<PlayerControls> createState() => _PlayerControlsState();
}

class _PlayerControlsState extends State<PlayerControls> {
  bool _isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            // TODO: предыдущий трек
          },
          icon: const Icon(
            Icons.skip_previous,
            size: 50,
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 20),
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: IconButton(
            onPressed: () {
              setState(() {
                _isPlaying = !_isPlaying;
              });
            },
            icon: Icon(
              _isPlaying ? Icons.pause : Icons.play_arrow,
              size: 50,
              color: Colors.deepPurple,
            ),
          ),
        ),
        const SizedBox(width: 20),
        IconButton(
          onPressed: () {
            // TODO: следующий трек
          },
          icon: const Icon(
            Icons.skip_next,
            size: 50,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
