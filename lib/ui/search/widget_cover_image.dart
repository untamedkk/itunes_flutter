import 'package:flutter/material.dart';

class WidgetCoverImage extends StatelessWidget {
  const WidgetCoverImage({
    super.key,
    required this.artworkUrl,
    required this.onTap,
  });

  final String artworkUrl;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.network(artworkUrl, height: 70, width: 70),
        GestureDetector(
          onTap: () => onTap(),
          child: Icon(
            Icons.play_circle,
            color: Colors.black.withValues(alpha: .6),
            size: 35,
          ),
        ),
      ],
    );
  }
}
