import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputPage extends StatefulWidget {
  InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = "";
  String _email = "";
  String _pass = "";
  String _date = "";
  TextEditingController _miTextController = TextEditingController();
  TextEditingController _miTextControllerCopia = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Inputs de texto"),
        ),
        body: ListView(
          children: <Widget>[
            SizedBox(
              height: 15.0,
            ),
            _crearInput(),
            Divider(),
            _crearEmail(),
            Divider(),
            _crearPassword(),
            Divider(),
            _crearFecha(context),
            Divider(),
            _crearPersona()
          ],
        ));
  }

  Widget _crearInput() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        counter: Text("Letras: ${_nombre.length}"),
        hintText: "Nombre de la persona",
        labelText: "Nombre",
        helperText: "Solo es el nombre",
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
      ),
      onChanged: (valor) => setState(() {
        _nombre = valor;
        _miTextControllerCopia.text = _nombre;
      }),
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text("Nombre es:  $_nombre"),
      subtitle: Text("Email: $_email"),
    );
  }

  Widget _crearEmail() {
    return TextField(
      controller: _miTextControllerCopia,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: "Correo de la persona",
        labelText: "Correo",
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
      ),
      onChanged: (valor) => setState(() {
        _email = valor;
      }),
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: "Contraseña de la persona",
        labelText: "Contraseña",
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock),
      ),
      onChanged: (valor) => setState(() {
        _pass = valor;
      }),
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      controller: _miTextController,
      enableInteractiveSelection: false,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: "Fecha de nacimiento",
        labelText: "Fecha de nacimiento",
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2025),
      locale: Locale("es", "ES"),
    );

    if (picked != null) {
      setState(() {
        _miTextController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }
}
