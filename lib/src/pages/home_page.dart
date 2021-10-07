import 'package:componentes/src/providers/menu_provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Componentes")),
      body: _lista(),
    );
  }

  Widget _lista() {
    menuProvider;
  }

  List<Widget> _listaItems() {
    return [
      ListTile(
        title: Text("Hola mundo"),
      ),
      Divider(),
      ListTile(
        title: Text("Hola mundo"),
      ),
      Divider(),
      ListTile(
        title: Text("Hola mundo"),
      ),
    ];
  }
}
