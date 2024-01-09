import 'package:get/get.dart';
import 'package:movie_management/binding/booking_binding.dart';
import 'package:movie_management/binding/detail_binding.dart';
import 'package:movie_management/binding/home_binding.dart';
import 'package:movie_management/binding/login_binding.dart';
import 'package:movie_management/binding/signup_binding.dart';
import 'package:movie_management/view/booking_screen.dart';
import 'package:movie_management/view/home_screen.dart';
import 'package:movie_management/view/login_screen.dart';
import 'package:movie_management/view/signUp_screen.dart';

import '../view/detail_Screen.dart';






class RoutesClass {
  //BR1
  static String login = '/login';
  static String signup = '/signup';
  static String home = '/home';
  static String detail = '/detail';
  static String booking = '/booking';


  //BR1
  static String gotoLogin() => login;
  static String gotoSignup() => signup;
  static String gotoHome() => home;
  static String gotoDetail() => detail;
  static String gotoBooking() => booking;
  //BR1
  static List<GetPage> routes = [
   GetPage(
        name: login,
        page: () =>  LoginScreen(),
        transition: Transition.fade,
        transitionDuration: const Duration(milliseconds: 300),
        binding: LoginBinding()
    ),
    GetPage(
        name: signup,
        page: () =>  SignupScreen(),
        transition: Transition.fade,
        transitionDuration: const Duration(milliseconds: 300),
        binding: SignUpBinding()
    ),


    GetPage(
        name: home,
        page: () =>  HomeScreen(),
        transition: Transition.fade,
        transitionDuration: const Duration(milliseconds: 300),
        binding: HomeBinding()
    ),
    GetPage(
        name: detail,
        page: () =>  DetailScreen(),
        transition: Transition.fade,
        transitionDuration: const Duration(milliseconds: 300),
        binding: DetailBinding()
    ),
    GetPage(
        name: booking,
        page: () =>  BookingScreen(),
        transition: Transition.fade,
        transitionDuration: const Duration(milliseconds: 300),
        binding: BookingBinding()
    )


  ];
}
