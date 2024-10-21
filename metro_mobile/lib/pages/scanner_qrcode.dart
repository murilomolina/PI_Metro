// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
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
    if (Uri.tryParse(code)?.hasAbsolutePath == true) {
      // Se for uma URL, mostrar botão para abrir no navegador
      return Column(
        children: [
          const Text(
            "QR Code contém uma URL:",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => _launchURL(code),
            child: const Text("Abrir URL"),
          ),
        ],
      );
    } else {
      try {
        var jsonData = jsonDecode(code);
        // Se for JSON, exibir em uma lista de chave-valor
        return _chaveValor(jsonData);
      } catch (e) {
        // Se for texto comum, exibir como texto simples
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
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Não foi possível abrir $url';
    }
  }
}
