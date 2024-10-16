// ignore_for_file: use_build_context_synchronously

import 'dart:ui' as ui;
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:metro_web/widgets/custom_app_bar.dart';
import 'package:metro_web/widgets/custom_drawer.dart';
import 'package:qr_flutter/qr_flutter.dart'; 
import 'package:path_provider/path_provider.dart'; // Para encontrar o diretório
import 'package:permission_handler/permission_handler.dart'; // Para permissões

class QRcodeGenerator extends StatefulWidget {
  const QRcodeGenerator({super.key});

  @override
  _QRcodeGeneratorState createState() => _QRcodeGeneratorState();
}

class _QRcodeGeneratorState extends State<QRcodeGenerator> {
  // Controladores para os campos de entrada
  final TextEditingController tipoEquipamentoController = TextEditingController();
  final TextEditingController equipamentoIdController = TextEditingController();
  final TextEditingController dataValidadeController = TextEditingController();
  final TextEditingController localizacaoController = TextEditingController();
  final TextEditingController observacoesController = TextEditingController();
  final TextEditingController patrimonioController = TextEditingController(); 
  final TextEditingController capacidadeController = TextEditingController(); 
  final TextEditingController codigo_fabricanteController = TextEditingController(); 
  final TextEditingController data_fabricacaoController = TextEditingController(); 
  final TextEditingController ultima_recargaController = TextEditingController(); 
  final TextEditingController proxima_inspecaoController = TextEditingController(); 
  final TextEditingController statusController = TextEditingController(); 
  final TextEditingController id_localizacaoController = TextEditingController(); 

  // Variável para armazenar o QR Code
  GlobalKey qrKey = GlobalKey();
  bool isSimpleMode = false; // Controle para o modo simples

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(titulo: 'Gerador de QR Code'),
      drawer: const CustomDrawer(pagType: 1),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Insira as informações do Equipamento',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                
                // Switch para alternar entre o modo completo e simples
                SwitchListTile(
                  activeTrackColor: Theme.of(context).primaryColor,
                  title: const Text('Modo Simples (ID e Patrimônio)', textAlign: TextAlign.end, style: TextStyle(fontWeight: ui.FontWeight.bold),),
                  value: isSimpleMode,
                  onChanged: (value) {
                    setState(() {
                      isSimpleMode = value;
                    });
                  },
                ),
                
                // Campos de entrada
                if (!isSimpleMode) ...[
                  TextField(
                    controller: tipoEquipamentoController,
                    decoration: const InputDecoration(
                      labelText: 'Tipo de Equipamento',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: equipamentoIdController,
                    decoration: const InputDecoration(
                      labelText: 'ID do Equipamento',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: dataValidadeController,
                    decoration: const InputDecoration(
                      labelText: 'Data de Validade',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: localizacaoController,
                    decoration: const InputDecoration(
                      labelText: 'Localização',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: observacoesController,
                    decoration: const InputDecoration(
                      labelText: 'Observações',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: patrimonioController,
                    decoration: const InputDecoration(
                      labelText: 'Patrimônio',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: capacidadeController,
                    decoration: const InputDecoration(
                      labelText: 'Capacidade',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: codigo_fabricanteController,
                    decoration: const InputDecoration(
                      labelText: 'Código do Fabricante',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: data_fabricacaoController,
                    decoration: const InputDecoration(
                      labelText: 'Data de Fabricação',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: ultima_recargaController,
                    decoration: const InputDecoration(
                      labelText: 'Última Recarga',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: proxima_inspecaoController,
                    decoration: const InputDecoration(
                      labelText: 'Próxima Inspeção',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: statusController,
                    decoration: const InputDecoration(
                      labelText: 'Status',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: id_localizacaoController,
                    decoration: const InputDecoration(
                      labelText: 'ID da Localização',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                ] else ...[
                  TextField(
                    controller: equipamentoIdController,
                    decoration: const InputDecoration(
                      labelText: 'ID do Equipamento',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: patrimonioController,
                    decoration: const InputDecoration(
                      labelText: 'Patrimônio',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
                
                // Botão para gerar QR Code
                ElevatedButton(
                  onPressed: () {
                    setState(() {}); // Atualizar a interface para gerar o QR Code
                  },
                  child: const Text('Gerar QR Code'),
                ),
                const SizedBox(height: 20),
                
                // Exibindo o QR Code se os dados forem preenchidos
                if ((isSimpleMode && 
                    equipamentoIdController.text.isNotEmpty && 
                    patrimonioController.text.isNotEmpty) ||
                    (!isSimpleMode && 
                    tipoEquipamentoController.text.isNotEmpty && 
                    equipamentoIdController.text.isNotEmpty &&
                    dataValidadeController.text.isNotEmpty &&
                    localizacaoController.text.isNotEmpty &&
                    observacoesController.text.isNotEmpty))
                  Column(
                    children: [
                      QrImageView(
                        key: qrKey,
                        data: _generateQrData(),
                        version: QrVersions.auto,
                        size: 200.0,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _saveQrCode, // Método para salvar o QR Code
                        child: const Text('Salvar QR Code'),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Método para gerar a string do QR Code
  String _generateQrData() {
    if (isSimpleMode) {
      return 'ID: ${equipamentoIdController.text}\n'
             'Patrimônio: ${patrimonioController.text}';
    } else {
      return 'Tipo de Equipamento: ${tipoEquipamentoController.text}\n'
             'ID: ${equipamentoIdController.text}\n'
             'Data de Validade: ${dataValidadeController.text}\n'
             'Localização: ${localizacaoController.text}\n'
             'Observações: ${observacoesController.text}\n'
             'Patrimônio: ${patrimonioController.text}\n'
             'Capacidade: ${capacidadeController.text}\n'
             'Código do Fabricante: ${codigo_fabricanteController.text}\n'
             'Data de Fabricação: ${data_fabricacaoController.text}\n'
             'Última Recarga: ${ultima_recargaController.text}\n'
             'Próxima Inspeção: ${proxima_inspecaoController.text}\n'
             'Status: ${statusController.text}\n'
             'ID da Localização: ${id_localizacaoController.text}';
    }
  }

  // Método para salvar o QR Code
  Future<void> _saveQrCode() async {
    // Solicitar permissão para acessar armazenamento
    var status = await Permission.storage.request();
    if (status.isGranted) {
      try {
        // Gerar a imagem do QR Code
        RenderRepaintBoundary boundary = qrKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
        ui.Image image = await boundary.toImage(pixelRatio: 3.0);
        ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
        Uint8List pngBytes = byteData!.buffer.asUint8List();

        // Obter o diretório para salvar a imagem
        final directory = await getExternalStorageDirectory();
        final String path = '${directory!.path}/qrcode_${tipoEquipamentoController.text}_${equipamentoIdController.text}.png';
        
        // Criar o arquivo e salvar a imagem
        File imgFile = File(path);
        await imgFile.writeAsBytes(pngBytes);
        
        // Exibir um snackbar confirmando que o QR Code foi salvo
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('QR Code salvo em: $path')),
        );
      } catch (e) {
        // Exibir um snackbar em caso de erro
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao salvar o QR Code: $e')),
        );
      }
    } else {
      // Exibir um snackbar se a permissão não for concedida
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Permissão de armazenamento negada')),
      );
    }
  }

  // Método para processar apenas ID e Patrimônio
  void _processIdAndPatrimonio() {
    String id = equipamentoIdController.text;
    String patrimonio = patrimonioController.text;

  // aqui nessa função minha intenção é fazer uma pesquisa no banco de dados usando como parametros o id e o patrimonio e o resultado da pesquisa (todos os outros parametros do extintor) serão inseridos no QRCode.

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Dados Processados'),
          content: Text('ID: $id\nPatrimônio: $patrimonio'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}