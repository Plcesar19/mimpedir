import 'package:mimpedir/banco/database_helper.dart';
import 'package:mimpedir/banco/tipo_DAO.dart';
import 'package:mimpedir/banco/usuario_dao.dart';
import '../restaurante.dart';
import '../tipo.dart';

class RestauranteDAO {

  static Future<void> atualizar(int? cd, String? nome, String? lat, String long, int? tipo) async{
    final db = await DatabaseHelper.getDataBase();
    final resultado = await db.update('tb_restaurante',
    {
      'nm_restaurante': nome,
      'latitude_restaurante': lat,
      'longitude_restaurante': long,
      'cd_tipo': tipo
    },
        where: 'cd_restaurante = ?',
        whereArgs: [cd]
    );
  }

static Future<Restaurante> listar(int? cd) async {
  final db = await DatabaseHelper.getDataBase();
  final resultado = await db.query('tb_restaurante',
      where: 'cd_restaurante = ?',
      whereArgs: [cd]
  );
  return Restaurante(
    codigo: resultado.first['cd_restaurante'] as int,
    nome: resultado.first['nm_restaurante'] as String,
    latitude: resultado.first['latitude_restaurante'] as String,
    longitude: resultado.first['longitude_restaurante'] as String,
    culinaria: await tipoDAO.listar(resultado.first['cd_tipo'] as int) as Tipo
  );
}

  static Future<void> excluir(Restaurante r) async{
    final db = await DatabaseHelper.getDataBase();
    final resultado = db.delete('tb_restaurante',
       where: 'cd_restaurante = ?',
        whereArgs: [r.codigo]
    );
}

  static Future<List<Restaurante>> listarTodos() async {
    final db = await DatabaseHelper.getDataBase();
    final resultado = await db.query('tb_restaurante',
      where: 'cd_usuario =?',
          whereArgs: [UsuarioDAO.listar(cd) ]
    );

    return resultado.map((mapa){
      return Restaurante(
        codigo: mapa['cd_restaurante'] as int,
        nome: mapa['nm_restaurante'] as String
      );
    }).toList();
}

static Future<int> cadastrarRestaurante(String? nome, String? latitude,
String? longitude, int? tipo) async
{

final db = await
DatabaseHelper.getDataBase();

final dadosRestaurantes = {

  'nm_restaurante': nome,
  'latitude_restaurante': latitude,
  'longitude_restaurante': longitude,
  'cd_tipo': tipo,
  'cd_usuario': UsuarioDAO.usuarioLogado.codigo
};
try {
final idRestaurante = await db.insert('tb_restaurante', dadosRestaurantes);
return idRestaurante;
}catch(e){
print("Erro ao Cadastrar: $e");
return -1;
}

}
}