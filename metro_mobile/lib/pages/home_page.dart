import 'package:flutter/material.dart';
import 'package:metro_mobile/widgets/custom_appbar.dart';
import 'package:metro_mobile/widgets/custom_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(titulo: 'Página principal'),
      drawer: CustomDrawer(pagType: 0),
      body: Center(child: Column(
        children: [
          Text('Em desenvolvimento'),
          // ElevatedButton(onPressed: () {
          //   Navigator.pop(context);
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => const LoginPage()),
          //       );
          // }, child: const Text('Exemplo de página de login'),
          // )
        ],
      ),),
    );
  }
}