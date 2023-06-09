import 'package:get/get.dart';

import '../controllers/detail_klinik_controller.dart';

class DetailKlinikBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailKlinikController>(
      () => DetailKlinikController(),
    );
  }
}
