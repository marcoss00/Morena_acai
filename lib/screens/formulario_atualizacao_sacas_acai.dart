import 'package:flutter/material.dart';
import 'package:morena_acai10/components/editor.dart';
import 'package:morena_acai10/database/dao/saca_acai_dao.dart';
import 'package:morena_acai10/models/saca_acai.dart';

const _tituloAppBar = 'Editar Tela';
const _rotuloBotaoFormularioSacaAcai = 'Confirmar';
const _rotuloQuadra = 'Quadra *';
const _dicaQuadra = 'A0';
const _rotuloPesoSaca = 'Peso';
const _dicaPesoSaca = '0.00';
const _mensagemSnackBar = 'Tela Atualizada Com Sucesso!';

class FormularioAtualizacaoSacasAcai extends StatefulWidget {
  final SacaAcai _sacaAcaiEditando;

  const FormularioAtualizacaoSacasAcai(this._sacaAcaiEditando, {Key? key})
      : super(key: key);

  @override
  _FormularioAtualizacaoSacasAcaiState createState() =>
      _FormularioAtualizacaoSacasAcaiState();
}

class _FormularioAtualizacaoSacasAcaiState
    extends State<FormularioAtualizacaoSacasAcai> {
  late final TextEditingController _controladorCampoQuadra =
      TextEditingController(text: widget._sacaAcaiEditando.quadra);
  late final TextEditingController _controladorCampoPesoSaca =
      TextEditingController(text: widget._sacaAcaiEditando.pesoSaca.toString());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SacaAcaiDao _dao = SacaAcaiDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Editor(
                controlador: _controladorCampoQuadra,
                rotulo: _rotuloQuadra,
                dica: _dicaQuadra,
                validador: (value) {
                  if (value!.isEmpty) {
                    return 'Campo Obrigatório';
                  } else if (value == 'A1' ||
                      value == 'A2' ||
                      value == 'A3' ||
                      value == 'A4' ||
                      value == 'A5' ||
                      value == 'A6' ||
                      value == 'B1' ||
                      value == 'B2' ||
                      value == 'B3' ||
                      value == 'B4' ||
                      value == 'B5' ||
                      value == 'B6' ||
                      value == 'B7' ||
                      value == 'C1' ||
                      value == 'C2' ||
                      value == 'C3' ||
                      value == 'C4' ||
                      value == 'C5' ||
                      value == 'C6' ||
                      value == 'C7') {
                    return null;
                  }
                  return 'Quadra inexistente';
                },
              ),
              Editor(
                controlador: _controladorCampoPesoSaca,
                dica: _dicaPesoSaca,
                rotulo: _rotuloPesoSaca,
                icone: Icons.account_balance_wallet,
                teclado: TextInputType.number,
                validador: (value) {
                  final double? pesoSaca = double.tryParse(value!);
                  if (pesoSaca! < 0) {
                    return 'Valor invalido';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    return _atualizaSacaAcai(context);
                  }
                },
                child: const Text(_rotuloBotaoFormularioSacaAcai),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _atualizaSacaAcai(BuildContext context) {
    final String quadra = _controladorCampoQuadra.text;
    final double? pesoSaca = double.tryParse(_controladorCampoPesoSaca.text);
    final SacaAcai sacaAcaiAtualizada =
        SacaAcai(pesoSaca!, quadra, widget._sacaAcaiEditando.id);
    _dao.save(sacaAcaiAtualizada);

    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(_mensagemSnackBar),
      ),
    );
  }
}
