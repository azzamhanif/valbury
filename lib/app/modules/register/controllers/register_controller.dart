import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:valbury/app/routes/app_pages.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController
  late TextEditingController phoneController;
  late TextEditingController emailController;
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();


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
    }else if(RegExp('([ -]?\d+)+|\(\d+\)([ -]\d+)').hasMatch(value)){
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

  String? validateEmail(String? value){
    if(value!.isEmpty){
      Get.snackbar(
          "Opps something went wrong",
          'E-mail cannot be empty',
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.black.withOpacity(.6),
          margin: EdgeInsets.only(bottom: 8,left: 16,right: 16)
      );
      return 'E-mail cannot be empty';
    }
    else if(!value.isEmail){
      Get.snackbar(
          "Opps something went wrong",
          'Please enter a valid email address',
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white,
          backgroundColor: Colors.black.withOpacity(.6),
          margin: EdgeInsets.only(bottom: 8,left: 16,right: 16)

      );
      return 'Please enter a valid email address';
    }
    return null;
  }

  void checkRegister()async{
    final isValid = registerFormKey.currentState!.validate();
    if(isValid){
      loadingDialog();
      await Future.delayed(Duration(seconds: 2));
      Get.offAllNamed(Routes.DASHBOARD);
    }
  }

  void loadingDialog() async{
    await Duration(seconds: 2);
    await Get.defaultDialog(
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

  @override
  void onInit() {
    super.onInit();
    phoneController = TextEditingController();
    emailController = TextEditingController();

  }

  @override
  void onClose() {
    super.onClose();
    phoneController.dispose();
    emailController.dispose();
  }
}
