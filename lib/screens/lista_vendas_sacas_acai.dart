import 'package:flutter/material.dart';
import 'package:morena_acai10/models/venda_saca_acai.dart';

const _tituloAppBar = 'Vendas';

class ListaVendasSacasAcai extends StatefulWidget {
  const ListaVendasSacasAcai({Key? key}) : super(key: key);

  @override
  _ListaVendasSacasAcaiState createState() => _ListaVendasSacasAcaiState();
}

class _ListaVendasSacasAcaiState extends State<ListaVendasSacasAcai> {
  final List<VendaSacaAcai> _vendasSacaAcai = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: ListView.builder(
        itemCount: _vendasSacaAcai.length,
        itemBuilder: (context, indice){
          final VendaSacaAcai vendaSacaAcai = _vendasSacaAcai[indice];
          return ItemVendaSacaAcai(vendaSacaAcai);
        },
      ),
    );
  }
}

class ItemVendaSacaAcai extends StatefulWidget {
  final VendaSacaAcai _vendaSacaAcai;

  const ItemVendaSacaAcai(this._vendaSacaAcai, {Key? key}) : super(key: key);

  @override
  _ItemVendaSacaAcaiState createState() => _ItemVendaSacaAcaiState();
}

class _ItemVendaSacaAcaiState extends State<ItemVendaSacaAcai> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(widget._vendaSacaAcai.valor.toString()),
        subtitle: Text(widget._vendaSacaAcai.idSacaAcaiUsuario.toString()),
        onTap: (){},
      ),
    );
  }
}

