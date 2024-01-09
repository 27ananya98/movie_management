

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../common/Constants.dart';
import '../common/sharedPreference.dart';
import '../routes/RoutesClass.dart';

class LoginController extends GetxController{
  var email = TextEditingController().obs;
  var password = TextEditingController().obs;
  var passwordShow = true.obs;


  @override
  void onInit() {
    checkLogin();
  }
  checkLogin()async{
    if(await appPreferences.getBoolPreference('login')==true){
      Get.offAllNamed(RoutesClass.gotoHome());
    }
  }
  login() async {
    String? savedEmail = await appPreferences.getStringPreference(Constants.email);
    String? savedPassword = await appPreferences.getStringPreference(Constants.password);

    if (email.value.text == savedEmail && password.value.text == savedPassword) {
      print("Login innnn");
      await appPreferences.saveBoolPreference('login',true);
      Get.offAllNamed(RoutesClass.gotoHome());
      Get.snackbar('Logged in', 'Successfully');
    } else {

      Get.snackbar('Login Failed', 'Invalid email or password');
    }
  }
}