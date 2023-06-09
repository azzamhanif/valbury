import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:valbury/app/modules/home/controllers/home_controller.dart';
import 'package:valbury/app/modules/home/views/widget/list_rumah_sakit_widget.dart';

import '../controllers/rumahsakit_controller.dart';

class RumahsakitView extends GetView<RumahsakitController> {
  const RumahsakitView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    return homeController.obx((state) =>Scaffold(
      appBar: AppBar(
        title: const Text('Rumah Sakit'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          child: CustomScrollView(
            slivers: [
              ListRumahSakitWidget(isAll: true,)
            ],
          ),
        ),
      ),
    ),onLoading: Center(child: CircularProgressIndicator(),));
  }
}
