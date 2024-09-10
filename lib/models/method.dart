class Album {
  // final int userId;
  final int id;
  final String title;
  final String url;

  const Album({
    // required this.userId,
    required this.id,
    required this.title,
    required this.url,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        // 'userId': int userId,
        'id': int id,
        'title': String title,
        'url': String url,
      } =>
        Album(
          // userId: userId,
          id: id,
          title: title,
          url: url,
        ),
      _ => throw const FormatException('Failed to load album.'),
    };
  }
}