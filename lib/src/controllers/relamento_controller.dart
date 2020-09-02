import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:midesarrollo/src/helpers/get_storage.dart';
import 'package:midesarrollo/src/helpers/helper.dart';
import 'package:midesarrollo/src/helpers/network.dart';

class ReglamentoController extends GetxController {
  ReglamentoController._internal();
  static ReglamentoController _instance = ReglamentoController._internal();
  static ReglamentoController get instance => _instance;

  RxString _url = ''.obs;
  RxString get url => _url;

  RxBool _loading = false.obs;
  RxBool get loading => _loading;

  @override
  void onInit() {
    obtenerReglamento();
    super.onInit();
  }

  Future<void> obtenerReglamento() async {
    _loading.value = true;
    final Response response = await Network.instance.post(
      'app/avisoPrivacidad',
      {
        'idpropietario': GetStorages.instance.idpropietario,
        'sistema': GetStorages.instance.sistema,
      },
    );

    if (response.statusCode == 200) {
      _url.value = response.data['status'] ? response.data['file'] : '';
    }
    _loading.value = false;
  }

  Future<void> launchInBrowser() async {
    final Map<String, dynamic> respuesta =
        await Helper.launchInBrowser(_url.value);
    if (!respuesta['status']) {
      Get.snackbar('Mi desarrollo', respuesta['message']);
    }
  }
}
