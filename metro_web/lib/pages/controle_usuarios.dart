import 'package:flutter/material.dart';
import 'package:metro_web/widgets/custom_app_bar.dart';
import 'package:metro_web/widgets/custom_drawer.dart';

class ControleUsuarios extends StatelessWidget {
  const ControleUsuarios({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(titulo: 'Controle de Usuários'),
      drawer: CustomDrawer(pagType: 1), // 1 para páginas que não são a página principal
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Wrap( 
              spacing: 8.0, 
              runSpacing: 8.0, 
              children: [
                
              ],
            ),
          ],
        ),
      ),
    );
  }
}
