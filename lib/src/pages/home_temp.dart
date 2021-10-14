import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opciones = ['uno', 'dos', 'tres', 'cuatro', 'cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ComponentesTemp'),
      ),
      body: ListView(children: _crearItemsCorta()),
    );
  }

  List<Widget> _crearItems() {
    List<Widget> lista = [];
    for (var opt in opciones) {
      final tempwidget = ListTile(title: Text(opt));
      lista.add(tempwidget);
      lista.add(Divider());
    }
    return lista;
  }

  List<Widget> _crearItemsCorta() {
    var lista = opciones
        .map((item) => Column(
              children: [
                ListTile(
                    leading: Icon(Icons.ac_unit),
                    trailing: Icon(Icons.arrow_right),
                    subtitle: Text('Subtitle'),
                    title: Text(item + '!')),
                Divider()
              ],
            ))
        .toList();
    return lista;
  }
}
