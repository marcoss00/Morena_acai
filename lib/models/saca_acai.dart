import 'package:flutter/material.dart';

class SacaAcai {
  final double pesoSaca;
  final String quadra;

  SacaAcai(this.pesoSaca, this.quadra);

  @override
  String toString() {
    return 'Cadastrado (Peso: $pesoSaca, Quadra: $quadra)';
  }
}
