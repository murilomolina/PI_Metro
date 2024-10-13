import 'package:flutter/material.dart';
import 'package:metro_web/pages/controle_usuarios.dart';
import 'package:metro_web/pages/home_page.dart';
import 'package:metro_web/pages/qrcode_generator.dart';
import 'package:metro_web/widgets/card_navigator.dart';

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
                  CardNavigator(titulo: 'Cadastro de usuarios', paginaDestino: HomePage()), 
                  CardNavigator(titulo: 'Controle de usuarios', paginaDestino: ControleUsuarios()),
                  CardNavigator(titulo: 'Controle de equipamentos', paginaDestino: HomePage()),
                  CardNavigator(titulo: 'Cadastro de equipamentos', paginaDestino: HomePage()),
                  CardNavigator(titulo: 'Gerador de QR code', paginaDestino: QRcodeGenerator(),)
                ],
              ),
            )
      ],
    );
  }
}
