import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:valbury/app/modules/home/views/home_view.dart';
import 'package:valbury/app/modules/klinik/views/klinik_view.dart';
import 'package:valbury/app/modules/profile/views/profile_view.dart';
import 'package:valbury/app/modules/rumahsakit/views/rumahsakit_view.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController
  final currentIndex = 0.obs;
  final List<Widget> pages = const [
    HomeView(),
    RumahsakitView(),
    KlinikView(),
    ProfileView(),
  ].obs;

  void onItemTapped({required index}) {
    currentIndex.value = index;
  }
}
