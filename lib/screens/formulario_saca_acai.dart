import 'package:flutter/material.dart';
import 'package:morena_acai/components/editor.dart';
import 'package:morena_acai/models/saca_acai.dart';

const _tituloAppBar = 'Cadastrar saca de açaí';
const _rotuloBotaoFormularioSacaAcai = 'Confirmar';
const _rotuloQuadra = 'Nome da quadra';
const _dicaQuadra = 'A0';
const _rotuloPesoSaca = 'Peso da saca (Kg)';
const _dicaPesoSaca = '0.00';

class FormularioSacaAcai extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioSacaAcaiState();
  }
}

class FormularioSacaAcaiState extends State<FormularioSacaAcai> {
  final TextEditingController _controladorCampoQuadra = TextEditingController();
  final TextEditingController _controladorCampoPesoSaca =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
              controlador: _controladorCampoQuadra,
              rotulo: _rotuloQuadra,
              dica: _dicaQuadra,
            ),
            Editor(
              controlador: _controladorCampoPesoSaca,
              dica: _dicaPesoSaca,
              rotulo: _rotuloPesoSaca,
              icone: Icons.account_balance_wallet,
              teclado: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () => _criaSacaAcai(context),
              child: Text(_rotuloBotaoFormularioSacaAcai),
            ),
          ],
        ),
      ),
    );
  }

  void _criaSacaAcai(BuildContext context) {
    final String quadra = _controladorCampoQuadra.text;
    final double? pesoSaca = double.tryParse(_controladorCampoPesoSaca.text);
    if (quadra != null && pesoSaca != null) {
      final SacaAcai sacaAcaiCriada = SacaAcai(pesoSaca, quadra);

      Navigator.pop(context, sacaAcaiCriada);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$sacaAcaiCriada'),
        ),
      );
    }
  }
}
