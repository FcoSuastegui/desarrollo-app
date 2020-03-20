import 'package:flutter/material.dart';
import 'package:midesarrollo/src/models/saldos_model.dart';
import 'package:midesarrollo/src/preferences/preferences.dart';
import 'package:midesarrollo/src/providers/saldos_provider.dart';

import 'package:midesarrollo/src/utils/utils.dart';
import 'package:midesarrollo/src/widgets/Scaffold_template.dart';

class SaldosPage extends StatelessWidget {

  static final String routeName = 'saldos';
  final saldosProvider = new SaldosProvider(); 
  final _prefs = new Preferencias();

  @override
  Widget build(BuildContext context) {
    _prefs.pagina = routeName;
    return ScaffoldTemplate( 
      title: Text('Saldo'),
      body: _saldos(),
    );
  }

  Widget _saldos() {
    return SingleChildScrollView(
        child: FutureBuilder(
            future: saldosProvider.cargarSaldos(),
            builder: (BuildContext context, AsyncSnapshot<List<SaldosModel>> snapshot) {
              if( snapshot.hasData ){
                final avisos = snapshot.data;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: avisos.length,
                  itemBuilder: (context, i) => _listaSaldos(avisos[i], context )
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          )
       );
  }
  Widget _listaSaldos(SaldosModel saldos, context) {
    return Column(
          children: <Widget>[
            _card('Cuota ordinaria', saldos.cuotaord),
            _card('Cuota Extraordinaria', saldos.cuotaext),
            _card('Saldo actual', saldos.saldo),
            _historial(context)
      ]);
  }

  Widget _card(String cuota, String saldo){
    return Container(
      width: 450.0,
      height: 70.0,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10.0)),color: Colors.teal),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            padding( Text(cuota, softWrap: true, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22.0), textAlign: TextAlign.center,), 5.0),
            Text(saldo, softWrap: true, style: TextStyle(color: Colors.white, fontSize: 20.0), textAlign: TextAlign.center,),
            ],
          ) 
        );
  }

  Widget _historial(BuildContext context){
    
    return  InkWell (
      onTap: () => consultarSaldos(context),
      child:Container(
        width: 450.0,
        height: 90.0,
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10.0)),color: Colors.teal),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              padding( Text('Descargar historial de pago', softWrap: true, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22.0), textAlign: TextAlign.center,), 5.0),
                Icon( Icons.file_download, color: Colors.white,)
              ],
            ) 
          )
    );
  }


  consultarSaldos(BuildContext context) async {
    final pdf = await saldosProvider.consultarSaldos();

    if( pdf['status'] ) {
      navigatorLaunch(pdf['file']);
    } else {
      _confimacion(context, pdf['mensaje']);
    }
  }


  Widget padding(Widget widget, double valor) {
    return Padding(padding: EdgeInsets.all(valor), child: widget);
  }

Future<void> _confimacion(BuildContext context, String texto) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Error'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(texto),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Continuar'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
} 
  
}