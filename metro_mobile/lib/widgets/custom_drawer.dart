import 'package:flutter/material.dart';
import 'package:metro_mobile/pages/home_page.dart';

class CustomDrawer extends StatelessWidget {
  final int pagType;

  const CustomDrawer({super.key, required this.pagType});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: pagType == 0 ? <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor, // Cor de fundo do cabeçalho
            ),
            child: Align(
              alignment: Alignment.topLeft, 
              child: Image.asset(
                'assets/logo/metro_logo_branca.png',
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configurações'),
            onTap: () {
              Navigator.pop(context);
              // Navegar para a página de configurações
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Sair'),
            onTap: () {
              // Limpar tokens de autenticação (se a gente usar algum)
              // remover dados salvos em cache ou sessões
              // Limpar cache de token
              Navigator.of(context).pushReplacementNamed('/login'); // Redirecionar para a página de login
            },
          )
        ]:
        <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor, // Cor de fundo do cabeçalho
            ),
            child: Align(
              alignment: Alignment.topLeft, 
              child: Image.asset(
                'assets/logo/metro_logo_branca.png',
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Página Inicial'),
            onTap: () {
              Navigator.pop(context);
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()), 
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Configurações'),
            onTap: () {
              Navigator.pop(context);
              // Navegar para a página de configurações
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Sair'),
            onTap: () {
              // Limpar tokens de autenticação (se a gente usar algum)
              // remover dados salvos em cache ou sessões
              // Limpar cache de token
              Navigator.of(context).pushReplacementNamed('/login'); // Redirecionar para a página de login
            },
          )
        ]
      ),
    );
  }
}
