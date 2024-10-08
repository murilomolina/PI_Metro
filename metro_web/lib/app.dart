import 'package:flutter/material.dart';
import 'package:metro_web/pages/homepage.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Metrô Web',
      theme: ThemeData(
        primaryColor:  const Color.fromRGBO(0, 20, 137, 1), // Cor principal
        scaffoldBackgroundColor: Colors.white, // Cor de fundo do Scaffold
        appBarTheme: const AppBarTheme(
          color: Color.fromRGBO(0, 20, 137, 1), // Cor da AppBar
          iconTheme: IconThemeData(color: Colors.white), // Cor dos ícones na AppBar
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 16.0) 
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(0, 20, 137, 1), // Cor padrão dos botões
            foregroundColor: Colors.white, // Cor do texto
            shadowColor: Colors.grey
          ),
        ),
        // Definir a fonte padrão aqui
        fontFamily: 'Roboto', // próxima a padrão do metro (helvetica)
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}


