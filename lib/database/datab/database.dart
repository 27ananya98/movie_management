

import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:movie_management/database/entity/movie_details.dart';

import '../dao/movie_dao.dart';
part 'database.g.dart';

@Database(version: 1, entities: [MovieDetailEntity])

abstract class AppDatabase extends FloorDatabase{
  MovieDetailDao get movieDetailDao;

}