import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key? key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorNum = 0.0;
  String urlImagen =
      "https://w7.pngwing.com/pngs/22/790/png-transparent-batman-family-catwoman-robin-comics-batman-heroes-superhero-comic-book.png";

  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slider Page"),
      ),
      body: Container(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            children: <Widget>[
              _crearSlider(),
              _crearCheckBox(),
              _crearSwitch(),
              Expanded(
                child: _crearImagen(),
              ),
            ],
          )),
    );
  }

  Widget _crearSlider() {
    return Slider(
        activeColor: Colors.blue,
        label: "Tamaño de la imagen",
        divisions: 20,
        value: _valorNum,
        min: 0.0,
        max: 100.0,
        onChanged: (_bloquearCheck)
            ? null
            : (valor) {
                setState(() {
                  _valorNum = valor;
                });
              });
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage(urlImagen),
      fit: BoxFit.contain,
      width: _valorNum,
    );
  }

  Widget _crearCheckBox() {
    return CheckboxListTile(
        title: Text("Bloquear checkbox"),
        value: _bloquearCheck,
        onChanged: (valor) {
          setState(() {
            _bloquearCheck = valor!;
          });
        });
  }

  Widget _crearSwitch() {
    return SwitchListTile(
        title: Text("Bloquear switch"),
        value: _bloquearCheck,
        onChanged: (valor) {
          setState(() {
            _bloquearCheck = valor;
          });
        });
  }
}
