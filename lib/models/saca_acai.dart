class SacaAcai {
  final int? id;
  final double pesoSaca;
  final String quadra;
  //final int idSacaAcaiUsuario;

  SacaAcai(this.pesoSaca, this.quadra, {this.id});

  @override
  String toString() {
    return 'SacaAcai{id: $id, pesoSaca: $pesoSaca, quadra: $quadra}';
  }
}
