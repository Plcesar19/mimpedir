class Tipo{
  int? _codigo;
  String? _nome;


Tipo ({int? codigo, String? nome}) {
  _codigo = codigo;
  _nome = nome;
}
//getters
//metodo ao estilo dart


int? get codigo => _codigo;

String? get nome => _nome;

//setters
//metodo set ao estilo dart

set cd(int? cd) => _codigo = cd;


set nome(String? nome) => _nome = nome;
}