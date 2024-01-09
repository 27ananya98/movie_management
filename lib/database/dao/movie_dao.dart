import 'package:floor/floor.dart';
import 'package:movie_management/database/entity/movie_details.dart';

@dao
abstract class MovieDetailDao{
  @Query("SELECT * FROM MovieDetailEntity")
  Future<List<MovieDetailEntity>> getAllMovieList();

  @Query("SELECT COUNT(*) FROM MovieDetailEntity")
  Future<int?> getAllCount();

  @Query("SELECT * FROM MovieDetailEntity WHERE customerId=:customerId and dateNTime =:dateNTime")
  Future<MovieDetailEntity?> getDateTime(String customerId,String dateNTime);


  @insert
  Future<void> insertMovieDetail(MovieDetailEntity movieDetailEntity);

  @update
  Future<void> updateMovieDetail(MovieDetailEntity movieDetailEntity);

  @delete
  Future<void> deleteMovieDetail(MovieDetailEntity movieDetailEntity);
}