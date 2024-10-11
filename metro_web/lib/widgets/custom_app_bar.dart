import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Image.asset(
            '../assets/logo/metro_logo_branca.png', 
            height: 100, 
          ),
          const SizedBox(width: 8), // Espaçamento entre o logo e o título
          const Text('Metrô Web'), // Título da AppBar (a mudar)
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.construction), // só pra "marcar" espaço
          onPressed: () {
            
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
