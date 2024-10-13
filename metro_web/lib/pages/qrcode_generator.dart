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
  final TextEditingController localizacaoDetalhadaController = TextEditingController();

  // Variável para armazenar o QR Code
  GlobalKey qrKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(titulo: 'Gerador de QR Code'),
      drawer: const CustomDrawer(pagType: 1),
      body: Center(
        child: SingleChildScrollView( // Permitir rolagem se necessário
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
                
                // Campos de entrada
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
                  controller: localizacaoDetalhadaController,
                  decoration: const InputDecoration(
                    labelText: 'Localização Detalhada',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                
                // Botão para gerar QR Code
                ElevatedButton(
                  onPressed: () {
                    setState(() {}); // Atualizar a interface para gerar o QR Code
                  },
                  child: const Text('Gerar QR Code'),
                ),
                const SizedBox(height: 20),
                
                // Exibindo o QR Code se os dados forem preenchidos
                if (tipoEquipamentoController.text.isNotEmpty &&
                    equipamentoIdController.text.isNotEmpty &&
                    dataValidadeController.text.isNotEmpty &&
                    localizacaoController.text.isNotEmpty &&
                    localizacaoDetalhadaController.text.isNotEmpty)
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
    return 'Tipo de Equipamento: ${tipoEquipamentoController.text}\n'
           'ID: ${equipamentoIdController.text}\n'
           'Data de Validade: ${dataValidadeController.text}\n'
           'Localização: ${localizacaoController.text}\n'
           'Localização Detalhada: ${localizacaoDetalhadaController.text}';
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
        final String path = '${directory!.path}/qrcode$tipoEquipamentoController-$equipamentoIdController.png';
        
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
        const SnackBar(content: Text('Permissão para acessar armazenamento não concedida.')),
      );
    }
  }

}
