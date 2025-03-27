import 'package:flutter/material.dart';
import 'package:flutter_itunes_search/data/model/music_track.dart';
import 'package:just_audio/just_audio.dart';

import '../custom_components/custom_text.dart';

class WidgetAudioPlayer extends StatelessWidget {
  final PlayerState playerState;
  final VoidCallback onPlay;
  final VoidCallback onPause;
  final VoidCallback onPlayNext;
  final MusicTrack? currentTrack;

  const WidgetAudioPlayer({
    super.key,
    required this.playerState,
    required this.onPlay,
    required this.onPause,
    required this.onPlayNext,
    required this.currentTrack,
  });

  @override
  Widget build(BuildContext context) {
    return currentTrack == null
        ? Container()
        : Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.all(10),
            color: Colors.black.withValues(alpha: .8),
            height: 60,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.network(
                      currentTrack?.artworkUrl100 ?? "",
                      height: 70,
                      width: 70,
                    ),
                    playerState.processingState == ProcessingState.buffering ||
                            playerState.processingState ==
                                ProcessingState.loading
                        ? SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(color: Colors.white),
                        )
                        : playerState.playing
                        ? GestureDetector(
                          onTap: () => onPause(),
                          child: Icon(
                            Icons.pause,
                            color: Colors.white,
                            size: 35,
                          ),
                        )
                        : GestureDetector(
                          onTap: () => onPlay(),
                          child: Icon(
                            Icons.play_circle,
                            color: Colors.white,
                            size: 35,
                          ),
                        ),
                  ],
                ),
                Expanded(
                  child: CustomText(
                    textColor: Colors.white,
                    text: currentTrack?.trackName ?? '',
                  ),
                ),
                GestureDetector(
                  onTap: () => onPlayNext(),
                  child: Icon(Icons.skip_next, color: Colors.white, size: 35),
                ),
              ],
            ),
          ),
        );
  }
}
