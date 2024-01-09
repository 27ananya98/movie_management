// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  MovieDetailDao? _movieDetailDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `MovieDetailEntity` (`movieId` INTEGER PRIMARY KEY AUTOINCREMENT, `customerName` TEXT, `customerEmail` TEXT, `customerId` TEXT, `contact` TEXT, `movieTitle` TEXT, `noOfTicket` TEXT, `dateNTime` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  MovieDetailDao get movieDetailDao {
    return _movieDetailDaoInstance ??=
        _$MovieDetailDao(database, changeListener);
  }
}

class _$MovieDetailDao extends MovieDetailDao {
  _$MovieDetailDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _movieDetailEntityInsertionAdapter = InsertionAdapter(
            database,
            'MovieDetailEntity',
            (MovieDetailEntity item) => <String, Object?>{
                  'movieId': item.movieId,
                  'customerName': item.customerName,
                  'customerEmail': item.customerEmail,
                  'customerId': item.customerId,
                  'contact': item.contact,
                  'movieTitle': item.movieTitle,
                  'noOfTicket': item.noOfTicket,
                  'dateNTime': item.dateNTime
                }),
        _movieDetailEntityUpdateAdapter = UpdateAdapter(
            database,
            'MovieDetailEntity',
            ['movieId'],
            (MovieDetailEntity item) => <String, Object?>{
                  'movieId': item.movieId,
                  'customerName': item.customerName,
                  'customerEmail': item.customerEmail,
                  'customerId': item.customerId,
                  'contact': item.contact,
                  'movieTitle': item.movieTitle,
                  'noOfTicket': item.noOfTicket,
                  'dateNTime': item.dateNTime
                }),
        _movieDetailEntityDeletionAdapter = DeletionAdapter(
            database,
            'MovieDetailEntity',
            ['movieId'],
            (MovieDetailEntity item) => <String, Object?>{
                  'movieId': item.movieId,
                  'customerName': item.customerName,
                  'customerEmail': item.customerEmail,
                  'customerId': item.customerId,
                  'contact': item.contact,
                  'movieTitle': item.movieTitle,
                  'noOfTicket': item.noOfTicket,
                  'dateNTime': item.dateNTime
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<MovieDetailEntity> _movieDetailEntityInsertionAdapter;

  final UpdateAdapter<MovieDetailEntity> _movieDetailEntityUpdateAdapter;

  final DeletionAdapter<MovieDetailEntity> _movieDetailEntityDeletionAdapter;

  @override
  Future<List<MovieDetailEntity>> getAllMovieList() async {
    return _queryAdapter.queryList('SELECT * FROM MovieDetailEntity',
        mapper: (Map<String, Object?> row) => MovieDetailEntity(
            customerName: row['customerName'] as String?,
            customerEmail: row['customerEmail'] as String?,
            customerId: row['customerId'] as String?,
            contact: row['contact'] as String?,
            movieTitle: row['movieTitle'] as String?,
            noOfTicket: row['noOfTicket'] as String?,
            dateNTime: row['dateNTime'] as String?));
  }

  @override
  Future<int?> getAllCount() async {
    return _queryAdapter.query('SELECT COUNT(*) FROM MovieDetailEntity',
        mapper: (Map<String, Object?> row) => row.values.first as int);
  }

  @override
  Future<MovieDetailEntity?> getDateTime(
    String customerId,
    String dateNTime,
  ) async {
    return _queryAdapter.query(
        'SELECT * FROM MovieDetailEntity WHERE customerId=?1 and dateNTime =?2',
        mapper: (Map<String, Object?> row) => MovieDetailEntity(
            customerName: row['customerName'] as String?,
            customerEmail: row['customerEmail'] as String?,
            customerId: row['customerId'] as String?,
            contact: row['contact'] as String?,
            movieTitle: row['movieTitle'] as String?,
            noOfTicket: row['noOfTicket'] as String?,
            dateNTime: row['dateNTime'] as String?),
        arguments: [customerId, dateNTime]);
  }

  @override
  Future<void> insertMovieDetail(MovieDetailEntity movieDetailEntity) async {
    await _movieDetailEntityInsertionAdapter.insert(
        movieDetailEntity, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateMovieDetail(MovieDetailEntity movieDetailEntity) async {
    await _movieDetailEntityUpdateAdapter.update(
        movieDetailEntity, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteMovieDetail(MovieDetailEntity movieDetailEntity) async {
    await _movieDetailEntityDeletionAdapter.delete(movieDetailEntity);
  }
}
