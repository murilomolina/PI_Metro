import 'package:metro_mobile/data/operacoes_usuario.dart';

class AuthService {
  // Simula o processo de login
  Future<String?> login(String email, String senha) async {
    List<UsuarioApp> usuarios = await consultaUsuariosApp();

    for (final usuario in usuarios) {
      if (usuario.email == email && usuario.senha == senha) {
        return null; // Retorna null se o login for bem sucedido
      }
    }
    return 'Nome de usuário ou senha inválidos'; // Retorna uma mensagem de erro
  }

  // // Simula o processo de cadastro
  // Future<String?> signup(String email, String senha) async {
  //   await Future.delayed(const Duration(seconds: 2)); // Simula um atraso de 2 segundos

  //   List<UsuarioApp> usuarios = await consultaUsuariosApp();

  //   // Verifica se o email já está em uso
  //   for (final usuario in usuarios) {
  //     if (usuario.email == email) {
  //       return 'O nome de usuário já está em uso'; // Retorna uma mensagem de erro
  //     }
  //   }

  //   // Simula a inserção de um novo usuário
  //   try {
  //     await insereUsuarioApp(email, senha);
  //     return null; // Retorna null se o cadastro for bem sucedido
  //   } catch (e) {
  //     return 'Erro ao cadastrar novo usuário!'; // Retorna uma mensagem de erro
  //   }
  // }

  // Simula o processo de recuperação de senha
  Future<String?> recoverPassword(String email) async {
    return await recoverPassword(email); // Chama a função de recuperação de senha definida em operacoes_usuario.dart
  }
}
