import 'package:flutter/material.dart';
import 'card_aviso.dart';

class CardAvisoList extends StatelessWidget {
  final List<Map<String, String>> equipamentos;
  final ScrollController scrollController;

  const CardAvisoList({
    super.key,
    required this.equipamentos,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Equipamentos próximos a data de validade/inspeção",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Scrollbar(
          thumbVisibility: true, // Exibir sempre a barra de rolagem
          controller: scrollController,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: scrollController, // Atribui o ScrollController aqui também
            child: Row(
              children: equipamentos.map((equipamento) {
                return Padding(
                  padding: const EdgeInsets.all(20), // espaçamento entre os cards
                  child: CardAviso(
                    titulo: equipamento['tipo'] ?? 'Sem tipo',
                    equipamentoId: equipamento['id'] ?? 'Sem ID',
                    dataValidade: equipamento['dataValidade'] ?? 'Sem data',
                    tipoEquipamento: equipamento['tipo'] ?? 'Sem Tipo',
                    localizacao: equipamento['Localizacao'] ?? 'Sem Localização',
                    localizacaoDetalhada: equipamento['Descricao localidade'] ?? 'Sem detalhamento',
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}