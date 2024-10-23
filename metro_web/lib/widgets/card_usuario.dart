import 'package:flutter/material.dart';

class Cardusuario extends StatelessWidget {
  final String usuario;
  final String email;
  final String funcao;
  final String ocupacao;

  const Cardusuario({super.key, required this.usuario, required this.funcao, required this.ocupacao, required this.email});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 157, 193, 255),
              Theme.of(context).primaryColor,
            ], // Gradiente de fundo
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
          borderRadius: BorderRadius.circular(15), 
        ),
        width: 250,
        height: 220,
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              usuario,
              style: const TextStyle(
                fontSize: 24, 
                fontWeight: FontWeight.bold,
                color: Colors.white, 
              ),
            ),
            Text(
              email,
              style: const TextStyle(
                fontSize: 24, 
                fontWeight: FontWeight.bold,
                color: Colors.black, 
              ),
            ),
            Text(
              ocupacao,
              style: const TextStyle(
                fontSize: 16, 
                color: Colors.black, 
              ),
            ),
            Text(
              funcao,
              style: const TextStyle(
                fontSize: 14, 
                fontWeight: FontWeight.bold,
                color: Colors.black, 
              ),
            ),
            // Botões de Editar e Excluir
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.white),
                  onPressed: () {
                    _showEditDialog(context);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.white),
                  onPressed: () {
                    _showDeleteConfirmationDialog(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context) {
    final TextEditingController usuarioController = TextEditingController(text: usuario);
    final TextEditingController funcaoController = TextEditingController(text: funcao);
    final TextEditingController ocupacaoController = TextEditingController(text: ocupacao);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Editar Usuário'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: usuarioController,
                decoration: const InputDecoration(labelText: 'Usuário'),
              ),
              TextField(
                controller: funcaoController,
                decoration: const InputDecoration(labelText: 'Função'),
              ),
              TextField(
                controller: ocupacaoController,
                decoration: const InputDecoration(labelText: 'Ocupação'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                // implementar a lógica de salvar as alterações
                print("Usuário: ${usuarioController.text}, Função: ${funcaoController.text}, Ocupação: ${ocupacaoController.text}");
                Navigator.of(context).pop();
              },
              child: const Text('Salvar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar Exclusão'),
          content: const Text('Tem certeza que deseja excluir este usuário?'),
          actions: [
            TextButton(
              onPressed: () {
                // implementar a lógica de exclusão do usuário
                print("Usuário excluído: $usuario");
                Navigator.of(context).pop();
              },
              child: const Text('Excluir'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }
}
