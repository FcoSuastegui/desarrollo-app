import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:midesarrollo/src/helpers/get_storage.dart';
import 'package:midesarrollo/src/helpers/network.dart';
import 'package:midesarrollo/src/models/notificacion_model.dart';
import 'package:midesarrollo/src/pages/notificacion/notificacion_contenido.dart';

class NotificacionController extends GetxController {
  NotificacionController._internal();
  static NotificacionController _instance = NotificacionController._internal();
  static NotificacionController get instance => _instance;

  RxInt _counter = 0.obs;
  RxInt get counter => _counter;

  RxList<NotificacionModel> _notificaciones = List<NotificacionModel>().obs;
  RxList<NotificacionModel> get notificaciones => _notificaciones;

  RxBool _loading = false.obs;
  RxBool get loading => _loading;

  NotificacionModel _notificacion;
  NotificacionModel get notificacion => _notificacion;

  @override
  void onInit() {
    listarNotificaciones();
    super.onInit();
  }

  Future<void> listarNotificaciones() async {
    _loading.value = true;
    final Response response = await Network.instance.post(
      'app/listarNotificaciones',
      {
        'idusuario': GetStorages.instance.idusuario,
        'sistema': GetStorages.instance.sistema,
      },
    );

    if (response.statusCode == 200) {
      _notificaciones.value = [];
      response.data['data'].forEach(
          (item) => _notificaciones.add(NotificacionModel.fromJson(item)));
    }
    _loading.value = false;
    totalNotificaciones();
  }

  Future<void> totalNotificaciones() async {
    final Response response = await Network.instance.post(
      'app/totalNotificaciones',
      {
        'idusuario': GetStorages.instance.idusuario,
        'sistema': GetStorages.instance.sistema,
      },
    );

    if (response.statusCode == 200) {
      _counter.value =
          response.data['status'] ? int.parse(response.data['total']) : 0;
    }
  }

  Future<void> leerNotificacion(int id) async {
    final Response response = await Network.instance.post(
      'app/leerNotificacion',
      {
        "idnotificacion": id,
      },
    );

    response.statusCode == 200
        ? listarNotificaciones()
        : listarNotificaciones();
  }

  void seleccionarNotificacion( NotificacionModel notificacion ) {
    _notificacion = notificacion;
    Get.to(NotificacionContenido());
  }
}
