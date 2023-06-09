import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:valbury/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        titleTextStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
        elevation: 0,
        title: const Text('LOGIN'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16,),
        child: Form(
          key: controller.loginFormKey,
          child: SingleChildScrollView(
            child: Container(
              height: Get.height*.9,
              child: Column(
                children: [
                  Expanded(
                      child: Column(
                        children: [
                          Image.asset('assets/images/logo.png',height: 200,),
                          SizedBox(height: 16,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                width: 50,
                                height: 45,
                                decoration: BoxDecoration(
                                  color: Colors.deepOrangeAccent,
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20))
                                ),
                                child: Center(child: Text('+62 ',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                              ),
                              SizedBox(width: 4,),
                              Expanded(
                                child: TextFormField(
                                  validator: (value){
                                    return controller.validatePhoneNumber(value);
                                  },
                                  maxLength: 10,
                                  controller: controller.phoneController,
                                  keyboardType: TextInputType.phone,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.orange.withOpacity(.07),
                                    hintText: 'Phone Number',
                                    contentPadding:
                                    const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(25.7),topRight: Radius.circular(25.7),),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.orange),
                                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(25.7),topRight: Radius.circular(25.7),),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.orange),
                                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(25.7),topRight: Radius.circular(25.7),),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.white),
                                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(25.7),topRight: Radius.circular(25.7),),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8,),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('Don\'t have an account ? '),
                                InkWell(
                                    onTap: (){
                                      Get.offNamed(Routes.REGISTER);
                                    },
                                    child: Text('Register Now!',style: TextStyle(fontSize: 12,color: Colors.deepOrangeAccent,fontWeight: FontWeight.bold),))
                              ],
                            ),
                          )
                        ],
                      )
                  ),
                  SizedBox(height: 32,),
                  SizedBox(
                    width: Get.width,
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.deepOrangeAccent),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0),
                                side: BorderSide(color: Colors.deepOrangeAccent,)
                            )
                        )
                      ),
                      onPressed: ()async{
                        controller.checkLogin();
                      },
                      child: Text('Login'),
                    ),
                  ),
                  SizedBox(height: 32,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
