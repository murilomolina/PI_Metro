import 'package:flutter/material.dart';
import 'card_aviso.dart';

class CardList extends StatelessWidget {
  final List<Map<String, String>> equipamentos;
  final ScrollController scrollController;

  const CardList({
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
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Equipamentos próximos a data de validade/inspeção",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
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
                  child: cardAviso(
                    equipamento['tipo'] ?? 'Sem tipo',
                    equipamento['id'] ?? 'Sem ID',
                    equipamento['dataValidade'] ?? 'Sem data',
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
