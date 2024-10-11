import 'package:flutter/material.dart';

class CardNavigator extends StatelessWidget{
  final String titulo;
  final Widget paginaDestino;

  const CardNavigator({super.key, required this.titulo, required this.paginaDestino});


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      surfaceTintColor: Theme.of(context).primaryColor,
      child: Container(
        width: 200, 
        height: 220,
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, 
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Título em destaque
            Text(
              titulo,
              style: const TextStyle(
                fontSize: 16, 
                fontWeight: FontWeight.bold, // destaque no título
              ),
            ),
            
            // Texto do equipamento puxado do banco de dados
            Text(
              "Ir para a página de $titulo", 
              style: const TextStyle(fontSize: 14),
            ),
            
            
            // Botão para verificar
            ElevatedButton(
              onPressed:  () {
              Navigator.pop(context);
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  paginaDestino), 
              );
            },
              child: const Text('Navegar'),
            ),
          ],
        ),
      ),
    );
  }
}

