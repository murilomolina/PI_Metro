
import 'package:mongo_dart/mongo_dart.dart';

void main() async {
  var db = Db('mongodb://localhost:27017/metro');
  
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
    { 'user':"Vinicius Parelho", 'email': 'vinicius@gmail.com', 'senha':"1234", 'ocupacao':"Desenvolvedor", 'funcao': "ADM"},
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
}