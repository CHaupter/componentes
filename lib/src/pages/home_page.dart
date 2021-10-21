//import 'dart:js';

import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icono_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
        centerTitle: true,
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    // print(menuProvider.opciones);
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ListView(
          children: _listaItems(snapshot.data, context),
        );
      },
    );
    //return ListView(children: _listaItems());
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];
    data.forEach(
      (element) {
        final widgetTemp = ListTile(
          title: Text(element['ruta']),
          //La siguiente linea podría tener problemas
          leading: getIcon(element['icon']),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.pushNamed(context, element['ruta']);
            // final route = MaterialPageRoute(
            //   builder: (context) {
            //     return AlertPage();
            // Navigator.push(context, route);
          },
        );
        opciones.add(widgetTemp);
      },
    );
    return opciones;
  }
}
