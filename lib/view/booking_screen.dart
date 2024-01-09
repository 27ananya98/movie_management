

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:intl/intl.dart';
import 'package:movie_management/main.dart';
import 'package:get/get.dart';
import '../controller/booking_controller.dart';


class BookingScreen extends ParentWidget{

   BookingController controller =  Get.put(BookingController());
  @override
  Widget buildingView(BuildContext context, double h, double w) {
    return Obx(() => Scaffold(
      appBar: AppBar(

        title: Text("Booking details"),
      ),

      body: Container(
        height: h,
        width: w,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 12.0,left: 12.0,top: 10),
                width: w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4.0, // soften the shadow
                      spreadRadius: 1.0, //extend the shadow
                    )
                  ],
                  borderRadius:BorderRadius.all(Radius.circular(14.0)),

                ),
                child: Container(
                  padding: EdgeInsets.fromLTRB(15,10,15,10),
                  child: Row(
                    children: [
                      Text("${"Customer Name"}:",style: TextStyle(
                        fontSize: 14, color: Colors.black,

                      )),
                      Spacer(),
                      Container(
                        width: w*0.5,

                        child: TextField(
                          controller: controller.cust_name.value,
                          maxLength: 30,
                          onChanged: (value){

                          },
                          onSubmitted: (value){
                            // CommonMethods.inputFocusChange(context, controller.afterEditingFocusNode[index], controller.ampsFocusNode[index]);
                          },
                          keyboardType: TextInputType.text,
                          // obscureText: controller.passwordShow.value,
                          style: TextStyle(fontSize: 14, color: Colors.black, ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            counterText: "",
                            fillColor: Colors.white,
                            filled: true,

                            contentPadding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 5),
                            hintStyle: TextStyle(fontSize: 15,

                                color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),

                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 12.0,left: 12.0,top: 10),
                width: w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4.0, // soften the shadow
                      spreadRadius: 1.0, //extend the shadow
                    )
                  ],
                  borderRadius:BorderRadius.all(Radius.circular(14.0)),

                ),
                child: Container(
                  padding: EdgeInsets.fromLTRB(15,10,15,10),
                  child: Row(
                    children: [
                      Text("${"Customer Email"}:",style: TextStyle(
                        fontSize: 14, color: Colors.black,

                      )),
                      Spacer(),
                      Container(
                        width: w*0.5,

                        child: TextField(
                          controller: controller.cust_email.value,
                          maxLength: 30,
                          onChanged: (value){

                          },
                          onSubmitted: (value){
                            // CommonMethods.inputFocusChange(context, controller.afterEditingFocusNode[index], controller.ampsFocusNode[index]);
                          },
                          keyboardType: TextInputType.text,
                          // obscureText: controller.passwordShow.value,
                          style: TextStyle(fontSize: 14, color: Colors.black, ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            counterText: "",
                            fillColor: Colors.white,
                            filled: true,

                            contentPadding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 5),
                            hintStyle: TextStyle(fontSize: 15,

                                color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),

                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 12.0,left: 12.0,top: 10),
                width: w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4.0, // soften the shadow
                      spreadRadius: 1.0, //extend the shadow
                    )
                  ],
                  borderRadius:BorderRadius.all(Radius.circular(14.0)),

                ),
                child: Container(
                  padding: EdgeInsets.fromLTRB(15,10,15,10),
                  child: Row(
                    children: [
                      Text("${"Customer ID"}:",style: TextStyle(
                        fontSize: 14, color: Colors.black,

                      )),
                      Spacer(),
                      Container(
                        width: w*0.5,

                        child: TextField(
                          controller: controller.cust_id.value,
                          maxLength: 30,
                          onChanged: (value){

                          },
                          onSubmitted: (value){
                            // CommonMethods.inputFocusChange(context, controller.afterEditingFocusNode[index], controller.ampsFocusNode[index]);
                          },
                          keyboardType: TextInputType.number,
                          // obscureText: controller.passwordShow.value,
                          style: TextStyle(fontSize: 14, color: Colors.black, ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            counterText: "",
                            fillColor: Colors.white,
                            filled: true,

                            contentPadding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 5),
                            hintStyle: TextStyle(fontSize: 15,

                                color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),

                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 12.0,left: 12.0,top: 10),
                width: w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4.0, // soften the shadow
                      spreadRadius: 1.0, //extend the shadow
                    )
                  ],
                  borderRadius:BorderRadius.all(Radius.circular(14.0)),

                ),
                child: Container(
                  padding: EdgeInsets.fromLTRB(15,10,15,10),
                  child: Row(
                    children: [
                      Text("${"Contact No"}:",style: TextStyle(
                        fontSize: 14, color: Colors.black,

                      )),
                      Spacer(),
                      Container(
                        width: w*0.5,

                        child: TextField(
                          controller: controller.contact.value,
                          maxLength: 30,
                          onChanged: (value){

                          },
                          onSubmitted: (value){
                            // CommonMethods.inputFocusChange(context, controller.afterEditingFocusNode[index], controller.ampsFocusNode[index]);
                          },
                          keyboardType: TextInputType.number,
                          // obscureText: controller.passwordShow.value,
                          style: TextStyle(fontSize: 14, color: Colors.black, ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            counterText: "",
                            fillColor: Colors.white,
                            filled: true,

                            contentPadding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 5),
                            hintStyle: TextStyle(fontSize: 15,

                                color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),

                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 12.0,left: 12.0,top: 10),
                width: w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4.0, // soften the shadow
                      spreadRadius: 1.0, //extend the shadow
                    )
                  ],
                  borderRadius:BorderRadius.all(Radius.circular(14.0)),

                ),
                child: Container(
                  padding: EdgeInsets.fromLTRB(15,10,15,10),
                  child: Row(
                    children: [
                      Text("${"Movie Title"}:",style: TextStyle(
                        fontSize: 14, color: Colors.black,

                      )),
                      Spacer(),
                      Container(
                        width: w*0.5,

                        child: TextField(
                          controller: controller.movieTitle.value,
                          maxLength: 30,
                          onChanged: (value){

                          },
                          onSubmitted: (value){
                            // CommonMethods.inputFocusChange(context, controller.afterEditingFocusNode[index], controller.ampsFocusNode[index]);
                          },
                          keyboardType: TextInputType.text,
                          // obscureText: controller.passwordShow.value,
                          style: TextStyle(fontSize: 14, color: Colors.black, ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            counterText: "",
                            fillColor: Colors.white,
                            filled: true,

                            contentPadding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 5),
                            hintStyle: TextStyle(fontSize: 15,

                                color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),

                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 12.0,left: 12.0,top: 10),
                width: w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4.0, // soften the shadow
                      spreadRadius: 1.0, //extend the shadow
                    )
                  ],
                  borderRadius:BorderRadius.all(Radius.circular(14.0)),

                ),
                child: Container(
                  padding: EdgeInsets.fromLTRB(15,10,15,10),
                  child: Row(
                    children: [
                      Text("${"No of Tickets"}:",style: TextStyle(
                        fontSize: 14, color: Colors.black,

                      )),
                      Spacer(),
                      Container(
                        width: w*0.5,

                        child: TextField(
                          controller: controller.noOfTicket.value,
                          maxLength: 30,

                          onChanged: (value){

                          },
                          onSubmitted: (value){
                            // CommonMethods.inputFocusChange(context, controller.afterEditingFocusNode[index], controller.ampsFocusNode[index]);
                          },
                          keyboardType: TextInputType.number,
                          // obscureText: controller.passwordShow.value,
                          style: TextStyle(fontSize: 14, color: Colors.black, ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            counterText: "",
                            fillColor: Colors.white,
                            filled: true,

                            contentPadding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 5),
                            hintStyle: TextStyle(fontSize: 15,

                                color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),

                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 12.0,left: 12.0,top: 10),
                width: w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4.0, // soften the shadow
                      spreadRadius: 1.0, //extend the shadow
                    )
                  ],
                  borderRadius:BorderRadius.all(Radius.circular(14.0)),

                ),
                child: Container(
                  padding: EdgeInsets.fromLTRB(15,10,15,10),
                  child: Row(
                    children: [
                      Text("${"Pick Date and Time"}:",style: TextStyle(
                        fontSize: 14, color: Colors.black,

                      )),
                      Spacer(),
                      Container(
                        width: w*0.5,

                        child: TextField(
                          controller: controller.dateAndTime.value,
                          maxLength: 30,
                          readOnly: true,
                          onChanged: (value){

                          },
                          onTap: (){
                            print("Tab..");
                            dateTimePickerWidget(context);
                          },
                          onSubmitted: (value){
                            // CommonMethods.inputFocusChange(context, controller.afterEditingFocusNode[index], controller.ampsFocusNode[index]);
                          },
                          keyboardType: TextInputType.text,
                          // obscureText: controller.passwordShow.value,
                          style: TextStyle(fontSize: 14, color: Colors.black, ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            counterText: "",
                            fillColor: Colors.white,
                            filled: true,
                            prefixIcon: IconButton(
                              onPressed: () async{

                                dateTimePickerWidget(context);


                              }
                              , icon: Icon(Icons.calendar_today), ),

                            contentPadding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 5),
                            hintStyle: TextStyle(fontSize: 15,

                                color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),

                ),
              ),
              SizedBox(
                height: 20.0,
              ),

              GestureDetector(
                onTap: ()async{
                  controller.bookTicket();

                },
                child: Container(
                  width: w,
                  height: 30,
                  margin:EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0) ,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 4.0,
                          spreadRadius: 1.0, //extend the shadow
                        )
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(14.0))
                  ),

                  child:Text("Book Ticket",textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),),
                ),
              ),

            ],
          ),
        ),
      ),
    ));
  }

   dateTimePickerWidget(BuildContext context) {
     return DatePicker.showDatePicker(
       context,
       dateFormat: 'dd MMMM yyyy HH:mm',
       initialDateTime: DateTime.now(),
       minDateTime: DateTime(2023),
       maxDateTime:DateTime.now().add(Duration(days: 365)),
       onMonthChangeStartWithFirstDate: true,
       onConfirm: (dateTime, List<int> index) {
         DateTime selectdate = dateTime;
          final selIOS = DateFormat('yyyy-mm-dd HH:mm').format(selectdate);
          print(selIOS);
          controller.dateAndTime.value.text= selIOS;
       },
     );
   }

}