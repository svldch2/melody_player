class Song {
  final String id;
  final String title;
  final String artist;
  final String duration; // Пока строкой, потом научимся работать с Duration
  final String assetPath; // Путь к файлу (пока заглушка)

  Song({
    required this.id,
    required this.title,
    required this.artist,
    required this.duration,
    required this.assetPath,
  });

  // Временный метод для создания демо-данных
  static List<Song> getMockSongs() {
    return [
      Song(
        id: '1',
        title: 'Bohemian Rhapsody',
        artist: 'Queen',
        duration: '5:55',
        assetPath: 'assets/music/bohemian_rhapsody.mp3',
      ),
      Song(
        id: '2',
        title: 'Stairway to Heaven',
        artist: 'Led Zeppelin',
        duration: '8:02',
        assetPath: 'assets/music/stairway_to_heaven.mp3',
      ),
      Song(
        id: '3',
        title: 'Imagine',
        artist: 'John Lennon',
        duration: '3:04',
        assetPath: 'assets/music/imagine.mp3',
      ),
      Song(
        id: '4',
        title: 'Hotel California',
        artist: 'Eagles',
        duration: '6:30',
        assetPath: 'assets/music/hotel_california.mp3',
      ),
      Song(
        id: '5',
        title: 'Shape of You',
        artist: 'Ed Sheeran',
        duration: '3:54',
        assetPath: 'assets/music/shape_of_you.mp3',
      ),
    ];
  }
}
