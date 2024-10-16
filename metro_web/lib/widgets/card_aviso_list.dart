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
                    patrimonio: equipamento['patrimonio'] ?? 'Sem Patrimônio',
                    capacidade: equipamento['capacidade'] ?? 'Sem capacidade definida',
                    codigo_fabricante: equipamento['codigo_fabricante'] ?? 'Sem código fabricante',
                    data_fabricacao: equipamento['data_fabricacao'] ?? 'Sem data de fabricação',
                    dataValidade: equipamento['data_validade'] ?? 'Sem data de validade',
                    ultima_recarga: equipamento['ultima_recarga'] ?? 'Sem data de ultima recarga',
                    proxima_inspecao: equipamento['proxima_inspecao'] ?? 'Sem data para a próxima inspeção',
                    status: equipamento['status'] ?? 'Sem status definido',
                    id_localizacao: equipamento['id_localizacao'] ?? 'Sem id de localizaçãp',
                    equipamentoId: equipamento['id'] ?? 'Sem ID',
                    tipoEquipamento: equipamento['tipo'] ?? 'Sem Tipo',
                    localizacao: equipamento['localizacao'] ?? 'Sem Localização', // fruto de uma query da tabela localizacoes!
                    observacoes: equipamento['observacoes'] ?? 'Sem detalhamento',
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
