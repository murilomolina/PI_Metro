import 'package:flutter/material.dart';
import 'package:metro_web/pages/home_page.dart';
import 'package:metro_web/pages/perfil_logado.dart';

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
            child: const Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Meu Perfil'),
            onTap: () {
              Navigator.pop(context);
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PerfilLogado()), 
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
              Navigator.pop(context);
              // Lógica para logout
            },
          )
        ]:
        <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor, // Cor de fundo do cabeçalho
            ),
            child: const Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
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
            leading: const Icon(Icons.person),
            title: const Text('Meu Perfil'),
            onTap: () {
              Navigator.pop(context);
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PerfilLogado()), 
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
              Navigator.pop(context);
              // Lógica para logout
            },
          )
        ]
      ),
    );
  }
}
