import 'package:flutter/material.dart';
import 'package:metro_web/widgets/custom_app_bar.dart';
import 'package:metro_web/widgets/custom_drawer.dart';

class CadastroEquipamentos extends StatefulWidget {
  const CadastroEquipamentos({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CadastroEquipamentosState createState() => _CadastroEquipamentosState();
}

class _CadastroEquipamentosState extends State<CadastroEquipamentos> {
  final _formKey = GlobalKey<FormState>();

  // Controladores para os campos do formulário
  final TextEditingController numEquipamentoController = TextEditingController();
  final TextEditingController patrimonioController = TextEditingController();
  final TextEditingController tipoController = TextEditingController();
  final TextEditingController capacidadeController = TextEditingController();
  final TextEditingController proxManutencaoController = TextEditingController();
  final TextEditingController proxRetController = TextEditingController();
  final TextEditingController fabricanteController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController gerenciaController = TextEditingController();
  final TextEditingController setorController = TextEditingController();
  final TextEditingController predioController = TextEditingController();
  final TextEditingController localController = TextEditingController();
  final TextEditingController seloInmetroController = TextEditingController();
  final TextEditingController naoConformidadeController = TextEditingController();
  final TextEditingController observacaoController = TextEditingController();
  final TextEditingController dataInspecaoController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(titulo: 'Cadastro de equipamentos'),
      drawer: const CustomDrawer(pagType: 1),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      'Insira as informações do Equipamento',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                ],
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: numEquipamentoController,
                decoration: const InputDecoration(labelText: 'Número do Equipamento', border: OutlineInputBorder()),
                validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: patrimonioController,
                decoration: const InputDecoration(labelText: 'Patrimônio', border: OutlineInputBorder()),
                validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: tipoController,
                decoration: const InputDecoration(labelText: 'Tipo de Equipamento', border: OutlineInputBorder()),
                validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: capacidadeController,
                decoration: const InputDecoration(labelText: 'Capacidade', border: OutlineInputBorder()),
                validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: proxManutencaoController,
                decoration: const InputDecoration(labelText: 'Próxima Manutenção', border: OutlineInputBorder()),
                validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: proxRetController,
                decoration: const InputDecoration(labelText: 'Próxima Ret', border: OutlineInputBorder()),
                validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: fabricanteController,
                decoration: const InputDecoration(labelText: 'Fabricante', border: OutlineInputBorder()),
                validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: areaController,
                decoration: const InputDecoration(labelText: 'Area', border: OutlineInputBorder()),
                validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: gerenciaController,
                decoration: const InputDecoration(labelText: 'Gerência', border: OutlineInputBorder()),
                validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: setorController,
                decoration: const InputDecoration(labelText: 'Setor', border: OutlineInputBorder()),
                validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: predioController,
                decoration: const InputDecoration(labelText: 'Prédio', border: OutlineInputBorder()),
                validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: localController,
                decoration: const InputDecoration(labelText: 'Local', border: OutlineInputBorder()),
                validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: seloInmetroController,
                decoration: const InputDecoration(labelText: 'Selo Inmetro', border: OutlineInputBorder()),
                validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: naoConformidadeController,
                decoration: const InputDecoration(labelText: 'Não Conformidade', border: OutlineInputBorder()),
                validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: observacaoController,
                decoration: const InputDecoration(labelText: 'Observação', border: OutlineInputBorder()),
                validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: dataInspecaoController,
                decoration: const InputDecoration(labelText: 'Data Inspeção', border: OutlineInputBorder()),
                validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed:() {
                      cadastrarEquipamento();
                    },
                    child: const Text('Cadastrar'),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        _limparCampos();
                      },
                      style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => Colors.red)),
                      child: const Text('Limpar Campos'),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

   // Função para limpar os campos do formulário
  void _limparCampos() {
    numEquipamentoController.clear();
    patrimonioController.clear();
    tipoController.clear();
    capacidadeController.clear();
    proxManutencaoController.clear();
    proxRetController.clear();
    fabricanteController.clear();
    areaController.clear();
    gerenciaController.clear();
    setorController.clear();
    predioController.clear();
    localController.clear();
    seloInmetroController.clear();
    naoConformidadeController.clear();
    observacaoController.clear();
    dataInspecaoController.clear();
  }


  // Função simulada para cadastrar equipamento
  Future<void> cadastrarEquipamento() async {
    if (_formKey.currentState!.validate()) {
      // Simulação de um equipamento a ser cadastrado
      final Map<String, dynamic> equipamento = {
        'num_equipamento': numEquipamentoController.text,
        'patrimonio': patrimonioController.text,
        'tipo': tipoController.text,
        'capacidade': capacidadeController.text,
        'prox_manutencao': proxManutencaoController.text,
        'prox_ret': proxRetController.text,
        'fabricante': fabricanteController.text,
        'area': areaController.text,
        'gerencia': gerenciaController.text,
        'setor': setorController.text,
        'predio': predioController.text,
        'local': localController.text,
        'selo_inmetro': seloInmetroController.text,
        'nao_conformidade': naoConformidadeController.text,
        'observacao': observacaoController.text,
        'data_inspecao': dataInspecaoController.text,
      };
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Equipamento está sendo cadastrado')),
      );
      // Simulando uma operação de envio (poderia ser uma requisição HTTP)
      await Future.delayed(const Duration(seconds: 2)); 


      // Sucesso no cadastro
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Equipamento cadastrado com sucesso: $equipamento')),
      );

      // Limpar campos após o cadastro ainda não me decidi se isso seria bom kkkk
      // _limparCampos();

    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Preencha todos os campos obrigatórios.')),
      );
    }
  }
}
