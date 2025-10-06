import 'package:flutter/material.dart';

class EditarRestaurante extends StatelessWidget{
  EditarRestaurante({super.key});

@override
  Widget build(BuildContext context){
  return Scaffold(
      appBar: AppBar(title: const Text("Editar Restaurante")),
       body: Padding(padding: const EdgeInsets.all(30),
       child: Column(
       mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("Editar aqui as informações de seu restaurante: "),
        SizedBox(height: 30),
        Text("Código do restaurante"),
        DropdownButtonFormField(
            items:
        [
          DropdownMenuItem(value: "cd", child: Text("cd")),
        ], onChagend: (value) {}),

         ),
       ),
  );
}
}