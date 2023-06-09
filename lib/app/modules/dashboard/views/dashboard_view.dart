import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:valbury/app/modules/home/controllers/home_controller.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.find<HomeController>();
    return Obx(() => Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.deepOrangeAccent,
        currentIndex: controller.currentIndex.value,
        type: BottomNavigationBarType.fixed,
        onTap: (index){
          controller.onItemTapped(index: index);
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.house),
              label: 'Home'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_hospital_outlined),
              label: 'Rumah Sakit'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.medical_services_outlined),
              label: 'Klinik'
          ),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person),
              label: 'Profile'
          ),
        ],
      ),

      body: IndexedStack(
        index: controller.currentIndex.value,
        children: controller.pages,
      ),
    ));
  }
}
