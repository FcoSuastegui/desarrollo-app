import 'package:flutter/material.dart';
import 'package:midesarrollo/src/preferences/preferences.dart';
import 'package:midesarrollo/src/widgets/Scaffold_template.dart';

class EstadoCuentaPage extends StatelessWidget {

  static final String routeName = 'estado-cuenta';
  final _prefs = new Preferencias();


  @override
  Widget build(BuildContext context) {
    _prefs.pagina = routeName;
    return ScaffoldTemplate( 
      title: Text('Estado de cuenta'),
      body: _estadoCuenta(),
    );
  }

  Widget _estadoCuenta() {
    return Container();
  }


  Widget padding(Widget widget, double valor) {
    return Padding(padding: EdgeInsets.all(valor), child: widget);
  } 

 /*  _crearBoton(BuildContext context ) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () => Navigator.pushNamed(context, 'producto'),
    );
   } */

  
}