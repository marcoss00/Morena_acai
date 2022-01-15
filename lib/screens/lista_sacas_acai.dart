import 'package:flutter/material.dart';
import 'package:morena_acai10/database/dao/saca_acai_dao.dart';
import 'package:morena_acai10/models/saca_acai.dart';
import 'package:morena_acai10/screens/formulario_atualizacao_sacas_acai.dart';
import 'formulario_sacas_acai.dart';
import 'package:intl/intl.dart';

const _tituloAppBar = 'Colheita';

class ListaSacasAcai extends StatefulWidget {
  const ListaSacasAcai({Key? key}) : super(key: key);

  @override
  State<ListaSacasAcai> createState() => _ListaSacasAcaiState();
}

class _ListaSacasAcaiState extends State<ListaSacasAcai> {
  final SacaAcaiDao _dao = SacaAcaiDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_tituloAppBar),
      ),
      body: FutureBuilder<List<SacaAcai>>(
        initialData: const [],
        future: _dao.findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                    Text('Carregando'),
                  ],
                ),
              );

            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<SacaAcai>? _sacasAcai = snapshot.data;
              return ListView.builder(
                itemCount: _sacasAcai?.length,
                itemBuilder: (context, indice) {
                  final SacaAcai sacaAcai = _sacasAcai![indice];
                  return ItemSacaAcai(sacaAcai);
                },
              );
          }
          return const Text('Erro desconhecido!');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => const FormularioSacasAcai(),
                ),
              )
              .then(
                (value) => setState(() {}),
              );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ItemSacaAcai extends StatefulWidget {
  final SacaAcai _sacaAcai;

  const ItemSacaAcai(this._sacaAcai, {Key? key}) : super(key: key);

  @override
  State<ItemSacaAcai> createState() => _ItemSacaAcaiState();
}

class _ItemSacaAcaiState extends State<ItemSacaAcai> {
  late final String dataColheitaSacaBR =
      DateFormat(DateFormat.YEAR_MONTH_DAY, 'pt-Br')
          .format(widget._sacaAcai.dataColheitaSaca!);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(
          'images/acai_fruta.png',
          width: 40,
          height: 40,
        ),
        title: Text(widget._sacaAcai.nome!),
        subtitle: Text(
            'Quadra: ${widget._sacaAcai.quadra}\nPeso: ${widget._sacaAcai.pesoSaca.toString()}'
            ' Kg\nColheita: $dataColheitaSacaBR'),
        //selected: true,
        onTap: () {},
        trailing: SizedBox(
          width: 100,
          child: Row(
            children: [
              EditButton(widget._sacaAcai),
              DeleteButton(widget._sacaAcai),
            ],
          ),
        ),
      ),
    );
  }
}

class EditButton extends StatefulWidget {
  final SacaAcai sacaAcai;

  const EditButton(this.sacaAcai, {Key? key}) : super(key: key);

  @override
  State<EditButton> createState() => _EditButtonState();
}

class _EditButtonState extends State<EditButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.edit),
      color: Colors.orange,
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                FormularioAtualizacaoSacasAcai(widget.sacaAcai),
          ),
        );
      },
    );
  }
}

class DeleteButton extends StatefulWidget {
  final SacaAcai _sacaAcai;

  const DeleteButton(this._sacaAcai, {Key? key}) : super(key: key);

  @override
  State<DeleteButton> createState() => _DeleteButtonState();
}

class _DeleteButtonState extends State<DeleteButton> {
  final SacaAcaiDao _dao = SacaAcaiDao();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete),
      color: Colors.red,
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Excluir Tela'),
            content: const Text('Você tem certeza?'),
            actions: [
              TextButton(
                child: const Text('Sim'),
                onPressed: () {
                  _dao.delete(widget._sacaAcai.id!);
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Tela Deletada Com Sucesso!'),
                    ),
                  );
                },
              ),
              TextButton(
                child: const Text('Não'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          barrierDismissible: true,
        );
      },
    );
  }
}
