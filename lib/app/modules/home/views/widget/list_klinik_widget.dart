import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:valbury/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:valbury/app/modules/home/controllers/home_controller.dart';
import 'package:valbury/app/modules/home/views/widget/item_list_widget.dart';
import 'package:valbury/app/routes/app_pages.dart';
import 'package:valbury/app/util/skeleton.dart';

class ListKlinikWidget extends GetView<HomeController> {
  final bool? isAll;

  const ListKlinikWidget({Key? key,this.isAll = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dashboardController = Get.find<DashboardController>();

    return MultiSliver(
      children: [
        if(!isAll!)
          SliverPadding(
            padding: EdgeInsets.only(top: 8,bottom: 8,left: 16,right: 16),
            sliver: SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Klinik',style: TextStyle(fontSize: 16),),
                  InkWell(
                      onTap: (){
                        dashboardController.currentIndex.value = 2;
                      },
                      child: Container(
                          padding: EdgeInsets.all(8),
                          child: Text('Lihat Semua',style: TextStyle(fontSize: 12,color: Colors.orange),))
                  )
                ],
              ),
            ),
          ),
        if(isAll!)
          SliverPadding(
            padding: EdgeInsets.only(top: 20,bottom: 16,left: 16,right: 16),
            sliver: SliverToBoxAdapter(
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      validator: (value){
                        // return controller.validateEmail(value);
                      },
                      // controller: controller.emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.orange.withOpacity(.07),
                        hintText: 'Search',
                        contentPadding:
                        const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(25.7),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepOrangeAccent),
                          borderRadius: BorderRadius.circular(25.7),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                          borderRadius: BorderRadius.circular(25.7),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25.7),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8,),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.deepOrangeAccent,
                        shape: BoxShape.circle
                    ),
                    child: Icon(CupertinoIcons.search,color: Colors.white,),
                  )
                ],
              ),
            ),
          ),

        SliverPadding(
          padding: EdgeInsets.only(top: 8,left: 16),
          sliver: SliverToBoxAdapter(
            child: Container(
              height: 45,
              padding: EdgeInsets.zero,
              child: ListView.builder(
                  itemCount: controller.dataCategory.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                    return InkWell(
                      onTap: (){
                        controller.onTappedKlinik(index);
                        controller.findKlinikByCat(controller.dataCategory[index].name);
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 400),
                        padding: EdgeInsets.symmetric(vertical: 8,horizontal: 12),
                        margin: EdgeInsets.only(right: 8,bottom: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: (controller.selectedKlinikIndexCat.value == index)?Colors.deepOrangeAccent:Colors.white,
                            boxShadow: [BoxShadow(
                                color: Colors.black.withOpacity(.3),
                                offset: Offset(1,1)
                            )]
                        ),
                        child: Center(child: Text(controller.dataCategory[index].name!,
                          style: TextStyle(
                              color: (controller.selectedKlinikIndexCat.value == index)?Colors.white:Colors.grey
                          ),
                        )),
                      ),
                    );
                  }
              ),
            ),
          ),
        ),

        if(controller.selectedKlinikIndexCat != 0 && controller.visibleDataKlinik.isEmpty)
          SliverPadding(
            padding: EdgeInsets.only(top: 8,bottom: 16),
            sliver: SliverToBoxAdapter(
              child: Center(
                child: Text('Belum ada data rumah sakit'),
              ),
            ),
          )
        else if(controller.selectedKlinikIndexCat == 0 && controller.dataKlinik.isEmpty)
          SliverPadding(
            padding: EdgeInsets.only(top: 8,bottom: 16),
            sliver: SliverToBoxAdapter(
              child: Center(
                child: Text('Belum ada data rumah sakit'),
              ),
            ),
          ),

        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) => Container(
                margin: EdgeInsets.only(bottom: 8),
                child: ItemListWidget(
                  isRumahSakit: false,
                  name: (controller.selectedKlinikIndexCat == 0)
                      ? controller.dataKlinik.value[index].name!
                      : controller.visibleDataKlinik.value[index]
                      .name!,
                  address: (controller.selectedKlinikIndexCat == 0)
                      ? controller.dataKlinik.value[index].address!
                      : controller.visibleDataKlinik.value[index]
                      .address!,
                  imgUrl: (controller.selectedKlinikIndexCat == 0)
                      ? controller.dataKlinik[index].imgUrl!
                      : controller.visibleDataKlinik[index].imgUrl!,
                ),
              ),
              childCount: (controller.selectedKlinikIndexCat == 0)
                  ? (isAll!)
                    ?controller.dataKlinik.length
                    :controller.dataKlinik.length >4?4:controller.dataKlinik.length
                  : (isAll!)
                    ?controller.visibleDataKlinik.length
                    :controller.visibleDataKlinik.length>4?4:controller.visibleDataKlinik.length)
          ),
        ),
      ]
    );
  }
}