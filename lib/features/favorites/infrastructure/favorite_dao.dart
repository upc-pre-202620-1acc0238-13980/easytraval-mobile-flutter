import 'package:easy_travel/core/app_database.dart';
import 'package:sqflite/sqlite_api.dart';

class FavoriteDao {
  final AppDatabase appDatabase;
  const new({required this.appDatabase});

  Future<List<int>> getFavorites() async {
    Database database = await appDatabase.database;
    List maps = await database.query('favorites');
    return maps.map((e) => e['id'] as int).toList();
  }

  Future<void> addFavorite(int id) async {
    Database database = await appDatabase.database;
    await database.insert('favorites', {'id': id});
  }

  Future<void> removeFavorite(int id) async {
    Database database = await appDatabase.database;
    await database.delete('favorites', where: 'id = ?', whereArgs: [id]);
  }
}
