import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController? controlador;
  final String rotulo;
  final String dica;
  final IconData? icone;
  final TextInputType? teclado;
  final String? Function(String?)? validador;
  final String? valorInicial;

  const Editor(
      {Key? key,
      this.controlador,
      required this.dica,
      this.icone,
      required this.rotulo,
      this.teclado,
      this.validador,
      this.valorInicial})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        initialValue: valorInicial,
        validator: validador,
        controller: controlador,
        style: const TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          labelText: rotulo,
          hintText: dica,
        ),
        keyboardType: teclado != null ? TextInputType.number : null,
      ),
    );
  }
}

class EditorData extends StatelessWidget {
  final String? Function(String?)? validador;
  final String rotulo;
  final TextEditingController controlador;
  final IconData? icone;
  final void Function() onTap;

  const EditorData({
    Key? key,
    this.validador,
    required this.rotulo,
    this.icone,
    required this.onTap,
    required this.controlador,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        controller: controlador,
        validator: validador,
        style: const TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          labelText: rotulo,
        ),
        onTap: onTap,
      ),
    );
  }
}
