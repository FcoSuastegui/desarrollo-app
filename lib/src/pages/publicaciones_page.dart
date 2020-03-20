import 'package:flutter/material.dart';
import 'package:midesarrollo/src/models/publicaciones_model.dart';
import 'package:midesarrollo/src/preferences/preferences.dart';
import 'package:midesarrollo/src/providers/publicaciones_provider.dart';
import 'package:midesarrollo/src/widgets/Scaffold_template.dart';

class PublicacionesPage extends StatelessWidget {

  static final String routeName = 'publicaciones';
  final publicacionesProvider = new PublicacionesProvider(); 
  final _prefs  = new Preferencias();

  @override
  Widget build(BuildContext context) {
    _prefs.pagina = routeName;
    return ScaffoldTemplate( 
      title: Text('Publicaciones'),
      body: _crearLista(),
    );
  }


  Widget _crearLista() {
    return FutureBuilder(
      future: publicacionesProvider.cargarPublicaciones(),
      builder: (BuildContext context, AsyncSnapshot<List<PublicacionesModel>> snapshot) {
        if( snapshot.hasData ){
          final publicaciones = snapshot.data;
          if( publicaciones.length > 0 ) {
            return ListView.builder(
              itemCount: publicaciones.length,
              itemBuilder: (context, i) => _crearItem(publicaciones[i])
            );
          } else {
              return _noAvisos();
          }

        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _crearItem(PublicacionesModel publicaciones) {
    return publicaciones.media != '' ? _publicacionesImagenes(publicaciones) : _publicacionesDocumento(publicaciones);
  }

  Widget _publicacionesDocumento( PublicacionesModel publicacion) {
  return Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            padding( ListTile( title: padding(Text('${publicacion.titulo}', style: TextStyle( fontWeight: FontWeight.bold),), 2.0),
                              subtitle: padding(Text('Creado: ${publicacion.fechaPublicacion}'), 3.0)), 10.0),
            padding( Text('${publicacion.mensaje}', style: TextStyle( fontSize: 13.0)),10.0)
          ],
        ),
      );
  }

  Widget _publicacionesImagenes( PublicacionesModel publicacion) {
  return Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            padding( ListTile( title: padding(Text('${publicacion.titulo}', style: TextStyle( fontWeight: FontWeight.bold),), 2.0),
                              subtitle: padding(Text('Creado: ${publicacion.fechaPublicacion}'), 3.0)), 10.0),
            Image(image: new NetworkImage(publicacion.media)),
            padding( Text('${publicacion.mensaje}', style: TextStyle( fontSize: 13.0)),10.0)
          ],
        ),
      );
  }

  Widget _noAvisos() {
    return Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
              Container(
                height: 80.0,
                margin: EdgeInsets.only(top: 25.0),
                child: ListTile(
                      leading: Icon(Icons.report_problem, color: Colors.teal, size: 40.0,),
                      title: Text('No hay publicaciones disponibles')
                )
            ),
          ],
        ),
    );
  }



  Widget padding(Widget widget, double valor) {
    return Padding(padding: EdgeInsets.all(valor), child: widget);
  }   
}