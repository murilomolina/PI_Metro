import 'package:mongo_dart/mongo_dart.dart';

class MongoUsersConnection {
  late Db db;

  // Inicializa a URI do MongoDB
  MongoUsersConnection() {
    db = Db('mongodb://localhost:27017/metro');  // nome do banco de dados "metro"
  }

  // Método para conectar ao banco de dados
  Future<void> connect() async {
    try {
      await db.open();
      print('Conectado ao banco de dados!');
    } catch (e) {
      print('Erro ao conectar ao banco de dados: $e');
    }
  }

  // Método para adicionar um documento ao banco de dados
  Future<void> addDocument(String userName, String senha, String ocupacao, String funcao) async {
    var collection = db.collection('users'); // Nome da coleção

    var document = {
      'userName': userName,
      'senha': senha,
      'ocupacao': ocupacao,
      'funcao': funcao,
    };

    try {
      await collection.insertOne(document); // Adiciona o documento à coleção
      print('Documento adicionado com sucesso: $document');
    } catch (e) {
      print('Erro ao adicionar documento: $e');
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
  Future<void> editUser(String userName, String senha, String ocupacao, String funcao) async {
    var collection = db.collection('users'); // Nome da coleção

    // Cria um mapa com os novos dados para atualizar
    var updatedData = {
      'senha': senha,
      'ocupacao': ocupacao,
      'funcao': funcao,
    };

    try {
      var result = await collection.updateOne(
        {'userName': userName}, 
        {'\$set': updatedData}
      ); // Atualiza o documento com os novos dados

      if (result.isAcknowledged) {
        print('Usuário $userName editado com sucesso.');
      } else {
        print('Usuário $userName não encontrado ou não foi alterado.');
      }
    } catch (e) {
      print('Erro ao editar usuário: $e');
    }
  }

  // Método para fechar a conexão
  Future<void> close() async {
    await db.close();
    print('Conexão fechada.');
  }
}
