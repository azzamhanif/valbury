import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:valbury/app/modules/home/controllers/home_controller.dart';
import 'package:valbury/app/modules/home/views/widget/list_klinik_widget.dart';

import '../controllers/klinik_controller.dart';

class KlinikView extends GetView<KlinikController> {
  const KlinikView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    return homeController.obx((state) => Scaffold(
      appBar: AppBar(
        title: const Text('Klinik'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          child: CustomScrollView(
            slivers: [
              ListKlinikWidget(isAll: true,)
            ],
          ),
        ),
      ),
    ),onLoading: Center(child: CircularProgressIndicator(),));
  }
}
