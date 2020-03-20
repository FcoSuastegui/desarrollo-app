import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:midesarrollo/src/models/usuario_model.dart';
import 'package:midesarrollo/src/preferences/preferences.dart';

class LoginProvider {

  final _prefs = new Preferencias();

  Future<Map<String, dynamic>> login(String username, String password) async {

    final url = '${_prefs.server}sesion/login';

    final data = {
      'username'  : username,
      'password'  : password
    };
    var respuesta;
    try {
      final resp = await http.post(url, body: json.encode(data));
        if( resp.statusCode == 200){
          Map<dynamic, dynamic> body = jsonDecode(resp.body);
          if( body['status'] ) {
              final usuario = UsuarioModel.fromJson(body['data']);
            _prefs.token           = usuario.token;
            _prefs.idusuario       = usuario.id;
            _prefs.usuario         = usuario.usuario;
            _prefs.nombreCompleto  = usuario.nombreCompleto;
            _prefs.nombre          = usuario.nombre;
            _prefs.avatar          = _prefs.url + '/' +usuario.photo;
            _prefs.correo          = usuario.correo;
            _prefs.idpropietario   = usuario.idpropietario;
            _prefs.sistema         = usuario.sistema;
            _prefs.pagina          = 'onboarding';

            respuesta =  { 'status': true, 'data': body['data'] };
          } else {
            respuesta =  { 'status': false, 'mensaje': body['error']};
          }
        } else {
          respuesta =  { 'status': false, 'mensaje': 'Hubo un error con la conexión con servidor verifique si la url de prueba es correcta' };
        }
        
    } on Exception catch (exception) {
      print( exception );
      respuesta =  { 'status': false, 'mensaje': 'Hubo un error con la conexión con servidor verifique si la url de prueba es correcta' }; // only executed if error is of type Exception
    } catch (error) {
      respuesta =  { 'status': false, 'mensaje': 'Hubo un error con la conexión con servidor verifique si la url de prueba es correcta' };
      print( error ); // executed for errors of all types other than Exception
    }
    
    return respuesta;
   
  }
}