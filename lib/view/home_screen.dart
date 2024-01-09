import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_management/controller/home_controller.dart';
import 'package:movie_management/routes/RoutesClass.dart';
import '../main.dart';
import '../model/movie_lising_model.dart';

class HomeScreen extends ParentWidget {
  final HomeController controller = Get.put(HomeController());

  final AppBar movieDetailsAppBar = AppBar(
    title: const Text('Movie Details'),
  );

  final InputDecoration searchInputDecoration = const InputDecoration(
    fillColor: Colors.white,
    filled: true,
    contentPadding: EdgeInsets.symmetric(vertical: 17.0, horizontal: 15),
    hintText: "Search Here",
    hintStyle: TextStyle(fontSize: 14, color: Colors.black),
    prefixIcon: Icon(
      Icons.search,
      size: 22,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(6)),
      borderSide: BorderSide(width: 1, color: Colors.grey),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(6)),
      borderSide: BorderSide(width: 1, color: Colors.grey),
    ),
  );

  HomeScreen({super.key});

  @override
  Widget buildingView(BuildContext context, double h, double w) {
    Widget buildMovieCard(Results movie) {
      return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          controller.showPopupMenu(false);
          controller.saveHistory();
          Get.toNamed(RoutesClass.gotoDetail(), arguments: {
            "image": movie.backdropPath,
            "title": movie.title,
            "overview": movie.overview,
            "release_date": movie.releaseDate,
            "ratings": movie.voteAverage,
            "voteCount": movie.voteCount,
            "movie_id" :movie.id,
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 4.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                movie.backdropPath!=null&&movie.backdropPath!=""?Image.network(
                  'https://image.tmdb.org/t/p/w500${movie.backdropPath}',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ):Container(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    movie.title ?? "",
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    movie.overview ?? "",
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Release Date: ${movie.releaseDate ?? ""}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rating: ${movie.voteAverage ?? ""}',
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Vote Count: ${movie.voteCount ?? ""}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: controller.isMoreDataAvailable.value,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                ),
                Visibility(
                  visible: controller.movieList.isEmpty,
                  child: SizedBox(
                    height: h * 0.4,
                    child: const Center(
                      child: Text(
                        "No record",
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Obx(() => Stack(
          children: [
            GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                controller.showPopupMenu(false);
              },
              child: Scaffold(
                appBar: movieDetailsAppBar,
                body: Stack(
                  children: [
                    Column(
                      children: [
                        buildTextField(),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: controller.movieList.length,
                                  itemBuilder: (context, index) {
                                    final movie = controller.movieList[index];
                                    return buildMovieCard(movie);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (controller.showPopupMenu.value == true) buildPopupMenu(),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: controller.isDataLoading.value,
              child: SizedBox(
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

  Widget buildTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: TextField(
        controller: controller.searchController,
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black,
        ),
        decoration: searchInputDecoration,
        onTap: () => controller.showPopupMenu(true),
      ),
    );
  }

  Widget buildPopupMenu() {
    return Positioned(
      top: 80,
      left: 10,
      right: 10,
      child: Container(
        constraints: const BoxConstraints(maxHeight: 250),
        child: ListView.builder(
          itemCount: controller.hist.length,
          shrinkWrap: true,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              controller.searchController.text = controller.hist[index];
              controller.showPopupMenu(false);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: Colors.white,
              child: Text(controller.hist[index]),
            ),
          ),
        ),
      ),
    );
  }
}
