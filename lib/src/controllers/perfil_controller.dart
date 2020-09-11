import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:midesarrollo/src/helpers/get_storage.dart';
import 'package:midesarrollo/src/helpers/network.dart';
import 'package:midesarrollo/src/models/perfil_model.dart';

class PerfilController extends GetxController {
  PerfilModel _perfil;
  PerfilModel get perfil => _perfil;

  RxBool _loading = false.obs;
  RxBool get loading => _loading;

  @override
  void onInit() {
    cargarPerfil();
    super.onInit();
  }

  Future<void> cargarPerfil() async {
    _loading.value = true;
    final Response response = await Network.instance.post(
      'app/datosgenerales',
      {
        'idusuario': GetStorages.instance.idusuario,
        'token': GetStorages.instance.token
      },
    );
    
    if (response.statusCode == 200) {
      Map<String, dynamic> body = response.data;
      _perfil = PerfilModel.fromJson(body['data']);
    }
    
    _loading.value = false;
  }
}
