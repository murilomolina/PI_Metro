// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:metro_mobile/widgets/custom_appbar.dart';
import 'package:metro_mobile/widgets/custom_drawer.dart';
import 'package:qr_bar_code_scanner_dialog/qr_bar_code_scanner_dialog.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';

class ScannerQrcode extends StatefulWidget {
  const ScannerQrcode({super.key});

  @override
  State<ScannerQrcode> createState() => _ScannerQrcodeState();
}

class _ScannerQrcodeState extends State<ScannerQrcode> {
  final _qrBarCodeScannerDialogPlugin = QrBarCodeScannerDialog();
  String? code;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(titulo: 'Página principal'),
      drawer: const CustomDrawer(pagType: 0),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  _qrBarCodeScannerDialogPlugin.getScannedQrBarCode(
                    context: context,
                    onCode: (code) {
                      setState(() {
                        this.code = code;
                      });
                    },
                  );
                },
                child: const Text("Clique para escanear"),
              ),
              const SizedBox(height: 20),
              // Exibe o conteúdo de forma organizada
              if (code != null) _handleQRCode(code!),
            ],
          ),
        ),
      ),
    );
  }

   // Função para tratar e exibir os dados do QR Code
  Widget _handleQRCode(String code) {
    if (Uri.tryParse(code)?.hasAbsolutePath == true || RegExp(r"^https:\/\/\w+\.com$").hasMatch(code)) {
      // Se for uma URL, mostrar botão para abrir no navegador
      return Column(
        children: [
          const Text(
            "QR Code contém uma URL:",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () { 
                _launchURL(code, context);
            },
            child: const Text("Abrir URL"),
          ),
        ],
      );
    } else {
      try {
        var jsonData = jsonDecode(code);
        // Se for JSON, exibir em uma lista de chave-valor
        print("Json data\n"+jsonData);
        return _chaveValor(jsonData);
      } catch (e) {
        // Se for texto comum, exibir como texto simples
        print("Texto comum\n"+code);
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            code,
            textAlign: TextAlign.justify,
            style: const TextStyle(fontSize: 16),
          ),
        );
      }
    }
  }

  // Função para exibir JSON ou chave-valor de forma organizada
  Widget _chaveValor(Map<String, dynamic> data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: data.entries.map((entry) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${entry.key}:',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Flexible(
                child: Text(
                  entry.value.toString(),
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  // Função para abrir URL no navegador
  Future<void> _launchURL(String url, BuildContext context) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
       // ignore: use_build_context_synchronously
       _trataErroUrl(url, context);
    }
  }

  // Função para tratar o erro e exibir o diálogo
  Future<void> _trataErroUrl(String code, BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15), 
          ),
            title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(Icons.error_outline, color: Colors.red),
                  Text(' Erro'),
                ],
              ),
              IconButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 153, 153, 153),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Fechar o pop-up
              },
              icon: const Icon(Icons.close, size: 18),
            ),
            ],
          ),
          content: SingleChildScrollView(
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Não foi possível abrir a URL."),
                  const SizedBox(height: 10),
                  Text("URL: $code"),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {
                      Clipboard.setData(ClipboardData(
                          text: code)); // Copiar URL para área de transferência
                      Navigator.of(context).pop(); // Fechar o diálogo
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("URL copiada para a área de transferência!")),
                      );
                    },
                  icon: const Icon(Icons.copy, size: 18),
                  label: const Text('Copiar Url'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
