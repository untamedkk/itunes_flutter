import 'package:get/get.dart';

import '../view_model_screen_search.dart';

class ScreenSearchBinding extends Bindings {
  @override
  void dependencies() =>
      Get.put<ViewModelScreenSearch>(ViewModelScreenSearch());
}
