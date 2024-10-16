import 'package:flutter/material.dart';
import 'package:metro_web/pages/home_page.dart';

class InformacoesPopUp extends StatelessWidget { // essa classe está sendo utilizada apenas na card_aviso e card_aviso_list!!!
  final String tipoEquipamento;
  final String equipamentoId;
  final String dataValidade;
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


  const InformacoesPopUp({
    super.key,
    required this.tipoEquipamento,
    required this.equipamentoId,
    required this.dataValidade,
    required this.localizacao,
    required this.observacoes, required this.patrimonio, required this.capacidade, required this.codigo_fabricante, required this.data_fabricacao, required this.ultima_recarga, required this.proxima_inspecao, required this.status, required this.id_localizacao,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), 
      ),
      title: Row(
        children: [
          Icon(Icons.info_outline, color: Theme.of(context).primaryColor),
          const SizedBox(width: 10),
          const Text('Informações complementares'),
        ],
      ),
      content: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mais informações sobre o $tipoEquipamento',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const Divider(thickness: 1),
              const SizedBox(height: 8),
              _buildInfoRow('ID', equipamentoId),
              _buildInfoRow('Data de Validade', dataValidade),
              _buildInfoRow('Localização atual', localizacao),
              _buildInfoRow('Observações', observacoes),
              _buildInfoRow('Patrimonio', patrimonio),
              _buildInfoRow('Código fabricante', codigo_fabricante),
              _buildInfoRow('Data de fabricação', data_fabricacao),
              _buildInfoRow('Última recarga', ultima_recarga),
              _buildInfoRow('Próxima Inspeção', proxima_inspecao),  
              _buildInfoRow('Status',  status),
              _buildInfoRow('Id de localização', id_localizacao),              
            ],
          ),
        ),
      ),
      actions: <Widget>[
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[600],
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          onPressed: () {
            Navigator.of(context).pop(); // Fechar o pop-up
          },
          icon: const Icon(Icons.close, size: 18),
          label: const Text('Fechar'),
        ),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()), // futuramente alterar para a página de equipamentos
            );
          },
          icon: const Icon(Icons.arrow_forward, size: 18),
          label: const Text('Página de Equipamentos'),
        ),
      ],
    );
  }

  // Função auxiliar para criar uma linha de informações estilizadas
  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16
            ),
          ),
          Text(value),
        ],
      ),
    );
  }
}
