
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:midesarrollo/src/models/perfil_model.dart';
import 'package:midesarrollo/src/preferences/preferences.dart';

class PerfilProvider {

  final _prefs = new Preferencias();

  Future<List<PerfilModel>> cargarPerfil() async {

    final _url = '${_prefs.server}propietariosapp/datosgenerales/';
    final List<PerfilModel> perfil = new List();
    final data = {
      'idusuario'  : _prefs.idusuario,
      'token'      : _prefs.token  
    };

    final resp = await http.post(_url, body: json.encode(data));
    if( resp.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(resp.body);
        final perfilTemp = PerfilModel.fromJson(body['data']);
        perfil.add(perfilTemp);
    }
    return perfil;
  }
}