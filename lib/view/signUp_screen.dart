


import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:movie_management/controller/signup_controller.dart';
import 'package:movie_management/main.dart';

import '../routes/RoutesClass.dart';

class SignupScreen extends ParentWidget{
  SignupController controller = Get.put(SignupController());
  @override
  Widget buildingView(BuildContext context, double h, double w) {
    return Obx(() => Scaffold(
      body: Container(
        height: h,
        width: w,
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment:  MainAxisAlignment.t,
            children: [
              SizedBox(
                height: h*0.1,
              ),
          
              Container(
                width: w,
                child: Center(
                  child: Text("Sign Up",style: TextStyle(
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
                  controller: controller.first.value,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(10.0),
                      hintText: "First Name",
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
                  controller: controller.last.value,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(10.0),
                      hintText: "Last Name",
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
                  controller:  controller.phone.value,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(10.0),
                      hintText: "Mobile No.",
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
                  obscureText:  true,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(10.0),
                      hintText: "Password",
                      hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w300
          
                      )
                  ),
                ),
              ),
          
              GestureDetector(
                onTap: (){
                  controller.saveCredential();
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
          
                  child:Text("Sign up",textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),),
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Already have an account? ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
          
                      ),
                    ),
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.toNamed(RoutesClass.gotoLogin());
                        },
                      text: 'Login',
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
      ),
    ));
  }

}