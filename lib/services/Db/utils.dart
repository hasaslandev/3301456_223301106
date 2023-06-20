import 'dart:async';
import 'package:path/path.dart';
import 'package:randevu/models/bildirimModel.dart';
import 'package:sqflite/sqflite.dart';


class DbUtils {

  static final DbUtils _dbUtils = DbUtils._internal();

  DbUtils._internal();

  factory DbUtils() {
    return _dbUtils;
  }

  static Database? _db;

  Future<Database?> get db async {
    _db ??= await initializeDb();
    return _db;
  }

  Future<Database> initializeDb() async {
    String path = join(await getDatabasesPath(), 'bildirim_database.db');
    var dbBildirims= await openDatabase(path, version: 1, onCreate: _createDb);
    return dbBildirims;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE bildirims(id INTEGER PRIMARY KEY, TC TEXT, fiyat INTEGER)");
  }

  Future<void> deleteTable() async {
    final Database? db = await this.db;
    db?.delete('bildirims');
  }

  Future<void> insertBildirim(BildirimModel bildirim) async {
    final Database? db = await this.db;
    await db?.insert(
      'bildirims',
      bildirim.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<BildirimModel>> bildirims() async {
    // Get a reference to the database.
    final Database? db = await this.db;
    final List<Map<String, Object?>>? maps = await db?.query('bildirims');

    return List.generate(maps!.length, (i) {
      return BildirimModel(
        id: int.parse(maps[i]['id'].toString()),
        TC: maps[i]['TC'].toString(),
        fiyat: int.parse(maps[i]['fiyat'].toString()),
      );
    });
  }

  Future<void> updateBildirim(BildirimModel bildirim) async {
    final db = await this.db;
    await db?.update(
      'bildirims',
      bildirim.toMap(),
      where: "id = ?",
      whereArgs: [bildirim.id],
    );
  }

  Future<void> deleteBildirim(int id) async {
    final db = await this.db;
    await db?.delete(
      'bildirims',
      where: "id = ?",
      whereArgs: [id],
    );
  }

}