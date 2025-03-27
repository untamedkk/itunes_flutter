import 'package:flutter_itunes_search/data/model/music_track.dart';
import 'package:flutter_itunes_search/data/services/remote/app_api_client.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

import '../../data/repositories/search/search_repository.dart';
import '../../data/services/domain/base_response.dart';
import '../../data/services/domain/search_result_response.dart';
import '../base/base_view_model.dart';

class ViewModelScreenSearch extends BaseViewModel {
  final _searchRepository = SearchRepository(apiClient: AppApiClient());

  Rx<BaseResponse<MusicSearchResult>> searchResult =
      BaseResponse.unknown<MusicSearchResult>().obs;

  final currentTrack = Rxn<MusicTrack?>();
  final currentTrackIndex = RxInt(-1);

  final AudioPlayer player = AudioPlayer();
  final Rx<PlayerState> playerState = Rx<PlayerState>(
    PlayerState(false, ProcessingState.idle),
  );

  Future<void> search(String query) async {
    searchResult.value = BaseResponse.loading<MusicSearchResult>();

    BaseResponse<MusicSearchResult> result = await _searchRepository.search(
      query: query,
    );

    searchResult.value = result;
  }

  Future<void> pause() async {
    player.pause();
  }

  Future<void> resume() async {
    player.play();
  }

  Future<void> playNexTrack() async {
    play(++currentTrackIndex.value);
  }

  Future<void> play(int index) async {
    if (index >= searchResult.value.data!.results.length) {
      return;
    }

    currentTrackIndex.value = index;
    final currentTrack = searchResult.value.data!.results[index];
    this.currentTrack.value = currentTrack;

    if (player.playing) {
      player.stop();
    }

    final _ = await player.setUrl(currentTrack.previewUrl);

    await player.play();
  }

  @override
  void onInit() {
    super.onInit();

    player.playerStateStream.listen((event) {
      playerState.value = event;
      switch (event.processingState) {
        case ProcessingState.idle:
          break;
        case ProcessingState.loading:
          break;
        case ProcessingState.buffering:
          break;
        case ProcessingState.ready:
          break;
        case ProcessingState.completed:
          player.stop();
          break;
      }
    });
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }
}
