import 'package:flutter/material.dart';
import 'packpage:mimpedir.dart';

import 'banco/tipo_DAO.dart';

class TelaCadRestaurante extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return TelaCadRestauranteState();
  }
}
class TelaCadRestaurante extends State<TelaCadRestaurante>{
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();
  String? culinariaSelecionada;
  List<Tipo> tiposCulinaria = [];
  int? tipoCulinaria;

  void inisState(){
    super.initState();
    carregarTipos();
}

Future<void> carregarTipos() async{
    final lista = await TipoDAO.listarTipos();
    setState(() {
      tiposCulinaria = lista;
    });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cadastro de Restaurante")),
      body: Padding(padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("informações do Restaurante: "),
            SizedBox(height: 40),
            Text("tipo de comida:"),

            DropdownButtonFormField<String>(
              value: culinariaSelecionada,
              items: tiposCulinaria.map((tipo) {
                return DropdownMenuItem<String>(
                value: tipo.nome,
               child: Text("${tipo.nome}")
                );
            }).toList(),
              onChanged: (String? value){
                setState(() {
                  culinariaSelecionada = value;
                  Tipo tipoSelecionado = tiposCulinaria.firstWhere(
                      (tipo) => tipo.descricao == value
                  );
                  tipoCulinaria = tipoSelecionado.codigo;
                });
              }
            ),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Nome do Restaurante'),
              validator: (String? value) {},
            ),
        TextFormField(
          decoration: const InputDecoration(hintText: 'Latitude'),
          validator: (String? value) {},
        ),
        TextFormField(
          decoration: const InputDecoration(hintText: 'Longitude'),
          validator: (String? value) {},
        ),
          SizedBox(height: 50),
            ElevatedButton(onPressed: (){}, child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.save),
        Text("Cadastrar")
      ],
    ))
        ],
      ),
      ),
    );
  }
}