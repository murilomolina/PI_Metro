import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoUsersConnection {
  // para construir essa conexã com o mongo tem que verificar o Connection info do cluster!!!!
  var db = Db('mongodb://${dotenv.env['MONGO_USER']}:${dotenv.env['MONGO_PASSWORD']}@'
        '${dotenv.env['HOST_1']},'
        '${dotenv.env['HOST_2']},'
        '${dotenv.env['HOST_3']}/'
        '${dotenv.env['MONGO_DB_NAME']}?authSource=admin&compressors=disabled'
        '&gssapiServiceName=mongodb&replicaSet=${dotenv.env['CLUSTER']}'
        '&ssl=true');

  // Método para conectar ao banco de dados
  Future<void> connect() async {
    try {
      await db.open();
      print('Conectado ao banco de dados!');
    } catch (e) {
      print('Erro ao conectar ao banco de dados: $e');
    }
  }

  // Método para adicionar um usuario ao banco de dados
  Future<void> addUsuario(String userName, String senha, String ocupacao, String funcao) async {
    var collection = db.collection('users'); // Nome da coleção

    var usuario = {
      'user': userName,
      'senha': senha,
      'ocupacao': ocupacao,
      'funcao': funcao,
    };

    try {
      await collection.insertOne({
      'user': userName,
      'senha': senha,
      'ocupacao': ocupacao,
      'funcao': funcao,
      }); // Adiciona o documento à coleção
      print('Usuario adicionado com sucesso: $usuario');
    } catch (e) {
      print('Erro ao adicionar Usuario: $e');
    }
  }

  // Método para excluir um usuário pelo nome
  Future<void> deleteUser(String userName) async {
    var collection = db.collection('users'); // Nome da coleção

    try {
      var result = await collection.deleteOne({'userName': userName}); // Exclui o documento pelo nome
      if (result.isAcknowledged) {
        print('Usuário $userName excluído com sucesso.');
      } else {
        print('Usuário $userName não encontrado.');
      }
    } catch (e) {
      print('Erro ao excluir usuário: $e');
    }
  }

  // Método para editar um usuário pelo nome
  Future<void> editUser(String oldUserName, String newUserName, String senha, String ocupacao, String funcao) async {
    var collection = db.collection('users'); 

    // Cria um mapa com os novos dados para atualizar
    var updatedData = {
      'user': newUserName,
      'senha': senha,
      'ocupacao': ocupacao,
      'funcao': funcao,
    };

    try {
      var result = await collection.updateOne(
        {'user': oldUserName}, // Altere isso para o campo correto
        {'\$set': updatedData}
      ); // Atualiza o documento com os novos dados

      if (result.isAcknowledged) {
        print('Usuário $oldUserName editado com sucesso.');
      } else {
        print('Usuário $oldUserName não encontrado ou não foi alterado.');
      }
    } catch (e) {
      print('Erro ao editar usuário: $e');
    }
  }

  // Método existente para buscar todos os usuários sem a senha
  getAllUsers() async {
    var collection = db.collection('users'); // Nome da coleção
    List<Map<String, dynamic>> usersList = [];

    try {
      // Aqui você faz a busca e exclui o campo 'senha' usando projeção
      await collection.find().forEach((user) {
        usersList.add(user);
      }); // O segundo argumento é o filtro de projeção

      return usersList;
    } catch (e) {
      print('Erro ao buscar usuários: $e');
      return usersList;
    }
  }

  // Método para fechar a conexão
  Future<void> close() async {
    await db.close();
    print('Conexão fechada.');
  }
}
