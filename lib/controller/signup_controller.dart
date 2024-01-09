

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movie_management/common/CommonMethods.dart';
import 'package:movie_management/common/sharedPreference.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common/Constants.dart';
import '../routes/RoutesClass.dart';

class SignupController extends GetxController{

  var password = TextEditingController().obs;
  var email = TextEditingController().obs;
  var first = TextEditingController().obs;
  var last = TextEditingController().obs;
  var phone = TextEditingController().obs;
  var passwordShow = true.obs;



   saveCredential() async {
     if(password.value.text.isNotEmpty||email.value.text.isNotEmpty){
     await appPreferences.saveStringPreference(Constants.firstName,first.value.text );
     await appPreferences.saveStringPreference(Constants.lastName,last.value.text );
     await appPreferences.saveStringPreference(Constants.mobileNo,phone.value.text );
     await appPreferences.saveStringPreference(Constants.email,email.value.text );
     await appPreferences.saveStringPreference(Constants.password,password.value.text );
     Get.snackbar('Account Created ','Successfully' );
     Get.offAllNamed(RoutesClass.gotoLogin());
     }
     else{
       Get.snackbar('Please Enter valid ','Email and Password' );
     }

     
     String? savedEmail = await appPreferences.getStringPreference(Constants.email);
     print('Saved email: $savedEmail');


     printPreferences();
   }



  printPreferences() async {
    SharedPreferences prefs = await AppPreferences.getSharedPreferencesInstance();
    print('All Preferences:');
    prefs.getKeys().forEach((key) {
      print('$key: ${prefs.get(key)}');
    });
  }
}