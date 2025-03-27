import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/services/domain/base_response.dart';
import '../../data/services/domain/search_result_response.dart';
import '../custom_components/custom_search_text_field.dart';
import '../screen_base.dart';
import 'view_model_screen_search.dart';
import 'widget_audio_player.dart';
import 'widget_list_item.dart';

class ScreenSearch extends ScreenBase<ViewModelScreenSearch> {
  const ScreenSearch({super.key});

  @override
  bool get wrapWithSafeArea => true;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('iTunes Search'),
      automaticallyImplyLeading: false,
    );
  }

  @override
  Widget buildScreen(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              CustomSearchTextField(
                onSubmitted: (str) => controller.search(str),
                onChanged: (str) => controller.search(str),
                labelText: 'Search',
              ),
              Obx(() {
                return _getSearchResults();
              }),
            ],
          ),
        ),
        Obx(() {
          return WidgetAudioPlayer(
            currentTrack: controller.currentTrack.value,
            playerState: controller.playerState.value,
            onPause: () => controller.pause(),
            onPlay: () => controller.resume(),
            onPlayNext: () => controller.playNexTrack(),
          );
        }),
      ],
    );
  }

  Widget _getSearchResults() {
    final BaseResponse<MusicSearchResult> results =
        controller.searchResult.value;
    final items = results.data?.results ?? [];
    switch (results.state) {
      case ResponseState.success:
        return Expanded(
          child: ListView.separated(
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return WidgetListItem(
                index: index,
                track: items[index],
                onItemClick: (index) => controller.play(index),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              if (index == items.length) {
                return const SizedBox(height: 70);
              } else {
                return const Divider();
              }
            },
          ),
        );
      case ResponseState.error:
      case ResponseState.suspended:
      case ResponseState.unknown:
        return SizedBox.shrink();
      case ResponseState.loading:
        return Expanded(
          child: Align(
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          ),
        );
    }
  }
}
