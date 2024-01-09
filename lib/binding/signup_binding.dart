


import 'package:get/get.dart';
import 'package:movie_management/controller/login_controller.dart';
import 'package:movie_management/controller/signup_controller.dart';

class SignUpBinding  extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SignupController());
  }
}