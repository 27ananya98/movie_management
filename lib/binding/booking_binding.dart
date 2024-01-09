

import 'package:get/get.dart';
import 'package:movie_management/controller/booking_controller.dart';
import 'package:movie_management/controller/home_controller.dart';

class BookingBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => BookingController());
  }

}