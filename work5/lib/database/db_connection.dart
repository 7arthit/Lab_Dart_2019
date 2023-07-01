import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConnection {
  String tableName = 'profileDB';

  setDatabase() async {
    var directory = await getDatabasesPath();
    var path = join(directory, 'db_profile');
    var database =
      await openDatabase(path, version: 1, onCreate: _onCreatingDatabase);
    return database;
  }
  _onCreatingDatabase(Database database, int version) async {
    print('set database');
    await database.execute('CREATE TABLE StableName(id INTEGER PRIMARY KEY,'
      'firstname Text,'
      'lastname Text,'
      'email TEXT,'
      'phone TEXT,'
      'image TEXT)');
  }
}

