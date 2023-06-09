import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:valbury/app/routes/app_pages.dart';
import 'package:valbury/app/util/skeleton.dart';

class ItemListWidget extends StatelessWidget {
  final String? imgUrl,name,address;
  final bool? isRumahSakit;

  const ItemListWidget({Key? key,required this.imgUrl,required this.name,required this.address,required this.isRumahSakit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: (){
          if(isRumahSakit!)
            Get.toNamed(Routes.DETAIL_RUMAH_SAKIT,arguments: {
              "name":name,
              "imgUrl":imgUrl,
              "address":address,
            });
          else
            Get.toNamed(Routes.DETAIL_KLINIK,arguments: {
              "name":name,
              "imgUrl":imgUrl,
              "address":address,
            });

        },
        child: Container(
          height: 70,
          padding: EdgeInsets.only(right: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16)
          ),
          child: Row(
            children: [
              Container(
                height: 70,
                width: 70,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(4),topLeft: Radius.circular(4)),
                  child: Image.network(imgUrl!,
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                    width: 50,
                    height: 50,
                    errorBuilder: (context,uri,child)=>Container(
                      width: 20,
                      height: 20,
                      child: Icon(Icons.broken_image_outlined,size: 20,),
                    ),
                    loadingBuilder: (BuildContext context,Widget child,ImageChunkEvent? loadingProgress){
                      if(loadingProgress == null) return child;
                      return SkeletonWidget(height: 70,width: 70,);
                    },
                  ),
                ),
              ),
              SizedBox(width: 8,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 4,),
                    Text(name!, style: TextStyle(fontSize: 14),),
                    SizedBox(height: 4,),
                    Text(address!, style: TextStyle(fontSize: 10),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,),
                    SizedBox(height: 4,),
                  ],
                )
              ),
              SizedBox(width: 8,),
              Text('Lihat Detail',
                style: TextStyle(fontSize: 10),)
            ],
          ),
        ),
      ),

      // ListTile(
      //   onTap: () {
      //     if(isRumahSakit!)
      //       Get.toNamed(Routes.DETAIL_RUMAH_SAKIT);
      //     else
      //       Get.toNamed(Routes.DETAIL_KLINIK);
      //
      //   },
      //   leading: Container(
      //     height: 50,
      //     width: 50,
      //     child: ClipRRect(
      //       borderRadius: BorderRadius.circular(4),
      //       child: Image.network(imgUrl!,
      //         fit: BoxFit.cover,
      //         alignment: Alignment.center,
      //         width: 50,
      //         height: 50,
      //         errorBuilder: (context,uri,child)=>Container(
      //           width: 20,
      //           height: 20,
      //           child: Icon(Icons.broken_image_outlined,size: 20,),
      //         ),
      //         loadingBuilder: (BuildContext context,Widget child,ImageChunkEvent? loadingProgress){
      //           if(loadingProgress == null) return child;
      //           return SkeletonWidget(height: 50,width: 50,);
      //         },
      //       ),
      //     ),
      //   ),
      //   title: Text(name!, style: TextStyle(fontSize: 14),),
      //   subtitle: Text(address!, style: TextStyle(fontSize: 10),
      //     maxLines: 2,
      //     overflow: TextOverflow.ellipsis,),
      //   trailing: Text('Lihat Detail',
      //     style: TextStyle(fontSize: 10),),
      // ),
    );
  }
}