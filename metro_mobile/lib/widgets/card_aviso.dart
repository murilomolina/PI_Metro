import 'package:flutter/material.dart';
import 'package:metro_mobile/widgets/informacoes_pop_up.dart';

class CardAviso extends StatelessWidget {
  final String titulo;
  final String equipamentoId;
  final String dataValidade;
  final String tipoEquipamento;
  final String localizacao;
  final String observacoes;
  final String patrimonio;
  final String capacidade;
  final String codigo_fabricante;
  final String data_fabricacao;
  final String ultima_recarga;
  final String proxima_inspecao;
  final String status;
  final String id_localizacao;


  const CardAviso({
    super.key,
    required this.titulo,
    required this.equipamentoId,
    required this.dataValidade,
    required this.tipoEquipamento,
    required this.localizacao,
    required this.observacoes, required this.patrimonio, required this.capacidade, required this.codigo_fabricante, required this.data_fabricacao, required this.ultima_recarga, required this.proxima_inspecao, required this.status, required this.id_localizacao,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), // Bordas arredondadas
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 228, 228, 228),
              Color.fromARGB(255, 255, 255, 255),
            ], 
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
          borderRadius: BorderRadius.circular(15), // Mantendo as bordas arredondadas
        ),
        width: 150,
        height: 180, 
        padding: const EdgeInsets.all(10), // Padding maior
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, 
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Título em destaque com ícone
            Row(
              children: [
                Expanded(
                  child: Text(
                    titulo,
                    style: const TextStyle(
                      fontSize: 18, 
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            // Texto do equipamento
            Text(
              "Equipamento ID: $equipamentoId",
              style: const TextStyle(fontSize: 14),
            ),

            // Data de validade
            Text(
              "Validade: $dataValidade",
              style: const TextStyle(
                fontSize: 14,
                color: Color.fromARGB(255, 255, 0, 0),
                fontWeight: FontWeight.bold, 
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
                      observacoes: observacoes, 
                      patrimonio: patrimonio, 
                      capacidade: capacidade, 
                      codigo_fabricante: codigo_fabricante, 
                      data_fabricacao: data_fabricacao, 
                      ultima_recarga: ultima_recarga, 
                      proxima_inspecao: proxima_inspecao, 
                      status: status, 
                      id_localizacao: id_localizacao,
                      
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(255, 68, 55, 1), // Altere para a cor desejada
                foregroundColor: Colors.white, // Cor do texto
              ),
              child: const Text(
                'Mais Info',
                style: TextStyle(
                  fontSize: 14, 
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
