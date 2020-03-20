
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:midesarrollo/src/models/publicaciones_model.dart';
import 'package:midesarrollo/src/preferences/preferences.dart';

class PublicacionesProvider {

  final _prefs = new Preferencias();

  Future<List<PublicacionesModel>> cargarPublicaciones() async {
    final url = '${_prefs.server}propietariosapp/avisos';

    final List<PublicacionesModel> avisos = new List();

    final data = {
      'sistema'  : _prefs.sistema,
      'token'    : _prefs.token  
    };

    final resp = await http.post(url, body: json.encode(data));
    if( resp.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(resp.body);
      for (var item in body['data']) {
        final avisoTemp = PublicacionesModel.fromJson(item);
        avisos.add(avisoTemp);
      }
    }
    
    return avisos;
  }

}