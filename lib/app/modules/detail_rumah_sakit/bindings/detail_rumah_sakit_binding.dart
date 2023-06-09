import 'package:get/get.dart';

import '../controllers/detail_rumah_sakit_controller.dart';

class DetailRumahSakitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailRumahSakitController>(
      () => DetailRumahSakitController(),
    );
  }
}
