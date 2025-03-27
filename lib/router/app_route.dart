import 'package:flutter_itunes_search/ui/search/screen_search.dart';
import 'package:flutter_itunes_search/ui/search/binding/screen_search_binding.dart';
import 'package:get/get.dart';

import 'screen_names.dart';

class AppRoute {
  AppRoute._();

  static const initial = ScreenNames.searchScreen;

  static final routes = [
    GetPage(
      name: ScreenNames.searchScreen,
      page: () => const ScreenSearch(),
      binding: ScreenSearchBinding(),
    ),
  ];
}
