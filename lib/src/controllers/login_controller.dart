import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:midesarrollo/src/helpers/get_storage.dart';
import 'package:midesarrollo/src/helpers/network.dart';
import 'package:midesarrollo/src/models/usuario_model.dart';

class LoginController extends GetxController {
  LoginController._internal();
  static LoginController _instance = LoginController._internal();
  static LoginController get instance => _instance;


  Future<Map<String, dynamic>> login(Map<String, dynamic> data) async {
    Map<String, dynamic> respuesta = {'status': false, 'message': ''};
    try {
      final Response response = await Network.instance.post('app/login', data);
      if (response.statusCode == 200) {
        if (response.data['status']) {
          final usuario = UsuarioModel.fromJson(response.data['data']);
          GetStorages.instance.token = response.data['token'];
          GetStorages.instance.idusuario = usuario.id;
          GetStorages.instance.usuario = usuario.usuario;
          GetStorages.instance.nombreCompleto = usuario.nombreCompleto;
          GetStorages.instance.nombre = 'home';
          GetStorages.instance.avatar = usuario.photo;
          GetStorages.instance.correo = usuario.correo;
          GetStorages.instance.idpropietario = usuario.idpropietario;
          GetStorages.instance.sistema = usuario.sistema;
          GetStorages.instance.temp = usuario.temp;
          GetStorages.instance.pagina = GetStorages.instance.onboarding == 1 ? '/onboarding' : '/home';

          respuesta['status'] = true;
          respuesta['data'] =
              GetStorages.instance.onboarding == 1 ? 'onboarding' : 'home';

          //FirebaseNotificationProvider.sendToken();
          //FirebaseNotificationProvider.initNotification();

        } else {
          respuesta['message'] = response.data['error'];
        }
      } else {
        respuesta['message'] =
            'Error con la comunicación con el servidor, favor de comunicarlo con el área de soporte.';
      }
    } on Exception catch (exception) {
      print(exception);
      respuesta['message'] =
          'Error con la comunicación con el servidor, favor de comunicarlo con el área de soporte.'; // only executed if error is of type Exception
    } catch (error) {
      respuesta['message'] =
          'Error con la comunicación con el servidor, favor de comunicarlo con el área de soporte.';
      print(error); // executed for errors of all types other than Exception
    }
    return respuesta;
  }
}
