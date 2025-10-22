 import 'database_helper.dart';
import '../usuario.dart';

class UsuarioDAO{


  static  Usuario usuarioLogado = Usuario();

  static Future<bool> autenticar (String login, String senha) async {
    final db = await DatabaseHelper.getDataBase();

    final resultado = await db.query(
        'tb_usuario',
        where: 'nm_login = ? and ds_senha = ?',
        whereArgs: [Login, senha]
    );

    usuarioLogado.codigo = resultado.first['cd_usuario'] as int;
    usuarioLogado.nome = resultado.first['nm_usuario'] as String;
    usuarioLogado.login = resultado.first['nm_login'] as String;
    usuarioLogado.senha = resultado.first['ds_senha'] as String;

    return resultado.isNotEmpty;
  }
}