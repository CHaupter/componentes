import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  ListaPage({Key? key}) : super(key: key);

  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  ScrollController _scrollController = new ScrollController();
  List<int> _listaNumeros = [];
  int _ultimoItem = 0;
  bool _isLoading = false;
  bool _esVisible = false;

  @override
  void initState() {
    super.initState();
    _agregar10();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        setState(() {
          _esVisible = true;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista Page"),
      ),
      body: Stack(
        children: [
          _crearLista(),
          _crearLoading(),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [_mostrarBotonRefrescar()],
          )
        ],
      ),
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: () {
        return _obtenerPagina1();
      },
      child: ListView.builder(
        controller: _scrollController,
        itemBuilder: (BuildContext context, int index) {
          final _imagen = _listaNumeros[index];
          return FadeInImage(
              placeholder: AssetImage("assets/loadin.gif"),
              image: NetworkImage(
                  "https://picsum.photos/500/600/?image=$_imagen"));
        },
        itemCount: _listaNumeros.length,
      ),
    );
  }

  Future<void> _obtenerPagina1() async {
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      _listaNumeros.clear();
      _ultimoItem = 1;
      _agregar10();
    });

    return Future.delayed(duration);
  }

  _agregar10() {
    for (var i = 0; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }
    setState(() {});
  }

  Future _fetchData() async {
    _isLoading = true;
    setState(() {});

    final duration = new Duration(seconds: 2);
    return Timer(duration, respuestaHTTP);
  }

  void respuestaHTTP() {
    _isLoading = false;

    _scrollController.animateTo(_scrollController.position.pixels + 100.0,
        curve: Curves.fastOutSlowIn, duration: Duration(milliseconds: 250));
    _agregar10();
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[CircularProgressIndicator()],
          ),
          SizedBox(
            height: 15.0,
          )
        ],
      );
    } else
      return Container();
  }

  _mostrarBotonRefrescar() {
    return Visibility(
        visible: _esVisible,
        child: Container(
          child: ElevatedButton(
              onPressed: () {
                _fetchData();
              },
              child: Text("Refrescar")),
        ));
  }
}
