import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:valbury/app/modules/home/klinik_model.dart';
import 'package:valbury/app/data/models/category_model.dart';
import 'package:valbury/app/modules/home/rumah_sakit_model.dart';

class HomeController extends GetxController with StateMixin{
  //TODO: Implement HomeController
  var dataRumahSakit = List<RumahSakit>.empty().obs;
  var visibleDataRumahSakit = List<RumahSakit>.empty().obs;
  var dataKlinik = List<Klinik>.empty().obs;
  var visibleDataKlinik = List<Klinik>.empty().obs;
  var dataCategory = List<Category>.empty().obs;
  var selectedIndexCat = 0.obs;
  var selectedKlinikIndexCat = 0.obs;
  late TextEditingController searchRumahSakitController;
  late TextEditingController searchKlinikController;

  void searchRumahSakit(String? key){
    visibleDataRumahSakit.value = dataRumahSakit;
    visibleDataRumahSakit.value = visibleDataRumahSakit.where((element) => element.name!.toLowerCase().contains(key!.toLowerCase())).toList();
  }

  void findByCat(String? key){
    if(key!.toLowerCase() != 'semua'){
      visibleDataRumahSakit.value = dataRumahSakit;
      visibleDataRumahSakit.value = visibleDataRumahSakit.where((element) => element.category!.toLowerCase().contains(key.toLowerCase())).toList();
    }else{
      visibleDataRumahSakit.value = dataRumahSakit;
      // initDataRS();
    }

  }

  void onTapped(int? index){
    selectedIndexCat.value = index!;
    update();
  }

  void findKlinikByCat(String? key){
    if(key!.toLowerCase() != 'semua'){
      visibleDataKlinik.value = dataKlinik;
      visibleDataKlinik.value = visibleDataKlinik.where((element) => element.category!.toLowerCase().contains(key.toLowerCase())).toList();
    }else{
      visibleDataKlinik.value = dataKlinik;
      // initDataRS();
    }

  }

  void onTappedKlinik(int? index){
    selectedKlinikIndexCat.value = index!;
    update();
  }

  void initDataCategory()async{
    change(null,status: RxStatus.loading());
    try{
      final String? response = await rootBundle.loadString('assets/models/category.json');
      final data = await jsonDecode(response!);
      data['data'].forEach((element) {
        dataCategory.add(Category(
          id: element['id'],
          name: element['name'],
        ));
      });
      change(null,status: RxStatus.success());
    }catch (e){
      change(null,status: RxStatus.success());
      Get.snackbar(
          "Opps something went wrong",
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.black.withOpacity(.6),
          margin: EdgeInsets.only(bottom: 8,left: 16,right: 16)
      );
    }
  }

  void initDataKlinik()async{
    change(null,status: RxStatus.loading());
    try{
      final String? response = await rootBundle.loadString('assets/models/klinik.json');
      final data = await jsonDecode(response!);
      data['data'].forEach((element) {
        dataKlinik.add(Klinik(
          id: element['id'],
          name: element['name'],
          address: element['address'],
          category: element['category'],
          imgUrl: element['imgUrl'],
        ));
      });
      change(null,status: RxStatus.success());
    }catch (e){
      change(null,status: RxStatus.success());
      Get.snackbar(
          "Opps something went wrong",
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.black.withOpacity(.6),
          margin: EdgeInsets.only(bottom: 8,left: 16,right: 16)
      );
    }
  }

  void initDataRS()async{
    change(null,status: RxStatus.loading());
    try{
      final String? response = await rootBundle.loadString('assets/models/rumah_sakit.json');
      final data = await jsonDecode(response!);
      data['data'].forEach((element) {
        dataRumahSakit.add(RumahSakit(
          id: element['id'],
          name: element['name'],
          address: element['address'],
          category: element['category'],
          imgUrl: element['imgUrl'],
        ));
      });
      change(null,status: RxStatus.success());
    }catch (e){
      change(null,status: RxStatus.success());
      Get.snackbar(
          "Opps something went wrong",
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.black.withOpacity(.6),
          margin: EdgeInsets.only(bottom: 8,left: 16,right: 16)
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
    initDataRS();
    initDataCategory();
    initDataKlinik();
    searchRumahSakitController = TextEditingController();
    searchKlinikController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    searchRumahSakitController.dispose();
    searchKlinikController.dispose();
  }

}
