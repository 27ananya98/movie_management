

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movie_management/database/dao/movie_dao.dart';
import 'package:movie_management/database/entity/movie_details.dart';

import '../database/floor_helper.dart';

class BookingController extends GetxController{


var cust_name = TextEditingController().obs;
var cust_email = TextEditingController().obs;
var cust_id = TextEditingController().obs;
var contact = TextEditingController().obs;
var movieTitle = TextEditingController().obs;
var noOfTicket = TextEditingController().obs;
var dateAndTime = TextEditingController().obs;
late MovieDetailDao movieDetailDao;
var count = 0.obs;

@override
  void onInit() {

   movieDetailDao = FloorHelper.getMovieDao();
    super.onInit();
  }




  void bookTicket () async{
    var flag = false;
    movieDetailDao.getAllCount().then((value)  {
      count.value = value??0;
      print("Count==>${count}");
    });



    if(count.value == 0) {


      if(cust_name.value.text.isNotEmpty&&cust_email.value.text.isNotEmpty&&cust_id.value.text.isNotEmpty&&contact.value.text.isNotEmpty&&movieTitle.value.text.isNotEmpty&&noOfTicket.value.text.isNotEmpty&&dateAndTime.value.text.isNotEmpty) {
        var movieDetail = MovieDetailEntity(
            customerName: cust_name.value.text,
            customerEmail: cust_email.value.text,
            customerId: cust_id.value.text.toString(),
            contact: contact.value.text.toString(),
            movieTitle: movieTitle.value.text,
            noOfTicket: noOfTicket.value.text,
            dateNTime: dateAndTime.value.text);
        await movieDetailDao.insertMovieDetail(movieDetail);
        Get.snackbar('Ticket Booked ', 'Successfully');
      }else{
        Get.snackbar('Please ', 'Enter all details');
      }
    }else{
      movieDetailDao.getAllMovieList().then((value) async {

        print("value$value");
        for(var i = 0 ;i< count.value;i++){

        if(value[i].customerId==cust_id.value.text&&value[i].dateNTime== dateAndTime.value.text){

          flag=true;
        }
        }

        if(flag==true){
          Get.snackbar("Please Select ", "Different Date and Time");
      }
        else{
          if(cust_name.value.text.isNotEmpty&&cust_email.value.text.isNotEmpty&&cust_id.value.text.isNotEmpty&&contact.value.text.isNotEmpty&&movieTitle.value.text.isNotEmpty&&noOfTicket.value.text.isNotEmpty&&dateAndTime.value.text.isNotEmpty) {
            var movieDetail = MovieDetailEntity(
                customerName: cust_name.value.text,
                customerEmail: cust_email.value.text,
                customerId: cust_id.value.text.toString(),
                contact: contact.value.text.toString(),
                movieTitle: movieTitle.value.text,
                noOfTicket: noOfTicket.value.text,
                dateNTime: dateAndTime.value.text);
            await movieDetailDao.insertMovieDetail(movieDetail);
            Get.snackbar('Ticket Booked ', 'Successfully');
          }else{
            Get.snackbar('Please ', 'Enter all details');
          }
        }
      });
    }




    }
}