import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:morena_acai10/components/editor.dart';
import 'package:morena_acai10/database/dao/saca_acai_dao.dart';
import 'package:morena_acai10/models/saca_acai.dart';
import 'package:uuid/uuid.dart';

const _tituloAppBar = 'Nova Tela de Açaí';
const _rotuloBotaoFormularioSacaAcai = 'Confirmar';
const _rotuloQuadra = 'Quadra *';
const _dicaQuadra = 'A0';
const _rotuloPesoSaca = 'Peso';
const _dicaPesoSaca = '0.00';
const _rotuloQuantidadeSaca = 'Quantidade *';
const _dicaQuantidadeSaca = '0';
const _mensagemSnackBar = 'Tela(s) Cadastrada Com Sucesso!';
const _rotuloDataColheitaSaca = 'Data da Colheita *';

class FormularioSacasAcai extends StatefulWidget {
  const FormularioSacasAcai({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FormularioSacasAcaiState();
  }
}

class FormularioSacasAcaiState extends State<FormularioSacasAcai> {
  final TextEditingController _controladorCampoQuadra = TextEditingController();
  final TextEditingController _controladorCampoPesoSaca =
      TextEditingController();
  final TextEditingController _controladorCampoQuantidadeSaca =
      TextEditingController();
  final TextEditingController _controladorCampoDataColheita =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SacaAcaiDao _dao = SacaAcaiDao();
  late DateTime dataColheitaSaca;

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
              EditorData(
                controlador: _controladorCampoDataColheita,
                rotulo: _rotuloDataColheitaSaca,
                icone: Icons.calendar_today_outlined,
                validador: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo Obrigatório';
                  }
                  return null;
                },
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  _selectDate(context);
                },
              ),
              Editor(
                controlador: _controladorCampoQuantidadeSaca,
                dica: _dicaQuantidadeSaca,
                rotulo: _rotuloQuantidadeSaca,
                teclado: TextInputType.number,
                validador: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo Obrigatório';
                  } else {
                    final int? quantidadeSaca = int.tryParse(value);
                    if (quantidadeSaca! < 1) {
                      return 'Quantidade Inválida';
                    }
                    return null;
                  }
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    return _criaSacaAcai(context);
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

  Future _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2016),
      lastDate: DateTime(2025),
      locale: const Locale('pt', 'BR'),
    );
    dataColheitaSaca = picked!;
    final String dataColheitaSacaBR =
        DateFormat(DateFormat.YEAR_MONTH_DAY, 'pt-Br').format(dataColheitaSaca);
    _controladorCampoDataColheita.text = dataColheitaSacaBR;
  }

  void _criaSacaAcai(BuildContext context) {
    final String quadra = _controladorCampoQuadra.text;
    final double? pesoSaca = double.tryParse(_controladorCampoPesoSaca.text);
    final int? quantidadeSaca =
        int.tryParse(_controladorCampoQuantidadeSaca.text);
    final String nome =
        '${dataColheitaSaca.day}${dataColheitaSaca.month}${dataColheitaSaca.year}$quadra';

    for (int i = 0; i < quantidadeSaca!; i++) {
      final String id = Uuid().v1();
      final SacaAcai sacaAcaiCriada = SacaAcai(
        pesoSaca: pesoSaca!,
        quadra: quadra,
        id: id,
        nome: nome,
        dataColheitaSaca: dataColheitaSaca,
      );
      _dao.save(sacaAcaiCriada);
    }

    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(_mensagemSnackBar),
      ),
    );
  }
}
