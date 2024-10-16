import 'package:flutter/material.dart';
import 'package:metro_web/widgets/card_nav_list.dart';
import 'package:metro_web/widgets/custom_app_bar.dart';
import 'package:metro_web/widgets/custom_drawer.dart';
import 'package:metro_web/widgets/card_aviso_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Lista exemplo, futuramente será o resultado da consulta do banco de dados
  final List<Map<String, String>> equipamentos = [
    {"tipo": "Equipamento A", 'patrimonio':'Patrimonio1', 'capacidade': '1 Litro', "id": "12345", "data_validade": "10/10/2024", "localizacao" : "Linha verde", "observacoes" : "Embaixo da mesa....", 'codigo_fabricante': '123456', 'data_fabricacao': '10/05/2022' , 'ultima_recarga': '10/05/2024', 'proxima_inspecao': '25/12/2024', 'status':'Inspeção em dia', 'id_localizacao': '123456789'},
    {"tipo": "Equipamento B", 'patrimonio':'Patrimonio2', 'capacidade': '1 Litro', "id": "54321", "data_validade": "15/10/2024", "localizacao" : "Linha verde", "observacoes" : "Embaixo da mesa....", 'codigo_fabricante': '123456', 'data_fabricacao': '10/05/2022' , 'ultima_recarga': '10/05/2024', 'proxima_inspecao': '25/12/2024', 'status':'Inspeção em dia', 'id_localizacao': '123456789'},
    {"tipo": "Equipamento C", 'patrimonio':'Patrimonio3', 'capacidade': '1 Litro', "id": "67890", "data_validade": "20/10/2024", "localizacao" : "Linha verde", "observacoes" : "Embaixo da mesa....", 'codigo_fabricante': '123456', 'data_fabricacao': '10/05/2022' , 'ultima_recarga': '10/05/2024', 'proxima_inspecao': '25/12/2024', 'status':'Inspeção em dia', 'id_localizacao': '123456789'},
    {"tipo": "Equipamento D", 'patrimonio':'Patrimonio4', 'capacidade': '1 Litro', "id": "67891", "data_validade": "25/10/2024", "localizacao" : "Linha verde", "observacoes" : "Embaixo da mesa....", 'codigo_fabricante': '123456', 'data_fabricacao': '10/05/2022' , 'ultima_recarga': '10/05/2024', 'proxima_inspecao': '25/12/2024', 'status':'Inspeção em dia', 'id_localizacao': '123456789'},
    {"tipo": "Equipamento E", 'patrimonio':'Patrimonio5', 'capacidade': '1 Litro', "id": "67892", "data_validade": "30/10/2024", "localizacao" : "Linha verde", "observacoes" : "Embaixo da mesa....", 'codigo_fabricante': '123456', 'data_fabricacao': '10/05/2022' , 'ultima_recarga': '10/05/2024', 'proxima_inspecao': '25/12/2024', 'status':'Inspeção em dia', 'id_localizacao': '123456789'},
    {"tipo": "Equipamento F", 'patrimonio':'Patrimonio6', 'capacidade': '1 Litro', "id": "67893", "data_validade": "05/11/2024", "localizacao" : "Linha verde", "observacoes" : "Embaixo da mesa....", 'codigo_fabricante': '123456', 'data_fabricacao': '10/05/2022' , 'ultima_recarga': '10/05/2024', 'proxima_inspecao': '25/12/2024', 'status':'Inspeção em dia', 'id_localizacao': '123456789'},
    // {"tipo": "Equipamento A", 'patrimonio':'Patrimonio7', 'capacidade': '1 Litro', "id": "12345", "data_validade": "10/10/2024", "localizacao" : "Linha verde", "observacoes" : "Embaixo da mesa....", 'codigo_fabricante': '123456', 'data_fabricacao': '10/05/2022' , 'ultima_recarga': '10/05/2024', 'proxima_inspecao': '25/12/2024', 'status':'Inspeção em dia', 'id_localizacao': '123456789'},
    // {"tipo": "Equipamento B", 'patrimonio':'Patrimonio8', 'capacidade': '1 Litro', "id": "54321", "data_validade": "15/10/2024", "localizacao" : "Linha verde", "observacoes" : "Embaixo da mesa....", 'codigo_fabricante': '123456', 'data_fabricacao': '10/05/2022' , 'ultima_recarga': '10/05/2024', 'proxima_inspecao': '25/12/2024', 'status':'Inspeção em dia', 'id_localizacao': '123456789'},
    // {"tipo": "Equipamento C", 'patrimonio':'Patrimonio9', 'capacidade': '1 Litro', "id": "67890", "data_validade": "20/10/2024", "localizacao" : "Linha verde", "observacoes" : "Embaixo da mesa....", 'codigo_fabricante': '123456', 'data_fabricacao': '10/05/2022' , 'ultima_recarga': '10/05/2024', 'proxima_inspecao': '25/12/2024', 'status':'Inspeção em dia', 'id_localizacao': '123456789'},
    // {"tipo": "Equipamento D", 'patrimonio':'Patrimonio10', 'capacidade': '1 Litro', "id": "67891", "data_validade": "25/10/2024", "localizacao" : "Linha verde", "observacoes" : "Embaixo da mesa....", 'codigo_fabricante': '123456', 'data_fabricacao': '10/05/2022' , 'ultima_recarga': '10/05/2024', 'proxima_inspecao': '25/12/2024', 'status':'Inspeção em dia', 'id_localizacao': '123456789'},
    // {"tipo": "Equipamento E", 'patrimonio':'Patrimonio11', 'capacidade': '1 Litro', "id": "67892", "data_validade": "30/10/2024", "localizacao" : "Linha verde", "observacoes" : "Embaixo da mesa....", 'codigo_fabricante': '123456', 'data_fabricacao': '10/05/2022' , 'ultima_recarga': '10/05/2024', 'proxima_inspecao': '25/12/2024', 'status':'Inspeção em dia', 'id_localizacao': '123456789'},
    // {"tipo": "Equipamento F", 'patrimonio':'Patrimonio12', 'capacidade': '1 Litro', "id": "67893", "data_validade": "05/11/2024", "localizacao" : "Linha verde", "observacoes" : "Embaixo da mesa....", 'codigo_fabricante': '123456', 'data_fabricacao': '10/05/2022' , 'ultima_recarga': '10/05/2024', 'proxima_inspecao': '25/12/2024', 'status':'Inspeção em dia', 'id_localizacao': '123456789'},
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
              child: CardAvisoList(
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
