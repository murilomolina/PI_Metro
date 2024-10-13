import 'package:flutter/material.dart';
import 'package:metro_web/widgets/informacoes_pop_up.dart';

class CardAviso extends StatelessWidget {
  final String titulo;
  final String equipamentoId;
  final String dataValidade;
  final String tipoEquipamento;
  final String localizacao;
  final String localizacaoDetalhada;

  const CardAviso({super.key, required this.titulo, required this.equipamentoId, required this.dataValidade, required this.tipoEquipamento, required this.localizacao, required this.localizacaoDetalhada});

 @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      surfaceTintColor: Colors.red,
      child: Container(
        width: 150, 
        height: 180,
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
              "Equipamento ID: $equipamentoId", 
              style: const TextStyle(fontSize: 14),
            ),
            
            // Data de validade puxada do banco de dados
            Text(
              "Validade: $dataValidade",
              style: const TextStyle(
                fontSize: 12, 
                color: Colors.redAccent, 
              ),
            ),
            
            // Botão para verificar
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return InformacoesPopUp(
                      tipoEquipamento: tipoEquipamento,
                      equipamentoId: equipamentoId,
                      dataValidade: dataValidade,
                      localizacao: localizacao,
                      localizacaoDetalhada: localizacaoDetalhada,
                    );
                  },
                );
              },
              child: const Text('Verificar'),
            ),
          ],
        ),
      ),
    );
  }
}