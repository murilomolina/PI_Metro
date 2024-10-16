import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:metro_web/widgets/custom_app_bar.dart';
import 'package:metro_web/widgets/custom_drawer.dart';

class MapaRede extends StatelessWidget {
  const MapaRede({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const CustomAppBar(titulo: 'Mapa de Rede',),
      drawer: const CustomDrawer(pagType: 1),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(child: Image.asset('../assets/mapa/mapaderede_metro.jpg'),),
      ),
    );
  }
}