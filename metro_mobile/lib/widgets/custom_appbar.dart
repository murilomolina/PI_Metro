import 'package:flutter/material.dart';
import 'package:metro_mobile/pages/home_page.dart';
import 'package:metro_mobile/pages/mapa_rede.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titulo;
  const CustomAppBar({super.key, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          GestureDetector(
            onTap: () {
              // Redirecionar para a página principal
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()), // Substitua 'HomePage' pela sua página principal
              );
            },
            child: Image.asset(
              'assets/logo/metro_logo_branca.png',
              height: 100,
            ),
          ),
          const SizedBox(width: 8), // Espaçamento entre o logo e o título
          Text(titulo), // Título da AppBar
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.train_outlined), // Espaço reservado para o ícone de ação
          tooltip: 'Mapa da rede',
          onPressed: () {
            Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MapaRede()),
                );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
