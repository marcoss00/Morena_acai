class VendaSacaAcai {
  final String id;
  final double valor;

  VendaSacaAcai(
    this.valor,
    this.id,
  );

  @override
  String toString() {
    return 'VendaSacaAcai{id: $id, valor: $valor}';
  }
}
