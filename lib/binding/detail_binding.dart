

import 'package:get/get.dart';
import 'package:movie_management/controller/detail_controller.dart';

class DetailBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => DetailController());
  }

}