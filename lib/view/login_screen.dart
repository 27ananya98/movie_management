

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:movie_management/controller/home_controller.dart';
import 'package:movie_management/controller/login_controller.dart';
import 'package:movie_management/main.dart';
import 'package:movie_management/routes/RoutesClass.dart';

import '../resources/colors.dart';

class LoginScreen extends ParentWidget {
  LoginController controller = Get.put(LoginController());
  @override
  Widget buildingView(BuildContext context, double h, double w) {
    // TODO: implement buildingView
    return   Obx(() => Container(
      height: h,
      width: w,
      decoration: BoxDecoration(
        // Box decoration takes a gradient
        gradient: LinearGradient(
          // Where the linear gradient begins and ends
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          // Add one stop for each color. Stops should increase from 0 to 1
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: [
            // Colors are easy thanks to Flutter's Colors class.
            Colors.white,
            Colors.grey,
            Colors.black26
          ],
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment:  MainAxisAlignment.center,
          children: [
            SizedBox(
              height: h*0.15,
            ),
            Container(
              width: w,
              child: Center(
                child: Text("Log In",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.black
                ) ,),
              ),
            ),


            Container(
              // padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
              margin:EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0) ,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4.0,
                      // soften the shadow
                      spreadRadius: 1.0, //extend the shadow
                    )
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(14.0))
              ),

              child:TextField(
                controller: controller.email.value,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10.0),
                    hintText: "Email Address",
                    hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w300

                    )
                ),
              ),
            ),
            Container(
              // padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
              margin:EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0) ,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4.0,
                      // soften the shadow
                      spreadRadius: 1.0, //extend the shadow
                    )
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(14.0))
              ),

              child:TextField(
                controller: controller.password.value,
                keyboardType: TextInputType.text,
                obscureText:  controller.passwordShow.value,

                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10.0),
                    hintText: "Password",
                    hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,



                    ),
                  suffixIcon: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  child: Icon(controller.passwordShow.value ?Icons.visibility_outlined : Icons.visibility_off_outlined),
                  onTap: (){
                    controller.passwordShow.value = !controller.passwordShow.value;
                  },
                ),
                  suffixIconColor: Colors.grey
                ),
              ),
            ),

            GestureDetector(
              onTap: ()async{
                await controller.login();
              },
              child: Container(
                width: w,
                height: 30,
                // padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
                margin:EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0) ,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 4.0,
                        // soften the shadow
                        spreadRadius: 1.0, //extend the shadow
                      )
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(14.0))
                ),

                child:Text("Login",textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),),
              ),
            ),
            SizedBox(
              height: h*0.45,
            ),

            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Don’t have an account? ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w300,

                    ),
                  ),
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.toNamed(RoutesClass.gotoSignup());
                      },
                    text: 'Sign Up',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            )





          ],
        ),
      ),
    ));
  }
}