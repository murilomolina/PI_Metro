import 'package:flutter/material.dart';
import 'package:metro_web/widgets/custom_app_bar.dart';
import 'package:metro_web/widgets/custom_drawer.dart';

class CadastroEquipamentos extends StatelessWidget {
  const CadastroEquipamentos({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(titulo: 'Cadastro de equipamentos',),
      drawer: CustomDrawer(pagType: 1),
      body: Center(
        child: Text("Em construção"),
      ),
    );
  }
}