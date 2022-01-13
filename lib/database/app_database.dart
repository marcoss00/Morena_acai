import 'package:morena_acai10/database/dao/saca_acai_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'morena_acai.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(SacaAcaiDao.tableSql);
    },
    version: 1,
    //onDowngrade: onDatabaseDowngradeDelete,
  );
}
