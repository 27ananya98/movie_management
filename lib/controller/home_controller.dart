import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_management/model/movie_lising_model.dart';

import '../common/CommonMethods.dart';
import '../common/Constants.dart';
import "package:http/http.dart" as http;
import '../common/sharedPreference.dart';

class HomeController extends GetxController {
  TextEditingController searchController = TextEditingController();
  var firstname = "".obs;
  var lastname = "".obs;
  var isDataLoading = false.obs;
  var movieListingModel = MovieListModel().obs;
  var baseurl = "https://api.themoviedb.org/3/";
  var page = 1.obs;
  var api_Key = "6b692b63427c54c00336888a46c856b5";
  var lang = "en-US";
  final scrollController = ScrollController().obs;
  var isMoreDataAvailable = false.obs;
  var searchString = "".obs;
  var movieList = List<Results>.empty(growable: true).obs;
  RxList hist = [].obs;
  RxBool showPopupMenu = false.obs;

  @override
  void onReady() {
    hitApiListing();

    super.onReady();
  }

  @override
  void onInit() {
    searchController.addListener(() {
      _onSearchTextChanged();
    });
    homeData();
    getHistory();
    hitApiListing();
    paginateTask();
    super.onInit();
  }

  Timer? _debounce;

  void _onSearchTextChanged() {
    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    }
    _debounce = Timer(const Duration(seconds: 3), () async {
      if (searchController.text.isNotEmpty) {
        getSearchData();
      }else{
        hitApiListing();
      }
    });
  }

  saveHistory() async {
    if (searchController.text.isNotEmpty) {
      List<dynamic> history = await appPreferences.getListPreference('history');
      if(!history.contains(searchController.text)) {
        history.add(searchController.text);
      }
      print(history);
      await appPreferences.saveListPreference('history', history.map((e) => e.toString()).toList());
      getHistory();
    }
  }

  getHistory() async {
    print("hist==>$hist");
    var temp = await appPreferences.getListPreference('history');
    print("hist==>$temp");
    temp.forEach((e) {
      hist.add(e);
    });
  }

  homeData() async {
    firstname.value = await appPreferences.getStringPreference(Constants.firstName);
    lastname.value = await appPreferences.getStringPreference(Constants.lastName);
  }

  void hitApiListing() async {
    var isConnected = await CommonMethods.checkInternetConnectivity();
    if (isConnected) {
      try {
        isDataLoading(true);
        http.Response response = await http.get(
          Uri.tryParse("${baseurl}movie/popular?api_key=$api_Key&language=$lang&Page=$page")!,
        );

        if (response.statusCode == 200) {
          var result = response.body;
          isDataLoading(false);
          print(" typeapi-==${result}");
          movieListingModel(MovieListModel.fromJson(json.decode(response.body)));
          movieList.clear();
          movieList.addAll(movieListingModel.value.results as Iterable<Results>);
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
    } else {
      showDailog();
    }
  }

  saveResentSearch() async {}

  Future<void> getSearchData() async {
    page.value = 1;
    // await clear();
    try {
      print('hit');
      http.Response response = await http.get(Uri.parse("https://api.themoviedb.org/3/search/movie?api_key=$api_Key&language=$lang&query=${searchController.text}&page=$page")
          // Uri.tryParse("${baseurl}search/movie?api_key=$api_Key&language=$lang&query=${searchController.text}&Page=$page")!,
          );
      print(response);
      if (response.statusCode == 200) {
        var result = response.body;
        isDataLoading(false);
        print(" typeapi-==${result}");
        movieListingModel(MovieListModel.fromJson(json.decode(response.body)));

        if (result.isNotEmpty) {
          isMoreDataAvailable(true);
          movieList.clear();
          movieList.addAll(movieListingModel.value.results as Iterable<Results>);
          if (movieList.isNotEmpty) {
            isMoreDataAvailable(false);
          }
        } else {
          movieList.clear();
          isMoreDataAvailable(false);
        }
      }
    } catch (e) {
      CommonMethods.showToast(" listing catch $e ");
      print('Error while getting data is $e');
    }
  }

  void paginateTask() {
    scrollController.value.addListener(() {
      if (scrollController.value.position.pixels == scrollController.value.position.maxScrollExtent) {
        isMoreDataAvailable(true);
        page++;
        // getMoreData();
        getMoreData();
        // Utils.printLog("increase page number $page");
      }
    });
  }

  void getMoreData() async {
    try {
      http.Response response = await http.get(
        Uri.tryParse("${baseurl}movie/popular?api_key=$api_Key&language=$lang&Page=$page")!,
      );

      if (response.statusCode == 200) {
        var result = response.body;
        isDataLoading(false);
        print(" typeapi-==${result}");
        movieListingModel(MovieListModel.fromJson(json.decode(response.body)));

        if (result.isNotEmpty) {
          isMoreDataAvailable(true);
        } else {
          isMoreDataAvailable(false);
          page--;
        }
        movieList.addAll(movieListingModel.value.results as Iterable<Results>);
        isMoreDataAvailable(false);
      }
    } catch (e) {
      CommonMethods.showToast(" listing catch $e ");
      print('Error while getting data is $e');
    }
  }

  static showDailog() {
    Get.defaultDialog(
        title: '',
        content: Column(
          children: <Widget>[
            Text(
              "No Internet",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "Please Check your internet",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              await Future.delayed(Duration(seconds: 1));
              Get.back();
            },
            child: Text("Ok"),
          )
        ]);
  }
}
