import 'package:flutter/material.dart';
import 'package:midesarrollo/src/preferences/preferences.dart';
import 'package:midesarrollo/src/utils/icons.dart';
import 'package:midesarrollo/src/widgets/Scaffold_template.dart';


class InicioPage extends StatelessWidget {

  static final String routeName = 'inicio';

  final _prefs = new Preferencias();
  @override
  Widget build(BuildContext context) {
    _prefs.pagina = routeName;
    return ScaffoldTemplate(
      title: Text('Inicio'),
      body: _inicio(context),
    );
  }

  Widget _inicio(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _bienvenido(),
              _imagen(),
              _accesos(),
              SingleChildScrollView(
                child: GridView.count(
                  // Create a grid with 2 columns. If you change the scrollDirection to
                  // horizontal, this produces 2 rows.
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  // Generate 100 widgets that display their index in the List.
                  children: <Widget>[
                    _card(context, 'publicaciones', 'Publicaciones', 'announcement' ),
                    _card(context, 'saldos', 'Saldos', 'attach_money' ),
                    _card(context, 'documentacion', 'Documentos', 'library_books' ),
                    //_card(context, 'encuesta', 'Encuetas', 'thumbs_up_down' )
                    _card(context, 'escrituras', 'Escrituras', 'home' )
                  ]
                )
              )
            ],
          ),
      );  
  }

  Widget _bienvenido() {
    return Container(
      color: Colors.teal,
      height: 55.0,
      width: 450.0,
      child: padding(
      Text('Bienvenido ${ _prefs.nombre }', 
          textAlign: TextAlign.center, style: 
          TextStyle(
            color: Colors.white, 
            fontSize: 18.0, 
            fontWeight: FontWeight.bold)
      ),15.0),
    );
  }
  Widget _imagen() {
    return Container(
      height: 100.0,
      margin: EdgeInsets.only(top: 20.0),
      child: CircleAvatar(
          radius: 50.0,
          backgroundImage:
              NetworkImage('${_prefs.avatar}'),
          backgroundColor: Colors.transparent,
        ),
    );
  }

  Widget _accesos() {
    return Container(
      height: 75.0,
      width: 450.0,
      child: padding(Text('ACCESOS RÁPIDOS', textAlign: TextAlign.center, style: TextStyle(color: Colors.black54, fontSize: 30.0, fontWeight: FontWeight.bold)),15.0),
    );
  }

  Widget _card(BuildContext context, String ruta, String text, String icono, ){

    final iconos = new Iconos();

    return InkWell (
      onTap: () => Navigator.pushReplacementNamed(context, ruta),
      child: Container(
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10.0)),color: Colors.teal),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 60.0,
              margin: EdgeInsets.only(top: 15.0),
              child: padding(Text(text, softWrap: true, style: TextStyle(color: Colors.white, fontSize: 22.0), textAlign: TextAlign.center,),5.0)
            ),
            iconos.icono(icono: icono, size: 45.0)
          ],
        ) 
      )
    );
  }


  Widget padding(Widget widget, double valor) {
    return Padding(padding: EdgeInsets.all(valor), child: widget);
  }

}