import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/animated_container.dart';
import 'package:componentes/src/pages/avatar_page.dart';
import 'package:componentes/src/pages/card_page.dart';
import 'package:componentes/src/pages/input_page.dart';
import 'package:componentes/src/pages/listview_page.dart';
import 'package:componentes/src/pages/slider_page.dart';
import 'package:flutter/material.dart';
import 'package:componentes/src/pages/home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Componentes App',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en', 'US'), // English, no country code
          Locale('es', 'ES'), // Spanish, no country code
        ],
        //home: HomePage(),
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          '/': (BuildContext context) => HomePage(),
          'alert': (BuildContext context) => AlertPage(),
          'avatar': (BuildContext context) => AvatarPage(),
          'card': (BuildContext context) => CardPage(),
          'animatedContainer': (BuildContext context) =>
              AnimatedContainerPage(),
          'inputs': (BuildContext context) => InputPage(),
          'slider': (BuildContext context) => SliderPage(),
          'list': (BuildContext context) => ListaPage(),
        });
  }
}
