
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:midesarrollo/src/models/escrituras_model.dart';
import 'package:midesarrollo/src/preferences/preferences.dart';

class EscriturasProvider {

  final _prefs  = new Preferencias();

  Future<List<EscriturasModel>> cargarAvisos() async {
    final url = '${_prefs.server}propietariosapp/datosEscrituras';

    final List<EscriturasModel> escrituras = new List();

    final data = {
      'idusuario'  : _prefs.idusuario,
      'token'    : _prefs.token  
    };

    final resp = await http.post(url, body: json.encode(data));
    if( resp.statusCode == 200) {
      Map<dynamic, dynamic> body = jsonDecode(resp.body);
      if( body['data'].length > 0 ) {
        final escrituraTemp = EscriturasModel.fromJson(body['data']);
        escrituras.add(escrituraTemp);
      }
    }
    return escrituras;
  }

}