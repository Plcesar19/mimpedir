import 'package:flutter/material.dart';
import 'package:mimpedir/banco/restaurante_DAO.dart';
import 'package:mimpedir/banco/tela_edit_restaurante.dart';
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
       Navigator.push(context,
           MaterialPageRoute(builder: (context) => TelaCadRestaurante())
       );

       if(t == false || t ==null){
         setState(() {
           carregarRestaurantes();
         });
       }
    },
      icon: Icon(Icons.add),
    )
    ],
      ),
       body:Padding(padding: const EdgeInsets.all(20),
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
                      onPressed: () async{
                        //TODO: Editar restaurante
                        TelaEditRestaurante.restaurante = r;
                        Navigator.push(context, MaterialPageRoute(builder: (context) => TelaEditRestaurante()));
                      },
                    ), //IconButton
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                AlertDialog(
                                  title: Text('ATENÇÃO'),
                                  content: Text('CONFIRMAR EXCLUSÃO?'),
                                  actions: [
                                    TextButton(onPressed: () {
                                      Navigator.pop(context);
                                    }, child: Text('cancelar')),
                                    TextButton(onPressed: () {
                                      //aqui foi confirmado pode excluir
                                      RestauranteDAO.excluir(r);
                                      setState(() {
                                        carregarRestaurantes();
                                      });
                                      //fecha o alerta
                                      Navigation.pop(context);
                                    }, child: Text('sim'))
                                  ],
                                )
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
       ),
              floatingActionButton: FloatingActionButton(onPressed: () {
                MaterialPageRoute(builder: (context) => TelaCadRestaurante());
              },
                  child: Icon(Icons.add)
              ),
            );
          }
            }