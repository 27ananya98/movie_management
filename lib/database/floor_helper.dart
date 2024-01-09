



import 'package:movie_management/database/dao/movie_dao.dart';

import 'datab/database.dart';

class FloorHelper {

  static var database;

  static Future<void> initDatabase()
  async {
    database = await $FloorAppDatabase.databaseBuilder("movie.db").build();
  }
  static MovieDetailDao getMovieDao(){
    return  database.movieDetailDao;
  }

}