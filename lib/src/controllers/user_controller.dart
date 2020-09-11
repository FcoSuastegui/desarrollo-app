import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:midesarrollo/src/helpers/get_storage.dart';
import 'package:midesarrollo/src/helpers/network.dart';

class UserController extends GetxController {
  UserController._internal();
  static UserController _instance = UserController._internal();
  static UserController get instance => _instance;

  Future<Map<String, dynamic>> changePassword(String password) async {
    final Response response = await Network.instance.post(
      'app/changepassword',
      {
        'idusuario': GetStorages.instance.idusuario,
        'password': password,
      },
    );
    Map<String, dynamic> respuesta;
    if (response.statusCode == 200) {
      final body = response.data;
      if (body['status']) {
        await GetStorages.instance.clear();
        GetStorages.instance..onboarding = 0;
        respuesta = body;
      } else {
        respuesta = body;
      }
    }
    return respuesta;
  }
}
