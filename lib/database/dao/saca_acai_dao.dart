import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:morena_acai10/models/saca_acai.dart';

class SacaAcaiDao {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  static const String _tableName = 'saca_acai';
  static const String _id = 'id';
  static const String _quadra = 'quadra';
  static const String _pesoSaca = 'peso_saca';

  Future save(SacaAcai sacaAcai) async {
    final DocumentReference save =
        await db.collection(_tableName).doc(sacaAcai.id);
    final Map<String, dynamic> sacaAcaiMap = {};
    sacaAcaiMap[_id] = sacaAcai.id;
    sacaAcaiMap[_quadra] = sacaAcai.quadra;
    sacaAcaiMap[_pesoSaca] = sacaAcai.pesoSaca;
    return save.set(sacaAcaiMap);
  }

  Future<List<SacaAcai>> findAll() async {
    final QuerySnapshot query = await db.collection(_tableName).get();
    final List<SacaAcai> sacasAcai = [];
    query.docs.forEach((doc) {
      final SacaAcai sacaAcai = SacaAcai(
        doc.get(_pesoSaca),
        doc.get(_quadra),
        doc.get(_id),
      );
      sacasAcai.add(sacaAcai);
    });
    return sacasAcai;
  }

Future delete(String id) async {
    final delete = await db.collection(_tableName).doc(id);
    return delete.delete();


//   final Database db = await getDatabase();
//   return db.delete(
//     _tableName,
//     where: 'id = ?',
//     whereArgs: [id],
//   );
}


}
