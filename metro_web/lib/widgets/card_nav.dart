import 'package:flutter/material.dart';

class CardNav extends StatelessWidget {
  final String titulo;
  final Widget paginaDestino;

  const CardNav({super.key, required this.titulo, required this.paginaDestino});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Bordas arredondadas
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 157, 193, 255),
              Theme.of(context).primaryColor
            ], // Gradiente de fundo
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
          borderRadius: BorderRadius.circular(15), // Mantendo as bordas arredondadas
        ),
        width: 200, 
        height: 220,
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Título em destaque
            Text(
              titulo,
              style: const TextStyle(
                fontSize: 18, // Aumentando o tamanho da fonte
                fontWeight: FontWeight.bold,
                color: Colors.white, // Mudando a cor do texto para branco
              ),
            ),
            // Botão para navegar
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => paginaDestino),
                );
              },
              child: const Text(
                'Navegar',
                style: TextStyle(
                  fontSize: 16, // Aumentando o tamanho da fonte do botão
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
