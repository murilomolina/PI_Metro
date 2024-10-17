
import 'package:mongo_dart/mongo_dart.dart';

void main() async {
  var db = Db('mongodb://localhost:27017/metro');
  
  await db.open();
  print('Conexao OK');
  await db.drop();
  print('====================================================================');
  print('>> Adicionando usuarios');
  var collection = db.collection('users');
  await collection.insertOne({ 'user':"Murilo Molina", 'senha':"1234", 'ocupacao':"Desenvolvedor", 'funcao': "ADM"});
  
  await collection.find().forEach((v) {
    print(v);
  });
  print('====================================================================');
  print('====================================================================');
  print('>> Adding Users');
  var usersCollection = db.collection('users');
  await usersCollection.insertMany([
    { 'user':"Vinicius Parelho", 'senha':"1234", 'ocupacao':"Desenvolvedor", 'funcao': "ADM"},
    { 'user':"Usuario1", 'senha':"1234", 'ocupacao':"Operador", 'funcao': "USER"}
  ]);
  await usersCollection.find().forEach((user) {
    print(user);
  });
  print('====================================================================');
  await db.close();
}