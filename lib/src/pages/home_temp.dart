import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opciones = {"Uno", "Dos", "Tres", "Cuatro", "Cinco"};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("ComponentesTemp")),
      body: ListView(children: _crearItemsCorta()),
    );
  }

  List<Widget> _crearItems() {
    List<Widget> lista = [];

    for (var opt in opciones) {
      final tempWidget =
          Column(children: [ListTile(title: Text(opt)), Divider()]);
      lista.add(tempWidget);
    }
    return lista;
  }

  List<Widget> _crearItemsCorta() => opciones
      .map((item) => Column(
            children: [
              ListTile(
                  subtitle: Text("Subtitle"),
                  title: Text("!"),
                  leading: Icon(Icons.ac_unit),
                  trailing: Icon(Icons.arrow_right),
                  onTap: () {
                    print('Hola');
                  }),
              Divider()
            ],
          ))
      .toList();
}
