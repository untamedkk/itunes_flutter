import 'package:flutter/material.dart';

import '../../data/model/music_track.dart';
import '../custom_components/custom_text.dart';
import 'widget_cover_image.dart';

class WidgetListItem extends StatelessWidget {
  final MusicTrack track;
  final int index;
  final Function(int index) onItemClick;

  const WidgetListItem({
    super.key,
    required this.track,
    required this.index,
    required this.onItemClick,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        WidgetCoverImage(
          artworkUrl: track.artworkUrl100,
          onTap: () {
            onItemClick(index);
          },
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomText(text: track.trackName ?? ''),
              CustomText(text: track.artistName ?? ''),
              CustomText(text: track.collectionName ?? ''),
            ],
          ),
        ),
      ],
    );
  }
}
