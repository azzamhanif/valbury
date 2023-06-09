import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_klinik_controller.dart';

class DetailKlinikView extends GetView<DetailKlinikController> {
  const DetailKlinikView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                height: Get.height*.3,
                width: Get.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                        image: NetworkImage(
                          controller.imgUrl!,
                        )
                    )
                ),
                child: Container(
                  padding: EdgeInsets.all(16),
                  height: Get.height*.3,
                  width: Get.width,
                  color: Colors.black.withOpacity(.3),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(controller.name!,style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: 16,left: 16,right: 16,bottom: 8),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Alamat',style: TextStyle(fontSize: 14,color: Colors.deepOrangeAccent,fontWeight: FontWeight.bold),),
                    SizedBox(height: 4,),
                    Text(controller.address!,
                      style: TextStyle(fontSize: 12,color: Colors.black.withOpacity(.7)),),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Deskripsi',style: TextStyle(fontSize: 14,color: Colors.deepOrangeAccent,fontWeight: FontWeight.bold),),
                    SizedBox(height: 4,),
                    Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s '
                        'standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a '
                        'type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, ',
                      style: TextStyle(fontSize: 12,color: Colors.black.withOpacity(.7)),),
                  ],
                ),
              ),
            ),

            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Fasilitas',style: TextStyle(fontSize: 14,color: Colors.deepOrangeAccent,fontWeight: FontWeight.bold),),
                    SizedBox(height: 8,),
                    Container(
                      height: 180,
                      decoration: BoxDecoration(
                          color: Colors.orange.withOpacity(.1),
                          borderRadius: BorderRadius.circular(16)
                      ),
                      child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: 4,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2,
                          ),
                          itemBuilder: (context,index){
                            return Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16)
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.medical_services,color: Colors.deepOrangeAccent,size: 30,),
                                  SizedBox(height: 4,),
                                  Text('Kamar Inap',style: TextStyle(fontSize: 12),)
                                ],
                              ),
                            );
                          }
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
