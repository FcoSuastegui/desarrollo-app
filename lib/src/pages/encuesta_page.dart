import 'package:flutter/material.dart';
import 'package:midesarrollo/src/preferences/preferences.dart';
import 'package:midesarrollo/src/widgets/Scaffold_template.dart';

class EncuestaPage extends StatelessWidget {

  static final String routeName = 'encuesta';
  final _prefs = new Preferencias();

  @override
  Widget build(BuildContext context) {
    _prefs.pagina = routeName;
    return ScaffoldTemplate( 
      title: Text('Encuesta'),
      body: _encuesta(),
    );
  }

  Widget _encuesta() {
    return Container();
  }

  Widget padding(Widget widget, double valor) {
    return Padding(padding: EdgeInsets.all(valor), child: widget);
  } 
}