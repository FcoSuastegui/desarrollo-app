import 'package:flutter/material.dart';
import 'package:midesarrollo/src/models/escrituras_model.dart';
import 'package:midesarrollo/src/preferences/preferences.dart';
import 'package:midesarrollo/src/providers/escrituras_provider.dart';
import 'package:midesarrollo/src/widgets/Scaffold_template.dart';

class EscriturasPage extends StatelessWidget {

  static final String routeName = 'escrituras';
  final escriturasProvider = new EscriturasProvider(); 
  final _prefs = new Preferencias();

  @override
  Widget build(BuildContext context) {
    _prefs.pagina = routeName;
    return ScaffoldTemplate( 
      title: Text('DATOS DE ESCRITURACIÓN', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
      body: _listaEscrituras(),
    );
  }


  Widget _listaEscrituras() {
    return FutureBuilder(
      future: escriturasProvider.cargarAvisos(),
      builder: (BuildContext context, AsyncSnapshot<List<EscriturasModel>> snapshot) {
        if( snapshot.hasData ){
          final escrituras = snapshot.data;
          if( escrituras.length > 0 ) {
            return ListView.builder(
              itemCount: escrituras.length,
              itemBuilder: (context, i) => _escrituras(escrituras[i])
            );
          } else {
            return _nodatos();
          }

        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _nodatos () {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 80.0,
            margin: EdgeInsets.only(top: 25.0),
            child: ListTile(
              leading: Icon(Icons.report_problem, color: Colors.teal, size: 40.0,),
              title: Text('No hay datos de escrituras')
            )
          ),
        ],
      ),
    );
  }

  Widget _escrituras(EscriturasModel escritura) {
    return Container(
      child: Column(
        children: <Widget>[
            ListTile(
            title: Text('No. de escritura'),
            subtitle: Text(escritura.noEscritura),
          ),
          ListTile(
            title: Text('Fecha de escritura'),
            subtitle: Text(escritura.fechaEscritura),
          ),
          ListTile(
            title: Text('Fecha de entrega'),
            subtitle: Text(escritura.fechaEntrega),
          ),
          ListTile(
            title: Text('Proceso'),
            subtitle: Text(escritura.proceso),
          ),
          ListTile(
            title: Text('Notaria'),
            subtitle: Text(escritura.notaria),
          ),
          ListTile(
            title: Text('Notario'),
            subtitle: Text(escritura.notario),
          ),          
        ],
      )
    );
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