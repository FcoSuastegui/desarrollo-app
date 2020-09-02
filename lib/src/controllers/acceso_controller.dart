import 'dart:typed_data';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:midesarrollo/src/helpers/get_storage.dart';
import 'package:midesarrollo/src/helpers/network.dart';
import 'package:midesarrollo/src/models/accesos_model.dart';
import 'package:midesarrollo/src/routes/routes.dart';

class AccesoController extends GetxController {
  AccesoController._internal();
  static AccesoController _instance = AccesoController._internal();
  static AccesoController get instance => _instance;

  RxList<AccesosModel> _accesos = List<AccesosModel>().obs;
  RxList<AccesosModel> get accesos => _accesos;

  AccesosModel _accesoSeleccionado;
  AccesosModel get accesoSeleccionado => _accesoSeleccionado;

  RxBool _loading = false.obs;
  RxBool get loading => _loading;

  List<Widget> _actions = [
    IconButton(
      icon: Icon(Icons.add_circle, color: Colors.white),
      onPressed: () => Routes.instance.getRoute('acceso-add'),
    ),
  ];

  List<Widget> get actions => _actions;

  List<Widget> _actionsContenido;
  List<Widget> get actionsContenido => _actionsContenido;

  GlobalKey _globalKey = new GlobalKey();
  GlobalKey get globalKey => _globalKey;

  @override
  void onInit() {
    _actionsContenido = [
      IconButton(
        icon: Icon(Icons.share, color: Colors.white),
        onPressed: () async {
          await captureAndSharePng();
        },
      )
    ];
    obtenerAccesos();
    super.onInit();
  }

  Future<void> obtenerAccesos() async {
    _loading.value = true;
    final Response response = await Network.instance.post(
      'app/accesos',
      {
        'idpropietario': GetStorages.instance.idpropietario,
        'sistema': GetStorages.instance.sistema
      },
    );

    if (response.statusCode == 200) {
      _accesos.value = [];
      response.data['data'].forEach(
        (item) => _accesos.add(
          AccesosModel.fromJson(item),
        ),
      );
    }
    _loading.value = false;
  }

  Future<Map<String, dynamic>> cambiarAccesos(int idacceso, bool activo) async {
    final Response response = await Network.instance.post(
      'app/cambiarAccesos',
      {
        'idpropietario': GetStorages.instance.idpropietario,
        'idacceso': idacceso,
        'activo': activo,
        'sistema': GetStorages.instance.sistema
      },
    );
    Map<String, dynamic> respuesta = {'status': false};

    if (response.statusCode == 200) {
      respuesta = response.data;
    }
    await obtenerAccesos();
    return respuesta;
  }

  Future<Map<String, dynamic>> addAccesos(Map<String, dynamic> add) async {
    add['idpropietario'] = GetStorages.instance.idpropietario;
    final Response response = await Network.instance.post('app/addAcceso', add);

    Map<String, dynamic> respuesta = {'status': false, 'message': ''};
    if (response.statusCode == 200) {
      respuesta = response.data;
    }
    await obtenerAccesos();
    return respuesta;
  }

  void goToContent(AccesosModel acceso) {
    _accesoSeleccionado = acceso;
    Routes.instance.getRoute('acceso-contenido');
  }

  Future<void> captureAndSharePng() async {
    try {
      RenderRepaintBoundary boundary =
          _globalKey.currentContext.findRenderObject();
      var image = await boundary.toImage();
      ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();

      await Share.file(
          'Imagen generada del QR', 'qr_imagen.png', pngBytes, 'image/png',
          text:
              'Acceso a ${_accesoSeleccionado.visitante} mediante la app. \n' +
                  "Acceso generado para el dia ${_accesoSeleccionado.dia} \n" +
                  "A la hora establecida ${_accesoSeleccionado.hora} \n");
    } catch (e) {
      print(e.toString());
    }
  }
}
