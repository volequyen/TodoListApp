import 'package:sqflite/sqflite.dart';
import 'package:todolist_app/reponsitories/database_connection.dart';

class Repository {
  late DatabaseConnection _databaseConnection;

  Repository(){
    _databaseConnection = DatabaseConnection(); 
    }

    static Database? _database;

    Future<Database> getDatabase() async{
      if(_database != null){
        return _database!;
      }
      _database = await _databaseConnection.setDatabase();
      return _database!;
    }
}