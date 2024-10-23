// para conectar com o atlas primeiro tem que conectar o compass com o projeto que está no atlas, e em seguida 
// alterar as informações nessa variavel db para as informações presentes no 'Connection info' (no Compass) do cluster referente ao cluster do projeto do atlas 
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mongo_dart/mongo_dart.dart';
void main() async {
  // OBS: o dotenv não deixa o código de teste rodar, portanto é necessário alterar os dotenv da varivel db para os dados corretos.
  var db = Db('mongodb://${dotenv.env['MONGO_USER']}:${dotenv.env['MONGO_PASSWORD']}@'
        '${dotenv.env['HOST_1']},'
        '${dotenv.env['HOST_2']},'
        '${dotenv.env['HOST_3']}/'
        '${dotenv.env['MONGO_DB_NAME']}?authSource=admin&compressors=disabled'
        '&gssapiServiceName=mongodb&replicaSet=${dotenv.env['CLUSTER']}'
        '&ssl=true');


  await db.open();
  print('Conexao OK');
  await db.drop();
  print('====================================================================');
  print('>> Adicionando usuarios');
  var usersCollection = db.collection('users');
  await usersCollection.insertOne({ 'user':"Murilo Molina", 'email': 'murilo@gmail.com', 'senha':"1234", 'ocupacao':"Desenvolvedor", 'funcao': "ADM"});
  
  await usersCollection.find().forEach((v) {
    print(v);
  });
  print('====================================================================');
  print('====================================================================');
  print('>> Adicionando multiplos Users');

  await usersCollection.insertMany([
    { 'user':"Vinicius Parelho", 'email': 'vinivius@gmail.com', 'senha':"1234", 'ocupacao':"Desenvolvedor", 'funcao': "ADM"},
    { 'user':"Usuario1", 'email': 'usuario1@gmail.com', 'senha':"1234", 'ocupacao':"Operador", 'funcao': "USER"}
  ]);
  await usersCollection.find().forEach((user) {
    print(user);
  });
  print('====================================================================');
  db.createCollection('equipamentos');
  var equipamentosCollection = db.collection('equipamentos');
  await equipamentosCollection.insertOne({
    'num_equipamento': 'EQ-9876',
    'patrimonio': '12345',
    'tipo': 'Extintor',
    'capacidade': '2kg',
    'prox_manutencao': '2024-12-31',
    'prox_ret': '2025-06-15',
    'fabricante': 'Fabricante XYZ',
    'area': 'Produção',
    'gerencia': 'Manutenção',
    'setor': 'Mecânica',
    'predio': 'A',
    'local': 'Sala 101',
    'selo_inmetro': 'SIM',
    'nao_conformidade': 'Nenhuma',
    'observacao': 'Operando normalmente',
    'data_inspecao': '2023-10-18'
  });
  print('equipamento inserido');

  print('====================================================================');

  db.createCollection('manutencao_necessaria');
  var manutencaoCollection = db.collection('manutencao_necessaria');
  await manutencaoCollection.insertOne({
    'num_equipamento': 'EQ-9876', // Relacionamento com Equipamento
    'tipo': 'Máquina',
    'setor': 'Mecânica',
    'predio': 'A',
    'local': 'Sala 101'
  });
  print('manutenção definida');


  print('=======================================================================');   
  await db.close();
  print('Conexão fechada.');


}