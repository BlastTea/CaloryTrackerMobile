part of 'services.dart';

class DbHelper {
  DbHelper._internal();

  static DbHelper? _instance;

  static Future<DbHelper> initialize() async {
    _instance = DbHelper._internal();

    _instance!.db = await openDatabase(
      joinAll([await getDatabasesPath(), 'calory_tracker.db']),
      version: await AppHelper.getDatabaseVersion(),
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE users (
          username TEXT PRIMARY KEY,
          password TEXT,
          date_of_birth INTEGER,
          gender TEXT
        )
        ''');

        await db.execute('''
        CREATE TABLE eats (
          id INTEGER PRIMARY KEY,
          username TEXT,
          name TEXT,
          calory REAL,
          date INTEGER,
          FOREIGN KEY (username) REFERENCES users(username)
        )
        ''');

        await db.execute('''
        CREATE TABLE exercises (
          id INTEGER PRIMARY KEY,
          username TEXT,
          weight REAL,
          time REAL,
          exercise_type TEXT,
          calories_burned REAL,
          date INTEGER,
          FOREIGN KEY (username) REFERENCES users(username)
        );
        ''');
      },
      // onUpgrade: (db, oldVersion, newVersion) async {
      //   for (int i = oldVersion; i < newVersion; i++) {
      //     switch (i + 1) {
      //       case 2:
      //         await db.execute('''
      //           ALTER TABLE customers
      //           ADD COLUMN phone_number TEXT
      //           ''');
      //         break;
      //       case 3:
      //         await db.execute('''
      //         ALTER TABLE customers
      //         ADD COLUMN print_quantity INTEGER DEFAULT 0
      //         ''');
      //       case 4:
      //         await db.execute('''
      //           ALTER TABLE customers
      //           ADD COLUMN last_updated_millis_since_epoch INTEGER DEFAULT 0
      //         ''');
      //     }
      //   }
      // },
    );

    return _instance!;
  }

  static DbHelper get instance => _instance!;

  late Database db;

  Future<int> create(Model data, {bool ignorePrimaryKey = false}) {
    Map<String, dynamic> map = data.toJsonDB();

    Map<String, dynamic> values = Map.from(map)..removeWhere((key, value) => {'runtime_type', 'primary_key', if (ignorePrimaryKey) map['primary_key']}.contains(key));

    return db.insert(
      map['runtime_type'],
      values,
      conflictAlgorithm: ConflictAlgorithm.fail,
    );
  }

  Future<List<T>> read<T extends Model>({
    String? where,
    List<Object?>? whereArgs,
    String? orderBy,
  }) async {
    String className = T.toString().toSnakeCase();
    String tableName = className;
    if (tableName.substring(tableName.length - 1) != 's') {
      tableName = '${tableName}s';
    }
    List<Map<String, Object?>> result = await db.query(tableName, where: where, whereArgs: whereArgs, orderBy: orderBy).then((value) {
      List<Map<String, Object?>> list = [];
      for (Map<String, Object?> map in value) {
        list.add(Map.from(map));
      }
      return list;
    });

    return result.map((e) => Model.fromJson(e..addAll({'runtimeType': className})) as T).toList();
  }

  Future<int> update(Model data, {bool updateAll = false}) {
    Map<String, dynamic> map = data.toJsonDB();
    Map<String, dynamic> values = Map.from(map)..removeWhere((key, value) => {'runtime_type', 'primary_key'}.contains(key));

    return db.update(map['runtime_type'], values, where: updateAll ? null : '${map['primary_key']} = ?', whereArgs: updateAll ? null : [values[map['primary_key']]]);
  }

  Future<int> delete(Model data, {bool deleteAll = false}) {
    Map<String, dynamic> map = data.toJsonDB();
    Map<String, dynamic> values = Map.from(map)..removeWhere((key, value) => {'runtime_type', 'primary_key'}.contains(key));

    return db.delete(map['runtime_type'], where: deleteAll ? null : '${map['primary_key']} = ?', whereArgs: deleteAll ? null : [values[map['primary_key']]]);
  }
}
