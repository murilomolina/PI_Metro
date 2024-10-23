import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:metro_web/widgets/custom_app_bar.dart';
import 'package:metro_web/widgets/custom_drawer.dart';

class PerfilLogado extends StatefulWidget {
  const PerfilLogado({super.key});

  @override
  _PerfilLogadoState createState() => _PerfilLogadoState();
}

class _PerfilLogadoState extends State<PerfilLogado> {
  Map<String, dynamic>? userData;

  // Função para simular a recepção de dados JSON do usuário
  void _fetchUserData() {
    String jsonResponse = '''
    {
      "avatar": "https://avatars.githubusercontent.com/u/122751852?v=4",
      "user": "Murilo Molina Barone",
      "email":"murilo@gmail.com",
      "funcao": "ADM",
      "ocupacao": "Desenvolvedor"
    }
    ''';

    setState(() {
      userData = json.decode(jsonResponse);
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchUserData(); // Simula a obtenção dos dados
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(titulo: 'Meu Perfil'),
      drawer: const CustomDrawer(pagType: 1),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Color.fromARGB(255, 212, 212, 212)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: userData == null
              ? const CircularProgressIndicator() // Exibe tela de carregamento
              : Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Avatar com sombra
                      CircleAvatar(
                        radius: 70,
                        backgroundImage: NetworkImage(userData!['avatar']),
                        backgroundColor: Colors.white,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 10,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Nome
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        margin: const EdgeInsets.symmetric(vertical: 10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 6,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Text(
                              userData!['user'],
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const Divider(
                              thickness: 1.5,
                              color: Colors.grey,
                              indent: 10,
                              endIndent: 10,
                            ),
                            // email
                            Text(
                              "E-mail: ${userData!['email']}",
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 5),
                            // Função
                            Text(
                              "Função: ${userData!['funcao']}",
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 5),
                            // Ocupação
                            Text(
                              "Ocupação: ${userData!['ocupacao']}",
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
