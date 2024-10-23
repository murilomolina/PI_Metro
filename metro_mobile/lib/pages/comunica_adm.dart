import 'package:flutter/material.dart';
import 'package:metro_mobile/widgets/custom_appbar.dart';
import 'package:metro_mobile/widgets/custom_drawer.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;

class ComunicaAdm extends StatefulWidget {
  const ComunicaAdm({super.key});

  @override
  _ComunicaAdmState createState() => _ComunicaAdmState();
}

class _ComunicaAdmState extends State<ComunicaAdm> {
  String? selectedEmail; // Email selecionado
  bool showReportOptions = false; // Controla a exibição das opções de relatório
  bool showMessageField = false; // Controla a exibição do campo de mensagem
  String? selectedReport; // Relatório selecionado
  TextEditingController messageController = TextEditingController(); // Controlador para o campo de texto
  List<String> admEmails = []; // Lista para armazenar e-mails dos ADMs

  @override
  void initState() {
    super.initState();
    _loadAdmEmails(); // Carregar emails da coleção 'users'
  }

  // Função para carregar emails de usuários com 'funcao' ADM
  Future<void> _loadAdmEmails() async {
    var db = mongo.Db('mongodb://localhost:27017/metro');
    await db.open();
    var collection = db.collection('users');
    var result = await collection.find({'funcao': 'ADM'}).toList();
    
    setState(() {
      admEmails = result.map((user) => user['email'].toString()).toList(); // Filtra os emails
    });

    await db.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(titulo: 'Comunicação'),
      drawer: const CustomDrawer(pagType: 1),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Dropdown para selecionar email de ADM
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Selecione um e-mail ADM'),
              value: selectedEmail,
              items: admEmails.map((email) {
                return DropdownMenuItem<String>(
                  value: email,
                  child: Text(email),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedEmail = value;
                });
              },
            ),
            const SizedBox(height: 20),
            // Botões de ação
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showReportOptions = true;
                      showMessageField = false;
                    });
                  },
                  child: const Text('Solicitar Relatório'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showReportOptions = false;
                      showMessageField = true;
                    });
                  },
                  child: const Text('Comunicar ADM'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Exibe opções de relatório ou campo de mensagem conforme seleção
            if (showReportOptions) ...[
              const Text('Selecione o Relatório:'),
              DropdownButtonFormField<String>(
                value: selectedReport,
                items: ['Relatório Equipamentos', 'Relatório de Manutenção', 'Relatório de Relação Equipamentos manutenção'].map((report) {
                  return DropdownMenuItem<String>(
                    value: report,
                    child: Text(report),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedReport = value;
                  });
                },
              ),
            ] else if (showMessageField) ...[
              TextField(
                controller: messageController,
                decoration: const InputDecoration(
                  labelText: 'Digite sua mensagem para o ADM',
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
              ),
            ],
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _sendEmail();
                },
                child: const Text('Enviar E-mail'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Função para enviar o email
  void _sendEmail() {
    if (selectedEmail != null) {
      String subject = showReportOptions
          ? 'Solicitação de Relatório: $selectedReport'
          : 'Mensagem para ADM';
      String body = showReportOptions
          ? 'Gostaria de solicitar o seguinte relatório: $selectedReport'
          : messageController.text;

      // lógica para enviar o e-mail
      print('Enviando e-mail para $selectedEmail com o assunto $subject');
      print('Corpo do e-mail: $body');

      // Limpar campos após o envio
      setState(() {
        selectedReport = null;
        messageController.clear();
      });
    }
  }
}
