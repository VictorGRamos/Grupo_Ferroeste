import 'package:grupo_ferroeste/data/database_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getLocalDatabase() async {
  final String path = join(await getDatabasesPath(), 'local.db');
  return openDatabase(
    path,
    onCreate: ((db, version) {
      db.execute(DatabaseDao.tableSql);
    }),
  );
}
