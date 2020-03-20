import 'package:flutter/material.dart';
import 'package:midesarrollo/src/models/perfil_model.dart';
import 'package:midesarrollo/src/preferences/preferences.dart';
import 'package:midesarrollo/src/providers/perfil_provider.dart';
import 'package:midesarrollo/src/widgets/Scaffold_template.dart';

class PerfilPage extends StatelessWidget {

  static final String routeName = 'perfil';
  final prefs = new Preferencias();
  final perfil = new PerfilProvider();

  @override
  Widget build(BuildContext context) {
    prefs.pagina = routeName;
    return ScaffoldTemplate( 
      title: Text('Mi perfil'),
      body: _perfil(),
    );
  }

  Widget _perfil() {
    return SingleChildScrollView(
        child: _listarDatosGenerales()
      );
  }

  Widget _datosGenerales(PerfilModel perfil) {
    return Container(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text('DATOS GENRALES', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal)),
            ),
            Divider(color: Colors.teal),
            ListTile(
              contentPadding: EdgeInsets.all(15.0),
              leading: CircleAvatar( radius: 32.0, backgroundImage: NetworkImage('${prefs.avatar}'), backgroundColor: Colors.transparent,),
              title: Text('Nombre: ${ perfil.nombre}', style: TextStyle(fontWeight: FontWeight.w500)),
              subtitle:  Text('Correo: ${ perfil.usuario }', style: TextStyle(fontWeight: FontWeight.w500))
            ), 
            ListTile( title: Text('Usuario: ${ perfil.usuario }', style: TextStyle(fontWeight: FontWeight.w300)),), 
            ListTile( title: Text('RFC: ${perfil.rfc}', style: TextStyle(fontWeight: FontWeight.w300)), ), 
            ListTile( title: Text('NSS: ${ perfil.nss }', style: TextStyle(fontWeight: FontWeight.w300)),  ), 
            ListTile( title: Text('No. credito: ${ perfil.numCredito }', style: TextStyle(fontWeight: FontWeight.w300)), )
          ],
        ),
      ),
    );
  }

  Widget _listarDatosGenerales() {
    return FutureBuilder(
      future: perfil.cargarPerfil(),
      builder: (BuildContext context, AsyncSnapshot<List<PerfilModel>> snapshot) {
        if( snapshot.hasData ){
          final perfil = snapshot.data;
          return ListView.builder(
            itemCount: perfil.length,
            shrinkWrap: true,
            itemBuilder: (context, i) => _datosGenerales(perfil[i])
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
  
  Widget padding(Widget widget, double valor) {
    return Padding(padding: EdgeInsets.all(valor), child: widget);
  }

}