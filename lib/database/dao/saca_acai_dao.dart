import 'package:morena_acai10/models/saca_acai.dart';
import 'package:sqflite/sqflite.dart';
import 'package:morena_acai10/database/app_database.dart';

class SacaAcaiDao {
  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_quadra TEXT, '
      '$_pesoSaca DOUBLE)';
  static const String _tableName = 'saca_acai';
  static const String _id = 'id';
  static const String _quadra = 'quadra';
  static const String _pesoSaca = 'peso_saca';

  Future<int> save(SacaAcai sacaAcai) async {
    final Database db = await getDatabase();
    final Map<String, dynamic> sacaAcaiMap = {};
    //sacaAcaiMap[_id] = sacaAcai.id;
    sacaAcaiMap[_quadra] = sacaAcai.quadra;
    sacaAcaiMap[_pesoSaca] = sacaAcai.pesoSaca;
    return db.insert(_tableName, sacaAcaiMap);
  }

  Future<List<SacaAcai>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> resultado = await db.query(_tableName);
    final List<SacaAcai> sacasAcai = [];
    for (Map<String, dynamic> linha in resultado) {
      final SacaAcai sacaAcai = SacaAcai(
        linha[_pesoSaca],
        linha[_quadra],
        id: linha[_id],
      );
      sacasAcai.add(sacaAcai);
    }
    return sacasAcai;
  }

  Future<int> update(SacaAcai sacaAcai) async {
    final Database db = await getDatabase();
    final Map<String, dynamic> sacaAcaiMap = {};
    sacaAcaiMap[_quadra] = sacaAcai.quadra;
    sacaAcaiMap[_pesoSaca] = sacaAcai.pesoSaca;
    return db.update(
      _tableName,
      sacaAcaiMap,
      where: 'id = ?',
      whereArgs: [sacaAcai.id],
    );
  }

  Future<int> delete(int id) async {
    final Database db = await getDatabase();
    return db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
