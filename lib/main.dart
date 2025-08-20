import 'package:flutter/material.dart';
import 'usuario.dart';
import 'restaurante.dart';
import 'tipo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    Usuario u =  Usuario(
      codigo: 1,
      login: "Rodolfo123",
      nome: "Rodolfo" ,
      senha: "@senhaforte123"
    );

    Tipo t = Tipo(
      codigo:1,
      nome: "japonesa"
    );

    Restaurante r = Restaurante(
      codigo:1,
      nome:"Balu Restaurante",
        latitude: "22.6632",
      longitude: "23.4432",
        proprietario: u,
        tipo: t
    );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
        title: const Text("Meus Dados: "),
      ),
        body: Center(
          child: Padding(padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Text("Nome: ${u.nome}"),
                Text("Código: ${u.codigo}"),
                Text("login:${u.login}"),
                Text("senha: ${u.senha}"),
                Text("Proprietario ${r.proprietario?.nome}"),
                Text("Tipo${r.tipo?.nome}")
              ],
        ),
      ),
        ),
      ),
    );
  }
}
