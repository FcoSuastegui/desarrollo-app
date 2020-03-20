import 'package:flutter/material.dart';
import 'package:midesarrollo/src/models/documento_model.dart';
import 'package:midesarrollo/src/preferences/preferences.dart';
import 'package:midesarrollo/src/providers/documentos_provider.dart';
import 'package:midesarrollo/src/utils/utils.dart';
import 'package:midesarrollo/src/widgets/Scaffold_template.dart';

class DocumentacionPage extends StatelessWidget {

  static final String routeName = 'documentacion';
  final _prefs = new Preferencias();
  final documentacion = new DocumentosProvider();

  @override
  Widget build(BuildContext context) {
    _prefs.pagina = routeName;
    return ScaffoldTemplate(
        title: Text('Documentación'), 
        body: _documentacion()
      );
  }

  Widget _documentacion() {
    return SingleChildScrollView(
        child: FutureBuilder(
            future: documentacion.cargarDocumentos(),
            builder: (BuildContext context, AsyncSnapshot<List<DocumentoModel>> snapshot) {
              if( snapshot.hasData ){
                final documentos = snapshot.data;
                if( documentos.length > 0 ) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: documentos.length,
                    itemBuilder: (context, i) => _card(documentos[i])
                  );
                } else {
                  return _noDocumentos();
                }

              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          )
       );
  }

  Widget _card(DocumentoModel documento){
    final documentos = '${_prefs.url}/${documento.ruta}';
    return  InkWell (
      onTap: () => navigatorLaunch(documentos),
      child: Container(
        width: 450.0,
        height: 70.0,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10.0)),color: Colors.teal),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              padding( Text(documento.catalogo, softWrap: true, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22.0), textAlign: TextAlign.center,), 5.0),
              Icon( Icons.file_download, color: Colors.white,)
              ],
            ) 
          )
    );
  }

  Widget _noDocumentos(){
    return  Container(
        width: 450.0,
        height: 70.0,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10.0)),color: Colors.teal),
        child: Stack(
            children: <Widget>[
              Container( 
                alignment: Alignment.center,
                child: padding( Text('Sin documentos', softWrap: true, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22.0), textAlign: TextAlign.center,), 5.0),
              ),
              Positioned( 
                child: Icon( Icons.warning, color: Colors.white,),
                left: 40.0,
                top: 22.0,
              ) 
            ],
      ) 
    );
  }

  Widget padding(Widget widget, double valor) {
    return Padding(padding: EdgeInsets.all(valor), child: widget);
  }
  
}