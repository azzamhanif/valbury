import 'package:get/get.dart';

import '../controllers/rumahsakit_controller.dart';

class RumahsakitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RumahsakitController>(
      () => RumahsakitController(),
    );
  }
}
