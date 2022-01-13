import 'package:flutter/material.dart';
import 'package:morena_acai/screens/lista_sacas_acai.dart';

void main() => runApp(MorenaAcaiApp());

class MorenaAcaiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.purple,
        ).copyWith(
          secondary: Colors.purpleAccent[700],
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.purpleAccent[700],
          ),
        ),
        buttonTheme: ButtonThemeData(
            buttonColor: Colors.purpleAccent[700],
            textTheme: ButtonTextTheme.primary),
      ),
      home: ListaSacasAcai(),
    );
  }
}
