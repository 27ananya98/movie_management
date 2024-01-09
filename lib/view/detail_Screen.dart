

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:movie_management/controller/detail_controller.dart';
import 'package:movie_management/main.dart';
import 'package:get/get.dart';
import 'package:movie_management/routes/RoutesClass.dart';

import '../model/single_movie_detail.dart';

class DetailScreen extends ParentWidget{
   DetailScreen({super.key});
  DetailController controller = Get.put(DetailController());

  @override
  Widget buildingView(BuildContext context, double h, double w) {
    return Obx(() => Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title:   Text('Movie Details'),

          ),
          body: SingleChildScrollView(
              child:Card(
                elevation: 4.0,
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    controller.movieModel.value.posterPath!=""&&controller.movieModel.value.posterPath!=null?
                    Image.network(
                      'https://image.tmdb.org/t/p/w500${controller.movieModel.value.posterPath??""}',
                      height: 200,
                      width: 150,
                    ):Container(),
                    SizedBox(height: 16),
                    Text(
                      controller.movieModel.value.title??"",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Release Date: ${controller.movieModel.value.releaseDate??""}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Overview: ${controller.movieModel.value.overview??""}',
                      style: TextStyle(fontSize: 16),
                    ),

                    SizedBox(height: 8),
                    Text(
                      'Status: ${controller.movieModel.value.status??""}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Runtime: ${controller.movieModel.value.runtime??""} minutes',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Tagline: ${controller.movieModel.value.tagline??""}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Vote Average: ${controller.movieModel.value.voteAverage??""}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Vote Count: ${controller.movieModel.value.voteCount??""}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Genres: ${_getGenresString(controller.movieModel.value.genres)}'),

                          Text('Popularity: ${controller.movieModel.value.popularity ?? 'Unknown'}'),
                          //Text('Homepage: ${controller.movieModel.value.homepage ?? 'No homepage available.'}'),
                          Text('Production Companies: ${_getProductionCompaniesString(controller.movieModel.value.productionCompanies)}'),
                          Text('Production Countries: ${_getProductionCountriesString(controller.movieModel.value.productionCountries)}'),
                          // Add more details as needed
                        ],
                      ),
                    ),

                    GestureDetector(
                      onTap: ()async{
                        Get.toNamed(RoutesClass.gotoBooking());
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

                        child:Text("Book Ticket",textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),),
                      ),
                    ),
                  ],
                )
              )
          ),
        ),
        Visibility(
          visible: controller.isDataLoading.value,
          child: Container(
            height: h,
            width: w,
            child: const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
                backgroundColor: Colors.transparent,
              ),
            ),
          ),
        )



      ],
    ));



  }

   String _getGenresString(List<Genre>? genres) {
     return genres?.map((genre) => genre.name ?? '').join(', ') ?? 'Unknown';
   }



   String _getProductionCompaniesString(List<ProductionCompany>? companies) {
     return companies?.map((company) => company.name ?? '').join(', ') ?? 'Unknown';
   }

   String _getProductionCountriesString(List<ProductionCountry>? countries) {
     return countries?.map((country) => country.name ?? '').join(', ') ?? 'Unknown';
   }

}