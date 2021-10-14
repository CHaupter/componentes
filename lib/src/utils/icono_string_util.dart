import 'package:flutter/material.dart';

//Poner siempre initialData para que nos funciones con el null safety
final _icons = <String, IconData>{
  'add.alert': Icons.add_alert,
  'accessibility': Icons.accessibility,
  'folder_open': Icons.folder_open,
};

Icon getIcon(String nombreIcono) {
  return Icon(_icons[nombreIcono], color: Colors.blue);
}
