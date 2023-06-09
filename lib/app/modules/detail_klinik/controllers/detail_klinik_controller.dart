import 'package:get/get.dart';

class DetailKlinikController extends GetxController {
  //TODO: Implement DetailKlinikController
  String? name = Get.arguments['name'];
  String? address = Get.arguments['address'];
  String? imgUrl = Get.arguments['imgUrl'];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
