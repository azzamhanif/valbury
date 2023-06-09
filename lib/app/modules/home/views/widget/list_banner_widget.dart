import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:valbury/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:valbury/app/modules/home/controllers/home_controller.dart';
import 'package:valbury/app/routes/app_pages.dart';
import 'package:valbury/app/util/skeleton.dart';

class ListBannerWidget extends GetView<HomeController> {

  const ListBannerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dashboardController = Get.find<DashboardController>();

    return SliverPadding(
      padding: EdgeInsets.only(top: 8,left: 16),
      sliver: SliverToBoxAdapter(
        child: Container(
          height: 100,
          padding: EdgeInsets.zero,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
                return InkWell(
                  onTap: (){
                    Get.toNamed(Routes.DETAIL_BANNER);
                  },
                  child: Container(
                    width: 200,
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.only(right: 4,bottom: 8,left: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        boxShadow: [BoxShadow(
                            color: Colors.black.withOpacity(.3),
                            offset: Offset(1,3),
                            blurRadius: 5
                        )]
                    ),
                    child: Center(child: Text('Banner')),
                  ),
                );
              }
          ),
        ),
      ),
    );
  }
}