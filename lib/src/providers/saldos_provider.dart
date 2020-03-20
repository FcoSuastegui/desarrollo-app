
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:midesarrollo/src/models/saldos_model.dart';
import 'package:midesarrollo/src/preferences/preferences.dart';

class SaldosProvider {

  final _prefs  = new Preferencias();

  Future<List<SaldosModel>> cargarSaldos() async {
    final url = '${_prefs.server}propietariosapp/saldos/';

    final List<SaldosModel> saldos = new List();

    final data = {
      'idusuario'  : _prefs.idusuario,
      'token'    : _prefs.token  
    };

    final resp = await http.post(url, body: json.encode(data));
    if( resp.statusCode == 200) {
      Map<dynamic, dynamic> body = jsonDecode(resp.body);
      final saldosTempo = SaldosModel.fromJson(body['data']);
      saldos.add(saldosTempo);
    }
    return saldos;
  }

  Future <Map<String, dynamic>> consultarSaldos() async {

    final url = _prefs.server + 'propietariosapp/saldosPdf';
    final data = {
      'idpropietario' : _prefs.idpropietario,
      'sistema'       : _prefs.sistema
    };

    var respuesta;
    final resp = await http.post(url, body: json.encode(data));

    if( resp.statusCode == 200){
       Map<dynamic, dynamic> body = jsonDecode(resp.body);
       if( body['status'] ) {
         respuesta = { 'file': body['file'], 'status': true };
       } else {
         respuesta =  { 'status': false, 'mensaje': 'Hubo un error al cargar el archivo' };
       }
    } else {
         respuesta =  { 'status': false, 'mensaje': 'Hubo un error al cargar el archivo' };
    }

    return respuesta;


  }

}