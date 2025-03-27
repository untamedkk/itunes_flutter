import 'package:get/get.dart';

class BaseViewModel extends GetxController {
  final loading = false.obs;

  void routeBack() {
    Get.back();
  }
}
