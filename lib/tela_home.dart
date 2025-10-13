import 'package:flutter/material.dart';
import 'package:mimpedir/banco/restaurante_DAO.dart';
import 'package:mimpedir/tela_cad_restaurante.dart';
import '../restaurante.dart';

class TelaHome extends StatefulWidget {
 const  TelaHome({super.key});

@override
  State<TelaHome> createState() => TelaHomeState();
}

class TelaHomeState extends State<TelaHome> {
  List<Restaurante> restaurante = [];

  @override
  void initState() {
    super.initState();
    carregarRestaurantes();
  }

  Future<void> carregarRestaurantes() async {
    final lista = await RestauranteDAO.listarTodos();
    setState(() {
      restaurante = lista;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista de Restaurantes"),
      actions: [
        IconButton(onPressed: (){
       Navigator.push(context, MaterialPageRoute(builder: (context) => TelaCadRestaurante()));
    },
      icon: Icon(Icons.add),
    )
    ],
      ),
       body:Padding(padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: restaurante.length,
          itemBuilder: (context, index) {
            final r = restaurante[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                title: Text(r.nome ?? 'Sem nome'),
                subtitle: Text('ID: ${r.codigo}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blue),
                      onPressed: () {
                        //TODO: Editar restaurante
                      },
                    ), //IconButton
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        // TODO: Excluir restaurante
                      },
                    ),
                  ],
                ),
              ),
            );
          }

        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        MaterialPageRoute(builder: (context) => TelaCadRestaurante());
      },
        child: Icon(Icons.add)
    ),
        bottomNavigationBar: BottomNavigationBar(items: const<BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Adcionar'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Adcionar'),

        ],
        ),

    );
}
}