class Song {
  final String id;
  final String title;
  final String artist;
  final String duration;
  final String assetPath; // Путь к аудиофайлу
  final String? coverArt; // <-- НОВОЕ: путь к обложке (может быть null)

  Song({
    required this.id,
    required this.title,
    required this.artist,
    required this.duration,
    required this.assetPath,
    this.coverArt, // Опциональный параметр
  });

  // Обновляем мок-данные, добавим пути к обложкам
  static List<Song> getMockSongs() {
    return [
      Song(
        id: '1',
        title: 'Bohemian Rhapsody',
        artist: 'Queen',
        duration: '5:55',
        assetPath: 'assets/music/bohemian_rhapsody.mp3',
        coverArt:
            'assets/images/square-4121528342.jpg', // Предположим, что такое изображение есть
      ),
      Song(
        id: '2',
        title: 'Stairway to Heaven',
        artist: 'Led Zeppelin',
        duration: '8:02',
        assetPath: 'assets/music/stairway_to_heaven.mp3',
        coverArt: 'assets/images/square-green-4121528342.jpg',
      ),
      Song(
        id: '3',
        title: 'Imagine',
        artist: 'John Lennon',
        duration: '3:04',
        assetPath: 'assets/music/imagine.mp3',
        // У этого трека нет обложки (покажем иконку)
      ),
      Song(
        id: '4',
        title: 'Hotel California',
        artist: 'Eagles',
        duration: '6:30',
        assetPath: 'assets/music/hotel_california.mp3',
        coverArt: 'assets/images/eagles.jpg',
      ),
      Song(
        id: '5',
        title: 'Shape of You',
        artist: 'Ed Sheeran',
        duration: '3:54',
        assetPath: 'assets/music/shape_of_you.mp3',
        coverArt: 'assets/images/600056-4066200966.png',
      ),
    ];
  }
}
