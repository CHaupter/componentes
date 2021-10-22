import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CardPage'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          _cardTipo1(context),
          SizedBox(
            height: 30.0,
          ),
          _cardTipo2(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget _cardTipo1(BuildContext context) {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            leading: Icon(Icons.photo_album),
            title: Text("Soy el título de esta tarjeta"),
            subtitle: Text("Soy el subtítulo"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: null, child: Text("Cancelar")),
              TextButton(
                  onPressed: () => _mostrarBandera(context), child: Text("OK"))
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    final card = Container(
        child: Column(
      children: <Widget>[
        FadeInImage(
          placeholder: AssetImage('assets/loadin.gif'),
          image:
              NetworkImage('https://i.ytimg.com/vi/09BKjKu1QUA/hqdefault.jpg'),
          fadeInDuration: Duration(milliseconds: 200),
          imageErrorBuilder: (context, error, stackTrace) =>
              Image(image: AssetImage('assets/1200px-Error.png')),
          placeholderErrorBuilder: (context, error, stackTrace) =>
              Image(image: AssetImage('assets/1200px-Error.png')),
          height: 300.0,
          fit: BoxFit.contain,
        ),
        Container(
            padding: EdgeInsets.all(10.0),
            child: Text("No tengo idea de qué poner"))
      ],
    ));

    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: Colors.red,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.red,
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                  offset: Offset(2.0, 10.0))
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: card,
        ));
  }

  _mostrarBandera(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              title: Text("Andalucía"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image(
                    image: AssetImage("assets/bandera.png"),
                  )
                ],
              ));
        });
  }
}
