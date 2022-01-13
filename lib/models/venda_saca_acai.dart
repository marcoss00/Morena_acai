class VendaSacaAcai {
  final int id;
  final double valor;
  final int idSacaAcaiUsuario;

  VendaSacaAcai(
    this.valor,
    this.idSacaAcaiUsuario,
    this.id,
  );

  @override
  String toString() {
    return 'VendaSacaAcai{valor: $valor, idSacaAcaiUsuario: $idSacaAcaiUsuario}';
  }
}
