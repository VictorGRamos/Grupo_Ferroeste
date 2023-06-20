import 'package:sqflite/sqflite.dart';
import 'local_database.dart';

class DatabaseDao {
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_apiname TEXT, '
      '$_json TEXT, '
      '$_date TEXT)';

  static const String _tablename = 'localDatabase';
  static const String _apiname = 'apiname';
  static const String _json = 'json';
  static const String _date = 'date';

  save(String latestUpdateIn, String json, String apiname) async {
    final Database localDatabase = await getLocalDatabase();
    var itemExists = await readLatestByApiName(apiname);
    if (itemExists.isEmpty) {
      return await localDatabase.insert(
          _tablename, {_apiname: apiname, _date: latestUpdateIn, _json: json});
    } else {
      return await localDatabase.update(
          _tablename, {_apiname: apiname, _date: latestUpdateIn, _json: json},
          where: '$_apiname = ?', whereArgs: [apiname]);
    }
  }

  Future<List<Map<String, dynamic>>> readLatestByApiName(String apiname) async {
    final Database localDatabase = await getLocalDatabase();
    final List<Map<String, dynamic>> result = await localDatabase
        .query(_tablename, where: '$_apiname = ?', whereArgs: [apiname]);
    return result;
  }
}
