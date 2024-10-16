import 'package:flutter/material.dart';
import 'package:metro_web/widgets/custom_app_bar.dart';
import 'package:metro_web/widgets/custom_drawer.dart';

class ControleEquipamentos extends StatelessWidget {
  const ControleEquipamentos({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(titulo: 'Controle de equipamentos',),
      drawer: CustomDrawer(pagType: 1),
      body: Center(
        child: Text("Em construção"),
      ),
    );
  }
}