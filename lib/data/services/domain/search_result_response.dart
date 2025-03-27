import '../../model/music_track.dart';

class MusicSearchResult {
  final int resultCount;
  final List<MusicTrack> results;

  MusicSearchResult({required this.resultCount, required this.results});

  factory MusicSearchResult.fromJson(Map<String, dynamic> json) {
    return MusicSearchResult(
      resultCount: json['resultCount'] as int,
      results:
          (json['results'] as List).map((i) => MusicTrack.fromJson(i)).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'resultCount': resultCount,
    'results': results.map((e) => e.toJson()).toList(),
  };
}
