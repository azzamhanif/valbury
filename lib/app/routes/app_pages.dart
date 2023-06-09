import 'package:get/get.dart';

import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/detail_banner/bindings/detail_banner_binding.dart';
import '../modules/detail_banner/views/detail_banner_view.dart';
import '../modules/detail_klinik/bindings/detail_klinik_binding.dart';
import '../modules/detail_klinik/views/detail_klinik_view.dart';
import '../modules/detail_rumah_sakit/bindings/detail_rumah_sakit_binding.dart';
import '../modules/detail_rumah_sakit/views/detail_rumah_sakit_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/klinik/bindings/klinik_binding.dart';
import '../modules/klinik/views/klinik_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/rumahsakit/bindings/rumahsakit_binding.dart';
import '../modules/rumahsakit/views/rumahsakit_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.KLINIK,
      page: () => const KlinikView(),
      binding: KlinikBinding(),
    ),
    GetPage(
      name: _Paths.RUMAHSAKIT,
      page: () => const RumahsakitView(),
      binding: RumahsakitBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_RUMAH_SAKIT,
      page: () => const DetailRumahSakitView(),
      binding: DetailRumahSakitBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_KLINIK,
      page: () => const DetailKlinikView(),
      binding: DetailKlinikBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_BANNER,
      page: () => const DetailBannerView(),
      binding: DetailBannerBinding(),
    ),
  ];
}
