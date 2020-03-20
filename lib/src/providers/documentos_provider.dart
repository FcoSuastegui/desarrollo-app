import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:midesarrollo/src/models/documento_model.dart';
import 'package:midesarrollo/src/preferences/preferences.dart';

class DocumentosProvider {

  final _prefs = new Preferencias();

  Future<List<DocumentoModel>> cargarDocumentos() async {
    final url = '${_prefs.server}propietariosapp/documentos';

    final List<DocumentoModel> documentos = new List();
    final data = {
      'idpropietario' : _prefs.idpropietario,
      'sistema'       : _prefs.sistema,
      'token'         : _prefs.token  
    };

    final resp = await http.post(url, body: json.encode(data));
    if( resp.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(resp.body);
      for (var item in body['data']) {
        final docuTemp = DocumentoModel.fromJson(item);
        documentos.add(docuTemp);
      }
    }
    return documentos;
  }

}