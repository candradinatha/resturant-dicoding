import 'dart:convert';

import 'package:path/path.dart';
import 'package:restaurant/data/model/restaurant_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static late Database _database;
  static DatabaseHelper? _databaseHelper;

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  Future<Database> get database async {
    _database = await _initializeDb();
    return _database;
  }

  static const String _tableRestaurantFavorites = 'restaurant_favorites';

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      join(path, 'restaurant_db.db'),
      onCreate: (db, version) async {
        await db.execute("CREATE TABLE $_tableRestaurantFavorites (id TEXT PRIMARY KEY, restaurant TEXT)",
        );
      },
      version: 1,
    );

    return db;
  }

  Future<void> addToFavorite(Restaurant restaurant) async {
    final db = await database;
    await db.insert(
      _tableRestaurantFavorites,
      {
        "id": restaurant.id,
        "restaurant": jsonEncode(
          restaurant,
        ).toString(),
      },
    );
  }

  Future<void> removeFromFavorite(Restaurant restaurant) async {
    final db = await database;
    await db.delete(
      _tableRestaurantFavorites,
      where: "id = ?",
      whereArgs: [restaurant.id],
    );
  }

  Future<List<Restaurant>> getFavorites() async {
    final db = await database;
    List<Map<String, dynamic>> results = await db.query(_tableRestaurantFavorites);
    return results.map((e) => Restaurant.fromJson(jsonDecode(e["restaurant"]))).toList();
  }

  Future<Restaurant?> getFavoriteById(String? id) async {
    final db = await database;
    List<Map<String, dynamic>> results = await db.query(_tableRestaurantFavorites,
      where: "id = ?",
      whereArgs: [id],
    );
    if (results.isNotEmpty) {
      return results.map((e) => Restaurant.fromJson(jsonDecode(e["restaurant"]))).first;
    }
    return null;
  }
}
