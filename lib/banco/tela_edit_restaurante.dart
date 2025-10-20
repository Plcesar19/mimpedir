import 'package:flutter/material.dart';
import 'package:mimpedir/restaurante.dart';
import 'package:mimpedir/tipo.dart';
import 'package:mimpedir/banco/tipo_DAO.dart';


class TelaEditRestaurante extends StatefulWidget {

  static Restaurante restaurante = Restaurante();

  @override
  State<StatefulWidget> createState() {
    return TelaEditRestauranteState();
  }
}
class TelaEditRestauranteState extends State<TelaEditRestaurante>{

  final TextEditingController nomeController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();
  String? culinariaSelecionada;
  List<Tipo> tiposCulinaria = [];
  int? tipoCulinaria;
  int? codigo = TelaEditRestaurante.restaurante.codigo as int;

  void inisState(){
    super.initState();
    carregarTipos();
    cdController.text = TelaEditRestaurante.restaurante.codigo.toString()!;
    nomeController.text = TelaEditRestaurante.restaurante.nome!;
    latitudeController.text = TelaEditRestaurante.restaurante.latitude.toString()!;
    longitudeController.text = TelaEditRestaurante.restaurante.latitude.toString()!;
    tiposCulinaria  = TelaEditRestaurante.restaurante.culinaria?.codigo!;
    culinariaSelecionada = TelaEditRestaurante.restaurante.culinaria?.descricao!;
}

 Future<void> carregarTipos() async{
  final lista = await TipoDAO.listarTipos();
  setState(() {
    tiposCulinaria = lista;,
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (title: const Text ("Atualizar Restaurante")),
      body: Padding(padding: const EdgeInsets.all(30)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Informaçoes do restaurante "),
          SizedBox(height: 40),
          Text('CODIGO'),
          TextField()
        ],
      )
    );