import 'package:flutter/material.dart';
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
    {"tipo": "Equipamento A", "id": "12345", "dataValidade": "10/10/2024"},
    {"tipo": "Equipamento B", "id": "54321", "dataValidade": "15/10/2024"},
    {"tipo": "Equipamento C", "id": "67890", "dataValidade": "20/10/2024"},
    {"tipo": "Equipamento D", "id": "67891", "dataValidade": "25/10/2024"},
    {"tipo": "Equipamento E", "id": "67892", "dataValidade": "30/10/2024"},
    {"tipo": "Equipamento F", "id": "67893", "dataValidade": "05/11/2024"},
    {"tipo": "Equipamento A", "id": "12345", "dataValidade": "10/10/2024"},
    {"tipo": "Equipamento B", "id": "54321", "dataValidade": "15/10/2024"},
    {"tipo": "Equipamento C", "id": "67890", "dataValidade": "20/10/2024"},
    {"tipo": "Equipamento D", "id": "67891", "dataValidade": "25/10/2024"},
    {"tipo": "Equipamento E", "id": "67892", "dataValidade": "30/10/2024"},
    {"tipo": "Equipamento F", "id": "67893", "dataValidade": "05/11/2024"},
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
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CardList(
            equipamentos: equipamentos,
            scrollController: _scrollController,
          ),
        ],
      ),
    );
  }
}
