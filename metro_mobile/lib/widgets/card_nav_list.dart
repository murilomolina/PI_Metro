import 'package:flutter/material.dart';
import 'package:metro_mobile/pages/perfil_logado.dart';
import 'package:metro_mobile/pages/scanner_qrcode.dart';

import 'package:metro_mobile/widgets/card_nav.dart';

class CardNavList extends StatelessWidget {
  const CardNavList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Opções de navegação",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Wrap(
                spacing: 40.0, 
                runSpacing: 40.0, 
                children: [
                  CardNav(titulo: 'Scanner de QR code', paginaDestino: ScannerQrcode(),),
                  CardNav(titulo: 'Meu perfil', paginaDestino: PerfilLogado(),),
                  

                ],
              ),
            )
      ],
    );
  }
}
