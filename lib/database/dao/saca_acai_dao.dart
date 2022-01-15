import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:morena_acai10/models/saca_acai.dart';

class SacaAcaiDao {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  static const String _tableName = 'saca_acai';
  static const String _id = 'id';
  static const String _quadra = 'quadra';
  static const String _pesoSaca = 'peso_saca';
  static const String _dataColheitaSaca = 'data_colheita_saca';
  static const String _nome = 'nome';

  Future save(SacaAcai sacaAcai) async {
    final DocumentReference save =
        await db.collection(_tableName).doc(sacaAcai.id);
    final Map<String, dynamic> sacaAcaiMap = {};
    sacaAcaiMap[_id] = sacaAcai.id;
    sacaAcaiMap[_quadra] = sacaAcai.quadra;
    sacaAcaiMap[_pesoSaca] = sacaAcai.pesoSaca;
    sacaAcaiMap[_nome] = sacaAcai.nome;
    sacaAcaiMap[_dataColheitaSaca] = sacaAcai.dataColheitaSaca;
    return save.set(sacaAcaiMap);
  }

  Future<List<SacaAcai>> findAll() async {
    final QuerySnapshot query = await db.collection(_tableName).get();
    final List<SacaAcai> sacasAcai = [];
    for (var doc in query.docs) {
      final Timestamp _dataColheitaSacaConvertido = doc.get(_dataColheitaSaca);
      final SacaAcai sacaAcai = SacaAcai(
        pesoSaca: doc.get(_pesoSaca),
        quadra: doc.get(_quadra),
        id: doc.get(_id),
        nome: doc.get(_nome),
        dataColheitaSaca: _dataColheitaSacaConvertido.toDate(),
      );
      sacasAcai.add(sacaAcai);
    }
    return sacasAcai;
  }

  Future delete(String id) async {
    final delete = await db.collection(_tableName).doc(id);
    return delete.delete();
  }
}
