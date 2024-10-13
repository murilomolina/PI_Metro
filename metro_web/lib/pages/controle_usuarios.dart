import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:metro_web/widgets/card_usuario.dart';
import 'package:metro_web/widgets/custom_app_bar.dart';
import 'package:metro_web/widgets/custom_drawer.dart';

class ControleUsuarios extends StatelessWidget {
  
  const ControleUsuarios({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(titulo: 'Controle de Usuários'), floatingActionButton: botaoAdd(context),
      drawer: const CustomDrawer(pagType: 1), // 1 para páginas que não são a página principal
      body: const SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Wrap( 
                spacing: 40.0, 
                runSpacing: 40.0, 
                children: [
                  Cardusuario(usuario: 'Usuario1', funcao: 'ADM', ocupacao: 'Gerencia de Tecnologia'),
                  Cardusuario(usuario: 'Usuario2', funcao: 'ADM', ocupacao: 'Gerencia de Tecnologia'),
                  Cardusuario(usuario: 'Usuario3', funcao: 'ADM', ocupacao: 'Gerencia de Tecnologia'),
                  Cardusuario(usuario: 'Usuario4', funcao: 'ADM', ocupacao: 'Gerencia de Tecnologia'),
                  Cardusuario(usuario: 'Usuario5', funcao: 'ADM', ocupacao: 'Gerencia de Tecnologia'),
                  Cardusuario(usuario: 'Usuario6', funcao: 'ADM', ocupacao: 'Gerencia de Tecnologia'),
                  Cardusuario(usuario: 'Usuario7', funcao: 'ADM', ocupacao: 'Gerencia de Tecnologia'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget botaoAdd(context){
    return ElevatedButton(
      onPressed: () {
        _showAddUserDialog(context);
      },
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(), 
        padding: const EdgeInsets.all(20), 
        backgroundColor: Theme.of(context).primaryColor, 
        shadowColor: Colors.black.withOpacity(0.3), 
        elevation: 10, 
      ),
      child: const Icon(
        Icons.add, 
        size: 40, 
        color: Colors.white, 
      ),
    );
  }
  
  // Método para mostrar o diálogo de adição de usuário
  void _showAddUserDialog(BuildContext context) {
    final TextEditingController usuarioController = TextEditingController();
    final TextEditingController senhaController = TextEditingController();
    final TextEditingController ocupacaoController = TextEditingController();
    final TextEditingController funcaoController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Adicionar Usuário'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: usuarioController,
                  decoration: const InputDecoration(labelText: 'Nome de Usuário'),
                ),
                TextField(
                  controller: senhaController,
                  decoration: const InputDecoration(labelText: 'Senha'),
                  obscureText: true, // Esconder o texto da senha
                ),
                TextField(
                  controller: ocupacaoController,
                  decoration: const InputDecoration(labelText: 'Ocupação'),
                ),
                TextField(
                  controller: funcaoController,
                  decoration: const InputDecoration(labelText: 'Função'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                // implementar a lógica de adicionar o usuário (futuramente)
                print("Usuário: ${usuarioController.text}, Senha: ${senhaController.text}, Ocupação: ${ocupacaoController.text}, Função: ${funcaoController.text}");
                Navigator.of(context).pop();
              },
              child: const Text('Adicionar'),
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
