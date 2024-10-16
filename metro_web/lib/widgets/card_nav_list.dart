import 'package:flutter/material.dart';
import 'package:metro_web/pages/cadastro_equipamentos.dart';
import 'package:metro_web/pages/controle_equipamentos.dart';
import 'package:metro_web/pages/controle_usuarios.dart';
import 'package:metro_web/pages/qrcode_generator.dart';
import 'package:metro_web/widgets/card_nav.dart';

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
                  CardNav(titulo: 'Controle de usuarios', paginaDestino: ControleUsuarios()),
                  CardNav(titulo: 'Controle de equipamentos', paginaDestino: ControleEquipamentos()),
                  CardNav(titulo: 'Cadastro de equipamentos', paginaDestino: CadastroEquipamentos()),
                  CardNav(titulo: 'Gerador de QR code', paginaDestino: QRcodeGenerator(),)
                ],
              ),
            )
      ],
    );
  }
}
