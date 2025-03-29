import 'package:flutter/material.dart';
import 'package:flutter_itunes_search/ui/search/screen_search.dart';
import 'package:get/get.dart';

import 'router/app_route.dart';
import 'ui/search/binding/screen_search_binding.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: AppRoute.initial,
      initialBinding: ScreenSearchBinding(),
      getPages: AppRoute.routes,
      home: const ScreenSearch(),
    );
  }
}
