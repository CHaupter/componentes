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
  String _opcionSeleccionada = "Volar";
  bool _mostrarPass = false;

  List<String> _poderes = ["Volar", "Rayos X", "Super Aliento", "Super fuerza"];

  TextEditingController _miTextController = TextEditingController();
  TextEditingController _miTextControllerPass = TextEditingController();
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
            _crearDropdown(),
            Divider(),
            _crearPersona(),
            Divider(),
            _crearBotonPass(),
            Divider(),
            _crearCheckBoxPass(),
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
        prefix: Text("Carlos"),
        icon: Icon(Icons.email),
      ),
      onChanged: (valor) => setState(() {
        _email = valor;
      }),
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: _mostrarPass,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          hintText: "Contraseña de la persona",
          labelText: "Contraseña",
          suffixIcon: Icon(Icons.lock_open),
          icon: Icon(Icons.lock)),
      onChanged: (valor) => setState(() {
        _miTextControllerPass.text = valor;
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
        _miTextController.text = DateFormat('dd-MM-yyyy').format(picked);
      });
    }
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    List<DropdownMenuItem<String>> lista = [];
    _poderes.forEach((element) {
      lista.add(DropdownMenuItem(value: element, child: Text(element)));
    });

    return lista;
  }

  Widget _crearDropdown() {
    return DropdownButton(
      items: getOpcionesDropdown(),
      value: _opcionSeleccionada,
      onChanged: (valor) {
        setState(() {
          _opcionSeleccionada = valor.toString();
        });
      },
    );
  }

  Widget _crearCheckBoxPass() {
    return Container(
        child: CheckboxListTile(
            value: _mostrarPass,
            onChanged: (valor) => setState(() {
                  _mostrarPass = valor!;
                })));
  }

  Widget _crearBotonPass() {
    return ElevatedButton(
        onPressed: () => setState(() {
              _mostrarPass = !_mostrarPass;
            }),
        child: Text("Mostrar/Ocultar Pass"));
  }
}
