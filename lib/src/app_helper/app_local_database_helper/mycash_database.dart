import 'package:doctor/src/app_helper/app_local_database_helper/queries.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'name_constants.dart';

class DatabaseService {
  static DatabaseService? _instance;

  static DatabaseService getInstance() {
    _instance ??= DatabaseService();
    return _instance!;
  }

  static Database? _database;

  final List<String> _queries = [
    Queries.CREATE_CUISINE_TABLE,
  ];

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB(NameConstants.DB_NAME);
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final path = await getDatabasesPath();
    final databasePath = join(path, NameConstants.DB_NAME);
    return await openDatabase(
      databasePath,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    _queries.forEach(
          (query) async {
        await db.execute(query);
      },
    );
  }

  Future close() async {
    final db = await _instance?.database;
    db?.close();
  }

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  Future<int> insert(String table, Map<String, dynamic> row) async {
    Database db = await _instance!.database;
    return await db.insert(table, row,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  //Bulk insert
  Future<void> insertAll(String table, List<Map<String, dynamic>> data) async {
    Database db = await _instance!.database;
    Batch batch = db.batch();
    for(Map<String, dynamic> row in data) {
      batch.insert(table, row, conflictAlgorithm: ConflictAlgorithm.replace);
    }
    await batch.commit(continueOnError: true);
  }
  //Bulk insert with query
  Future<void> insertAllTranslation(String table, List<Map<String, dynamic>> data) async {
    Database db = await _instance!.database;
    await db.transaction((txn) async {
      int id1 = await txn.rawInsert(
          'INSERT INTO $table(name, value, num) VALUES("some name", 1234, 456.789)');
    });
  }
  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Map<String, dynamic>>> queryAllRows(String table) async {
    Database db = await _instance!.database;
    return await db.query(table);
  }

  Future<List<Map<String, dynamic>>> query(
      String table,
      String columnName,
      String condition,
      ) async {
    Database db = await _instance!.database;
    return await db
        .query(table, where: '$columnName = ?', whereArgs: [condition]);
  }

  Future<int> update({
    String? table,
    String? columnName,
    dynamic id,
    Map<String, dynamic>? row,
  }) async {
    Database db = await _instance!.database;
    return await db.update(table!, row!, where: '_id = ?', whereArgs: [id]);
  }

  Future<int> updateByColumn({
    required String table,
    required String columnName,
    dynamic id,
    required Map<String, dynamic> row,
  }) async {
    Database db = await _instance!.database;
    return await db.update(
      table,
      row,
      where: '$columnName = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteById(String table, String whereColumn, var id) async {
    Database db = await _instance!.database;
    int count =
    await db.delete(table, where: '$whereColumn = ?', whereArgs: [id]);
    print("Rows deleted : $count");
    return count;
  }

  Future<int> delete(String table) async {
    Database db = await _instance!.database;
    return await db.delete(
      table,
    );
  }
}
