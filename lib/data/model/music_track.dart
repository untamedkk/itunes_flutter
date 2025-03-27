class MusicTrack {
  final String? artistName;
  final String? collectionName;
  final String? trackName;
  final String previewUrl;
  final String artworkUrl100;
  final DateTime? releaseDate;
  final int? trackTimeMillis;

  MusicTrack({
    required this.artistName,
    required this.collectionName,
    required this.trackName,
    required this.previewUrl,
    required this.artworkUrl100,
    required this.releaseDate,
    required this.trackTimeMillis,
  });

  factory MusicTrack.fromJson(Map<String, dynamic> json) {
    return MusicTrack(
      artistName: json['artistName'] ?? '',
      collectionName: json['collectionName'] ?? '',
      trackName: json['trackName'] ?? '',
      previewUrl: json['previewUrl'] ?? '',
      artworkUrl100: json['artworkUrl100'] ?? '',
      releaseDate: DateTime.parse(json['releaseDate'] ?? ''),
      trackTimeMillis: json['trackTimeMillis'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    'artistName': artistName,
    'collectionName': collectionName,
    'trackName': trackName,
    'previewUrl': previewUrl,
    'artworkUrl100': artworkUrl100,
    'releaseDate': releaseDate!.toIso8601String(),
    'trackTimeMillis': trackTimeMillis,
  };
}
