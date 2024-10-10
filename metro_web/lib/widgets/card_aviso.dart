import 'package:flutter/material.dart';

Widget cardAviso(String titulo,String equipamentoId, String dataValidade) {
  return Card(
    elevation: 10,
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
              color: Colors.redAccent, // Exemplo de cor para chamar atenção à data
            ),
          ),
          
          // Botão para verificar
          ElevatedButton(
            onPressed: () {
              print('Redirecionamento para tela de equipamentos');
            },
            child: const Text('Verificar'),
          ),
        ],
      ),
    ),
  );
}