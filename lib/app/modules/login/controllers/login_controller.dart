import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:valbury/app/routes/app_pages.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  late TextEditingController phoneController;
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();


  String? validatePhoneNumber(String? value){
    if(value!.isEmpty){
      Get.snackbar(
        "Opps something went wrong",
        'Phone number cannot be empty',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.black.withOpacity(.6),
        margin: EdgeInsets.only(bottom: 8,left: 16,right: 16)
      );
      return 'Phone number cannot be empty';
    }
    else if(value.length > 10){
      Get.snackbar(
        "Opps something went wrong",
        'Phone number maximum 10 digits',
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.white,
        backgroundColor: Colors.black.withOpacity(.6),
        margin: EdgeInsets.only(bottom: 8,left: 16,right: 16)
      );
      return 'Phone number maximum 10 digits';
    }else if(!RegExp(r"^[0-9]+$").hasMatch(value)){
      Get.snackbar(
          "Opps something went wrong",
          'Please enter a valid phone number',
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.black.withOpacity(.6),
          margin: EdgeInsets.only(bottom: 8,left: 16,right: 16)
      );
      return 'Please enter a valid phone number';
    }
    return null;
  }

  void loadingDialog() {
    Get.defaultDialog(
        title: '',
        content: Container(
          child: Column(
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16,),
              Text('Loading...')
            ],
          ),
        )
    );
  }

  void checkLogin()async{
    final isValid = loginFormKey.currentState!.validate();
    if(isValid){
      loadingDialog();
      await Future.delayed(Duration(seconds: 2));
      Get.offAllNamed(Routes.DASHBOARD);
    }
  }


  @override
  void onInit() {
    super.onInit();
    phoneController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    phoneController.dispose();
  }
}
