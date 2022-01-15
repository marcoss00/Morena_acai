import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:morena_acai10/screens/pagina_inicial.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MorenaAcai());
}

class MorenaAcai extends StatelessWidget {
  const MorenaAcai({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: const MaterialColor(
            0xFF6A1B9A,
            {
              50: Color(0xFFF3E5F5),
              100: Color(0xFFE1BEE7),
              200: Color(0xFFCE93D8),
              300: Color(0xFFBA68C8),
              400: Color(0xFFAB47BC),
              //500: Color(_purplePrimaryValue),
              600: Color(0xFF8E24AA),
              700: Color(0xFF7B1FA2),
              800: Color(0xFF6A1B9A),
              900: Color(0xFF4A148C),
            },
          ),
        ).copyWith(
          secondary: Colors.deepPurple,
        ),
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Colors.purpleAccent),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.purpleAccent[400],
        ),
      ),
      home: const PaginaInicial(),
    );
  }
}
