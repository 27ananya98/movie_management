

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../common/CommonMethods.dart';
import '../common/Constants.dart';
import "package:http/http.dart" as http;

import '../common/CommonMethods.dart';
import '../model/single_movie_detail.dart';

class DetailController extends GetxController{
  var image ="".obs;
  var title = "".obs;
  var overview = "".obs;
  var releaseDate = "".obs;
  var rating = 0.0.obs;
  var baseurl ="https://api.themoviedb.org/3/movie/";
  var page = 1.obs;
  var api_Key ="6b692b63427c54c00336888a46c856b5";
  var lang = "en-US";
  var movieId = 0.obs;
  var movieModel = MovieDetailModel().obs;

  var isDataLoading = false.obs;
  var voteCount = 0.obs;

  @override
  void onInit() {
    image.value= Get.arguments['image'];
    title.value= Get.arguments['title'];
    overview.value= Get.arguments['overview'];
    releaseDate.value= Get.arguments['release_date'];
    rating.value= Get.arguments['ratings'];
    voteCount.value= Get.arguments['voteCount'];
    movieId.value = Get.arguments['movie_id'];
    hitApiListing();
    super.onInit();
  }



  void hitApiListing() async {
    var isConnected=await CommonMethods.checkInternetConnectivity();
    if(isConnected) {
      try {
        isDataLoading(true);
        http.Response response = await http.get(
          Uri.tryParse("${baseurl}${movieId.value}?api_key=$api_Key&language=$lang&Page=$page")!,
        );

        if (response.statusCode == 200) {
          var result = response.body;
          isDataLoading(false);
          print(" typeapi-==${result}");
          movieModel(
              MovieDetailModel.fromJson(json.decode(response.body)));

        } else {
          CommonMethods.showToast(" listing $response ");
          print('Error while getting data is $response');
        }
      } catch (e) {
        CommonMethods.showToast(" listing catch $e ");
        print('Error while getting data is $e');
      } finally {
        isDataLoading(false);
      }
    }else{
      showDailog();
    }


  }

  static showDailog(){
    Get.defaultDialog(
        title: '',
        content:Column(
          children: <Widget>[

            Text("No Internet",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500,),textAlign: TextAlign.center,),
            Text("Please Check your internet",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500,),textAlign: TextAlign.center,),
          ],
        ),
        actions: <Widget>[ TextButton(onPressed: () async {
          await Future.delayed(Duration(seconds: 1));
          Get.back();
        },
          child: Text("Ok"),
        )]
    );
  }
  // void hitApiListing() async {
  //   var isConnected=await CommonMethods.checkInternetConnectivity();
  //   if(isConnected) {
  //     try {
  //       isDataLoading(true);
  //       http.Response response = await http.get(
  //         Uri.tryParse("${baseurl}api_key=$api_Key&language=$lang&Page=$page")!,
  //       );
  //
  //       if (response.statusCode == 200) {
  //         var result = response.body;
  //         isDataLoading(false);
  //         print(" typeapi-==${result}");
  //         movieListingModel(
  //             MovieListModel.fromJson(json.decode(response.body)));
  //
  //       } else {
  //         CommonMethods.showToast(" listing $response ");
  //         print('Error while getting data is $response');
  //       }
  //     } catch (e) {
  //       CommonMethods.showToast(" listing catch $e ");
  //       print('Error while getting data is $e');
  //     } finally {
  //       isDataLoading(false);
  //     }
  //   }else{
  //     showDailog();
  //   }
  // }
}