class SacaAcai {
  String id;
  final double pesoSaca;
  final String quadra;

  SacaAcai(this.pesoSaca, this.quadra, this.id);

  @override
  String toString() {
    return 'SacaAcai{id: $id, pesoSaca: $pesoSaca, quadra: $quadra}';
  }
}
