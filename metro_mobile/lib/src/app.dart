import 'package:flutter/material.dart';
import 'package:metro_mobile/pages/home_page.dart';
// import 'package:metro_mobile/pages/login_page.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Metrô Web',
      theme: ThemeData(
        primaryColor:  const Color.fromRGBO(0, 20, 137, 1), // Cor principal
        scaffoldBackgroundColor: Colors.white, // Cor de fundo do Scaffold
        // Padronização da Appbar em todas as páginas
        appBarTheme: const AppBarTheme(
          color: Color.fromRGBO(0, 20, 137, 1), // Cor da AppBar
          iconTheme: IconThemeData(color: Colors.white), // Cor dos ícones na AppBar
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 16.0) 
        ),
        // padronização de todos os elevatedButton
        elevatedButtonTheme: ElevatedButtonThemeData( 
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(0, 20, 137, 1), // Cor padrão dos botões
            foregroundColor: Colors.white, // Cor do texto
            shadowColor: Colors.grey
          ),
        ),
        // padronização do drawer
        drawerTheme: const DrawerThemeData(
          backgroundColor: Colors.white, // Cor de fundo do drawer
          elevation: 5, // Sombra do drawer
          scrimColor: Colors.black54, // Cor da sombra atrás do drawer
        ),
        // Definir a fonte padrão aqui
        fontFamily: 'Roboto', // próxima a padrão do metro (helvetica)
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}


