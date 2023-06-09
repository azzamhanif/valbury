import 'package:get/get.dart';
import 'package:valbury/app/modules/home/controllers/home_controller.dart';
import 'package:valbury/app/modules/klinik/controllers/klinik_controller.dart';
import 'package:valbury/app/modules/profile/controllers/profile_controller.dart';
import 'package:valbury/app/modules/rumahsakit/controllers/rumahsakit_controller.dart';

import '../controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
      () => DashboardController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<RumahsakitController>(
      () => RumahsakitController(),
    );
    Get.lazyPut<KlinikController>(
      () => KlinikController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}
