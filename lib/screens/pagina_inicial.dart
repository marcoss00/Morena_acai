import 'package:flutter/material.dart';
import 'package:morena_acai10/screens/lista_sacas_acai.dart';
import 'package:morena_acai10/screens/lista_vendas_sacas_acai.dart';

class PaginaInicial extends StatelessWidget {
  const PaginaInicial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página Inicial'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('images/logo_morena_acai.jpeg'),
          ),
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                ItensPaginaInicial(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final String nome;
  final IconData icone;
  final MaterialColor? corIcone;
  final Function? onClick;

  const _FeatureItem({
    Key? key,
    required this.nome,
    required this.icone,
    this.corIcone,
    @required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).colorScheme.primary,
        child: InkWell(
          onTap: () => onClick!(),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            height: 100,
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  icone,
                  color: corIcone,
                  size: 32,
                ),
                Text(
                  nome,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ItensPaginaInicial extends StatelessWidget {
  const ItensPaginaInicial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _FeatureItem(
          nome: 'Colheita',
          icone: Icons.article,
          corIcone: Colors.red,
          onClick: () => _navegaListaSacasAcai(context),
        ),
        _FeatureItem(
          nome: 'Vendas',
          icone: Icons.monetization_on,
          corIcone: Colors.yellow,
          onClick: () => _navegaListaVendasSacaAcai(context),
        ),
        _FeatureItem(
          nome: 'Irrigação',
          icone: Icons.water,
          corIcone: Colors.blue,
          onClick: () => _navegaListaIrrigacao(context),
        ),
        _FeatureItem(
          nome: 'Quadras',
          icone: Icons.map,
          corIcone: Colors.brown,
          onClick: () => _navegaListaQuadras(context),
        ),
        _FeatureItem(
          nome: 'Adubação',
          icone: Icons.eco,
          corIcone: Colors.green,
          onClick: () => _navegaListaAdubacao(context),
        ),
      ],
    );
  }

  void _navegaListaSacasAcai(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ListaSacasAcai(),
      ),
    );
  }

  void _navegaListaVendasSacaAcai(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ListaVendasSacasAcai(),
      ),
    );
  }

  void _navegaListaIrrigacao(BuildContext context) {
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) => const ListaSacasAcai(),
    //   ),
    // );
  }

  void _navegaListaQuadras(BuildContext context) {
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) => const ListaSacasAcai(),
    //   ),
    // );
  }

  void _navegaListaAdubacao(BuildContext context) {
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) => const ListaSacasAcai(),
    //   ),
    // );
  }
}
