import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';


class DatabaseConnection {
  Future<Database> setDatabase() async{
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'db_todolist_sqlite');
    var database = await openDatabase(
      path, 
      version: 1, 
      onCreate: _onCreatingDatabase,  
      );
    return database;
  }

  Future _onCreatingDatabase(Database database, int version) async{
    await database.execute("CREATE TABLE tasks(id TEXT PRIMARY KEY, name TEXT)");
  }
}