import 'package:sqflite/sqflite.dart';
import 'package:todolist_app/reponsitories/database_connection.dart';

class Repository {
  late DatabaseConnection _databaseConnection;

  Repository() {
    _databaseConnection = DatabaseConnection();
  }

  static Database? _database;

  Future<Database> getDatabase() async {
    if (_database != null) {
      return _database!;
    }
    _database = await _databaseConnection.setDatabase();
    return _database!;
  }

  // insert data to table
  Future<int> insertData(String table, Map<String, dynamic> data) async {
    var connection = await getDatabase(); 
    return await connection.insert(table, data);
  }

  Future<List<Map<String, dynamic>>> readData(String table) async {
  final connection = await getDatabase();
  return await connection.query(table);
}

  // Delete data from table
  Future<int> deleteData(String table, String id) async {
    var connection = await getDatabase();
    return await connection.delete(table, where: 'id = ?', whereArgs: [id]);
  }

}
