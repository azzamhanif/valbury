import 'package:get/get.dart';

import '../controllers/klinik_controller.dart';

class KlinikBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KlinikController>(
      () => KlinikController(),
    );
  }
}
