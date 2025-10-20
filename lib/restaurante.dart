import 'package:mimpedir/usuario.dart';
import 'tipo.dart';


class Restaurante{

  int? _codigo;
  String? _nome;
  String? _latitude;
  String? _longitude;
  Usuario? _proprietario;
  Tipo?  _tipo;

  Restaurante({int? codigo, String? nome, String? latitude, String? longitude,
    Usuario? proprietario, Tipo? tipo, required culinaria}) {

    _codigo = codigo;
    _nome = nome;
    _latitude = latitude;
    _longitude = longitude;
    _proprietario = proprietario;
    _tipo = tipo;
  }
  //getters
//metodo ao estilo dart
int? get codigo => _codigo;
  String? get nome => _nome;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  Usuario? get proprietario => _proprietario;
  Tipo? get tipo => _tipo;

  get culinaria => null;
  //setters
//metodo ao estilo dart
set codigo(int? codigo) => _codigo = codigo;
set nome(String? nome) => _nome = nome;
set latitude(String? latitude) => _latitude = latitude;
set longitude(String? longitude) => _longitude = longitude;
set proprietario(Usuario? proprietario) => _proprietario = proprietario;
set tipo (Tipo? tipo) => _tipo;

}