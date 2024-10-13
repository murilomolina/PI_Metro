import 'package:flutter/material.dart';
import 'package:metro_web/widgets/card_nav_list.dart';
import 'package:metro_web/widgets/custom_app_bar.dart';
import 'package:metro_web/widgets/custom_drawer.dart';
import 'package:metro_web/widgets/card_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Lista exemplo, futuramente será o resultado da consulta do banco de dados
  final List<Map<String, String>> equipamentos = [
    {"tipo": "Equipamento A", "id": "12345", "dataValidade": "10/10/2024", "Localizacao" : "Linha verde", "Descricao localidade" : "Embaixo da mesa...."},
    {"tipo": "Equipamento B", "id": "54321", "dataValidade": "15/10/2024", "Localizacao" : "Linha verde", "Descricao localidade" : "Embaixo da mesa...."},
    {"tipo": "Equipamento C", "id": "67890", "dataValidade": "20/10/2024", "Localizacao" : "Linha verde", "Descricao localidade" : "Embaixo da mesa...."},
    {"tipo": "Equipamento D", "id": "67891", "dataValidade": "25/10/2024", "Localizacao" : "Linha verde", "Descricao localidade" : "Embaixo da mesa...."},
    {"tipo": "Equipamento E", "id": "67892", "dataValidade": "30/10/2024", "Localizacao" : "Linha verde", "Descricao localidade" : "Embaixo da mesa...."},
    {"tipo": "Equipamento F", "id": "67893", "dataValidade": "05/11/2024", "Localizacao" : "Linha verde", "Descricao localidade" : "Embaixo da mesa...."},
    {"tipo": "Equipamento A", "id": "12345", "dataValidade": "10/10/2024", "Localizacao" : "Linha verde", "Descricao localidade" : "Embaixo da mesa...."},
    {"tipo": "Equipamento B", "id": "54321", "dataValidade": "15/10/2024", "Localizacao" : "Linha verde", "Descricao localidade" : "Embaixo da mesa...."},
    {"tipo": "Equipamento C", "id": "67890", "dataValidade": "20/10/2024", "Localizacao" : "Linha verde", "Descricao localidade" : "Embaixo da mesa...."},
    {"tipo": "Equipamento D", "id": "67891", "dataValidade": "25/10/2024", "Localizacao" : "Linha verde", "Descricao localidade" : "Embaixo da mesa...."},
    {"tipo": "Equipamento E", "id": "67892", "dataValidade": "30/10/2024", "Localizacao" : "Linha verde", "Descricao localidade" : "Embaixo da mesa...."},
    {"tipo": "Equipamento F", "id": "67893", "dataValidade": "05/11/2024", "Localizacao" : "Linha verde", "Descricao localidade" : "Embaixo da mesa...."},
  ];

  // Para a scrollbar dos avisos
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    // Dispose o ScrollController quando a página for descartada
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(titulo: 'Página Inicial',),
      drawer: const CustomDrawer(pagType: 0,), // 0 para página principal
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CardList(
                equipamentos: equipamentos,
                scrollController: _scrollController,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: CardNavList(),
            ),
          ],
        ),
      ),
    );
  }
}
