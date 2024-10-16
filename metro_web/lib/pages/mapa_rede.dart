import 'package:flutter/material.dart';
import 'package:metro_web/widgets/custom_app_bar.dart';
import 'package:metro_web/widgets/custom_drawer.dart';

class MapaRede extends StatefulWidget {
  const MapaRede({super.key});

  @override
  _MapaRedeState createState() => _MapaRedeState();
}

class _MapaRedeState extends State<MapaRede> {
  bool _isLoading = true; // Estado de carregamento

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(titulo: 'Mapa de Rede'),
      drawer: const CustomDrawer(pagType: 1),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0), // Padding de 10.0
          child: Center(
            child: Column(
              children: [
                // Exibir o indicador de carregamento enquanto a imagem carrega
                if (_isLoading)
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
                Image.asset(
                  'assets/mapa/mapaderede_metro.jpg',
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                  key: const ValueKey('image'),
                  // Detecta quando a imagem foi completamente carregada
                  frameBuilder: (BuildContext context, Widget child, int? frame, bool wasSynchronouslyLoaded) {
                    if (wasSynchronouslyLoaded || frame != null) {
                      // Quando a imagem é carregada, remover o loading
                      Future.delayed(Duration.zero, () {
                        if (mounted) {
                          setState(() {
                            _isLoading = false;
                          });
                        }
                      });
                      return child; // Retorna a imagem carregada
                    } else {
                      return const Center(
                        child: Text('Carregando a imagem'),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
