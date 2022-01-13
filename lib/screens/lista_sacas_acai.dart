import 'package:flutter/material.dart';
import 'package:morena_acai/models/saca_acai.dart';

import 'formulario_saca_acai.dart';

const _tituloAppBar = 'Sacas cadastradas';

class ListaSacasAcai extends StatefulWidget {
  final List<SacaAcai> _sacasAcai = [];

  @override
  State<StatefulWidget> createState() {
    return ListaSacasAcaiState();
  }
}

class ListaSacasAcaiState extends State<ListaSacasAcai> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: ListView.builder(
        itemCount: widget._sacasAcai.length,
        itemBuilder: (context, indice) {
          final SacaAcai sacaAcai = widget._sacasAcai[indice];
          return ItemSacaAcai(sacaAcai);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<SacaAcai?> future = Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return FormularioSacaAcai();
              },
            ),
          );
          future.then((sacaAcaiRecebida) => _atualiza(sacaAcaiRecebida));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _atualiza(SacaAcai? sacaAcaiRecebida) {
    setState(
      () {
        widget._sacasAcai.add(sacaAcaiRecebida!);
      },
    );
  }
}

class ItemSacaAcai extends StatelessWidget {
  final SacaAcai _sacaAcai;

  ItemSacaAcai(this._sacaAcai);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.eco),
        title: Text(_sacaAcai.pesoSaca.toString()),
        subtitle: Text(_sacaAcai.quadra),
      ),
    );
  }
}
