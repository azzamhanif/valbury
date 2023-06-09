import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:valbury/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:valbury/app/modules/home/views/widget/list_banner_widget.dart';
import 'package:valbury/app/modules/home/views/widget/list_klinik_widget.dart';
import 'package:valbury/app/modules/home/views/widget/list_rumah_sakit_widget.dart';
import 'package:valbury/app/routes/app_pages.dart';
import 'package:valbury/app/util/skeleton.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return controller.obx((state) => Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 110,
        elevation: 0,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(height: 4,),
                Container(
                  child: Row(
                    children: [
                      SizedBox(
                        height: 30,
                        width: 30,
                        child: ClipRRect(
                          child: Image.asset('assets/images/logo.png'),
                        ),
                      ),
                      SizedBox(width: 4,),
                      Expanded(child: Text('Valbury',style: TextStyle(fontSize: 16),)),
                      Icon(Icons.info_outline)
                    ],
                  ),
                ),
                SizedBox(height: 8,),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.orange.withOpacity(.1),
                          ),
                          padding: EdgeInsets.all(16),
                          child: Center(child: Text('Label 1')),
                        )
                      ),
                      SizedBox(width: 4,),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.orange.withOpacity(.1),
                          ),
                          padding: EdgeInsets.all(16),
                          child: Center(child: Text('Label 2')),
                        )
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        // title: const Text('HomeView'),
        // centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          // padding: EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            slivers: [
              ListRumahSakitWidget(),
              ListBannerWidget(),
              ListKlinikWidget()
            ],
          ),
        ),
      ),
    ),onLoading: Center(child: CircularProgressIndicator(),));
  }
}
