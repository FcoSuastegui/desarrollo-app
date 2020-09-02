import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'dart:typed_data';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:midesarrollo/src/helpers/get_storage.dart';
import 'package:midesarrollo/src/helpers/network.dart';
import 'package:midesarrollo/src/models/publicaciones_model.dart';

class PublicacionController extends GetxController {
  PublicacionController._internal();
  static PublicacionController _instance = PublicacionController._internal();
  static PublicacionController get instance => _instance;

  RxList<PublicacionesModel> _publicaciones = List<PublicacionesModel>().obs;
  RxList<PublicacionesModel> get publicaciones => _publicaciones;

  RxBool _loading = false.obs;
  RxBool get loading => _loading;

  @override
  void onInit() {
    listarPublicaciones();
    super.onInit();
  }

  Future<void> listarPublicaciones() async {
    _loading.value = true;
    final Response response = await Network.instance.post(
      'app/publicaciones',
      {
        'idusuario': GetStorages.instance.idusuario,
        'sistema': GetStorages.instance.sistema,
      },
    );

    if( response.statusCode == 200 ) {
      _publicaciones.value = [];
      response.data['data'].forEach((item) => _publicaciones.add( PublicacionesModel.fromJson(item)));
    }
    _loading.value = false;

  }

  Future captureAndSharePng({ GlobalKey key}) async {
    try {
      
      RenderRepaintBoundary boundary = key.currentContext.findRenderObject();
      var image = await boundary.toImage();
      ByteData byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();
      await Share.file('Publicaciones', 'share_publicaciones.png', pngBytes, 'image/png');
    } catch (e) {
      print(e.toString());
    }
  }
}
